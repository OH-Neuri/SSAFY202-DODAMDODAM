package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.dto.request.CompleteMedicineRequestDto;
import com.wohaha.dodamdodam.dto.response.MedicineClassResponseDto;
import com.wohaha.dodamdodam.dto.response.MedicineInfoResponseDto;
import com.wohaha.dodamdodam.dto.response.MedicineKidResponseDto;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface MedicineRepositoryCustom {

    void updateMedicine(CompleteMedicineRequestDto completeMedicineRequestDto);

    List<MedicineClassResponseDto> getMedicineByClassList(Long classSeq, LocalDateTime date);

    List<MedicineKidResponseDto> getMedicineByKidList(Long kidSeq, LocalDateTime date);

    Optional<MedicineInfoResponseDto> findMedicineById(Long medicineSeq);
}
