package com.wohaha.dodamdodam.controller;

import com.wohaha.dodamdodam.domain.Medicine;
import com.wohaha.dodamdodam.dto.BaseResponseDto;
import com.wohaha.dodamdodam.dto.request.CompleteMedicineRequestDto;
import com.wohaha.dodamdodam.dto.request.CreateMedicineRequestDto;
import com.wohaha.dodamdodam.dto.request.MedicineRequestDto;
import com.wohaha.dodamdodam.dto.response.*;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.service.MedicineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/medicine")
public class MedicineController {
    @Autowired
    private MedicineService medicineService;

    //투약의뢰서 작성
    @PostMapping("/kid/{kidSeq}")
    public BaseResponseDto<Boolean> createMedicine(@PathVariable Long kidSeq,
                                                   @RequestBody CreateMedicineRequestDto createMedicineRequestDto) {
        try {
            createMedicineRequestDto.setKidSeq(kidSeq);
            boolean result = medicineService.createMedicine(createMedicineRequestDto);
            return new BaseResponseDto<>(result);
        } catch (Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }


    //투약 의뢰서 조회
    @GetMapping("/{medicineSeq}")
    public BaseResponseDto<MedicineInfoResponseDto> getMedicine(@PathVariable Long medicineSeq) {
        try {
            return new BaseResponseDto<>(medicineService.getMedicine(medicineSeq));
        } catch (Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    //(선생님)  학생들 투약 의뢰서 조회
    @PostMapping("/class/{classSeq}")
    public BaseResponseDto<List<MedicineClassResponseDto>> getMedicineByClass(@PathVariable Long classSeq,
                                                                              @RequestBody MedicineRequestDto medicineRequestDto) {
        try {
            return new BaseResponseDto<>(medicineService.getMedicineByClass(classSeq, medicineRequestDto));
        } catch (Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    //(학부모) 자식 의뢰서 리스트
    @PostMapping("/kidList/{kidSeq}")
    public BaseResponseDto<List<MedicineKidResponseDto>> getMedicineByKid(@PathVariable Long kidSeq,
                                                                          @RequestBody MedicineRequestDto medicineRequestDto) {
        try {
            return new BaseResponseDto<>(medicineService.getMedicineByKid(kidSeq, medicineRequestDto));
        } catch (Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    //투약 완료서(?) 작성
    @PutMapping("/{medicineSeq}")
    public BaseResponseDto<Boolean> completeMedicine(@PathVariable Long medicineSeq,
                                                     @ModelAttribute CompleteMedicineRequestDto completeMedicineRequestDto) {
        try {
            completeMedicineRequestDto.setMedicineSeq(medicineSeq);
            boolean result = medicineService.completeMedicine(completeMedicineRequestDto);
            return new BaseResponseDto<>(result);
        } catch (Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }
}
