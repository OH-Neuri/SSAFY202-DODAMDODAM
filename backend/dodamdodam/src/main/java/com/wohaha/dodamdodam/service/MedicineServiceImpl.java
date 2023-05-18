package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.Medicine;
import com.wohaha.dodamdodam.dto.request.*;
import com.wohaha.dodamdodam.dto.response.MedicineClassResponseDto;
import com.wohaha.dodamdodam.dto.response.MedicineInfoResponseDto;
import com.wohaha.dodamdodam.dto.response.MedicineKidResponseDto;
import com.wohaha.dodamdodam.dto.response.NotifyResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.repository.ManageKidRepository;
import com.wohaha.dodamdodam.repository.MedicineRepository;
import com.wohaha.dodamdodam.security.CustomAuthenticatedUser;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import static com.wohaha.dodamdodam.exception.BaseResponseStatus.*;
import static com.wohaha.dodamdodam.exception.BaseResponseStatus.UNREGISTERED_MEDICINE;

@Service
@Transactional
@RequiredArgsConstructor
public class MedicineServiceImpl implements MedicineService{

    final MedicineRepository medicineRepository;

    final S3UploadService s3UploadService;

    final ManageKidRepository manageKidRepository;

    @Override
    public boolean createMedicine(CreateMedicineRequestDto createMedicineRequestDto) {

        //1. request 사인 s3에 업로드하기.
//        String url = s3UploadService.upload(createMedicineRequestDto.getRequestSign(), "medicine");

        //객체 생성
        Medicine medicine = Medicine.builder()
                .kidSeq(createMedicineRequestDto.getKidSeq())
                .symptom(createMedicineRequestDto.getSymptom())
                .pill(createMedicineRequestDto.getPill())
                .capacity(createMedicineRequestDto.getCapacity())
                .count(createMedicineRequestDto.getCount())
                .time(createMedicineRequestDto.getTime())
                .keep(createMedicineRequestDto.getKeep())
                .content(createMedicineRequestDto.getContent())
                .requestName(createMedicineRequestDto.getRequestName())
                .requestDate(new Timestamp(createMedicineRequestDto.getRequestDate().getTime()))
                .build();

        medicineRepository.save(medicine);

        return true;
    }

    @Override
    public NotifyResponseDto completeMedicine(CompleteMedicineRequestDto completeMedicineRequestDto) {

        //업데이트
        medicineRepository.updateMedicine(completeMedicineRequestDto);

        // 알림에 들어갈 선생님 seq
        Long userSeq = ((CustomAuthenticatedUser) SecurityContextHolder.getContext().getAuthentication()).getUserSeq();
        //알림에 들어갈 내용
        LocalDateTime currentDate = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        String formattedDateTime = currentDate.format(formatter);
        long kidSeq = medicineRepository.kidSeq(completeMedicineRequestDto.getMedicineSeq());


        //알람 보냄
        NotifyResponseDto notify = new NotifyResponseDto();
        notify.setType(2);  //투약 2
        notify.setContent(formattedDateTime + " 투약 보고서가 새로 등록되었습니다. 💊");
        notify.setTypeSeq(completeMedicineRequestDto.getMedicineSeq());
        notify.setSendUserSeq(userSeq);
        notify.setReceiveUserSeq(manageKidRepository.findParentSeqByKidSeq(kidSeq)); //아이의 부모 seq 넣어야함

        return notify;

    }

    @Override
    public MedicineInfoResponseDto getMedicine(Long medicineSeq) {

        return medicineRepository.findMedicineById(medicineSeq).orElseThrow(()->{throw new BaseException(UNREGISTERED_MEDICINE);});
    }

    @Override
    public List<MedicineClassResponseDto> getMedicineByClass(Long classSeq, MedicineRequestDto medicineRequestDto) {

        LocalDateTime dateTime = LocalDateTime.parse(medicineRequestDto.getDay() + "T00:00:00");
        return medicineRepository.getMedicineByClassList(classSeq,dateTime);
    }

    @Override
    public List<MedicineKidResponseDto> getMedicineByKid(Long kidSeq, MedicineRequestDto medicineRequestDto) {
        LocalDateTime dateTime = LocalDateTime.parse(medicineRequestDto.getDay() + "T00:00:00");
        return medicineRepository.getMedicineByKidList(kidSeq,dateTime);
    }
}
