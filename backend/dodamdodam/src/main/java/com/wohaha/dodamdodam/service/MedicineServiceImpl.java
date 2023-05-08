package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.Medicine;
import com.wohaha.dodamdodam.dto.request.CreateMedicineRequestDto;
import com.wohaha.dodamdodam.repository.MedicineRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;

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
}
