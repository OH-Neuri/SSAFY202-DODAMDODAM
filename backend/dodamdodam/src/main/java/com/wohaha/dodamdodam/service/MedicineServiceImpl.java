package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.Medicine;
import com.wohaha.dodamdodam.dto.request.*;
import com.wohaha.dodamdodam.dto.response.MedicineClassResponseDto;
import com.wohaha.dodamdodam.dto.response.MedicineInfoResponseDto;
import com.wohaha.dodamdodam.dto.response.MedicineKidResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.repository.MedicineRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import static com.wohaha.dodamdodam.exception.BaseResponseStatus.*;
import static com.wohaha.dodamdodam.exception.BaseResponseStatus.UNREGISTERED_MEDICINE;

@Service
@Transactional
@RequiredArgsConstructor
public class MedicineServiceImpl implements MedicineService{

    final MedicineRepository medicineRepository;

    final S3UploadService s3UploadService;

    @Override
    public boolean createMedicine(CreateMedicineRequestDto createMedicineRequestDto) {

        //1. request 사인 s3에 업로드하기.
        String url = s3UploadService.upload(createMedicineRequestDto.getRequestSign(), "medicine");

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
                .requestSign(url)
                .build();

        medicineRepository.save(medicine);

        return true;
    }

    @Override
    public boolean completeMedicine(CompleteMedicineRequestDto completeMedicineRequestDto) {

        //response 사인 s3에 업로드하기.
        String url = s3UploadService.upload(completeMedicineRequestDto.getResponseSign(), "medicine");

        //업데이트
        completeMedicineRequestDto.setResponseSignUrl(url);
        medicineRepository.updateMedicine(completeMedicineRequestDto);

        return true;
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
