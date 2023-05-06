package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.request.CreateMedicineRequestDto;
import com.wohaha.dodamdodam.dto.request.CreateScheduleRequestDto;
import com.wohaha.dodamdodam.dto.request.ScheduleTypeRequestDto;
import com.wohaha.dodamdodam.dto.response.KindergartenScheduleListResponseDto;
import com.wohaha.dodamdodam.dto.response.ScheduleResponseDto;
import com.wohaha.dodamdodam.dto.response.ScheduleTypeResponseDto;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface MedicineService {


    //투약의뢰서 작성
    boolean createMedicine(CreateMedicineRequestDto createMedicineRequestDto);
}
