package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.User;
import com.wohaha.dodamdodam.dto.request.LoginUserRequestDto;
import com.wohaha.dodamdodam.dto.request.RegisterUserRequestDto;
import com.wohaha.dodamdodam.dto.request.SleepModeRequestDto;
import com.wohaha.dodamdodam.dto.request.UpdateUserRequestDto;
import com.wohaha.dodamdodam.dto.response.ClassInfoResponseDto;
import com.wohaha.dodamdodam.dto.response.KidInfoResponseDto;
import com.wohaha.dodamdodam.dto.response.RegisterUserResponseDto;

import java.util.List;

public interface UserService {

  RegisterUserResponseDto registerUser(RegisterUserRequestDto registerUserRequestDto);
  Object loginUser(LoginUserRequestDto loginUserRequestDto);
  User getUser(Long userSeq);
  boolean updateUser(UpdateUserRequestDto updateUserRequestDto, Long userSeq);
  boolean isExist(Long userSeq);
  Boolean checkIdDuplicate(String id);
  List<ClassInfoResponseDto> getTeacherClassList();
  List<KidInfoResponseDto> getParentKidList();

  SleepModeRequestDto getSleepMode();
  Boolean updateSleepMode(SleepModeRequestDto sleepModeRequestDto);
}
