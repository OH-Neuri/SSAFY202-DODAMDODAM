package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.JwtTokenInfo;
import com.wohaha.dodamdodam.domain.User;
import com.wohaha.dodamdodam.dto.BaseResponseDto;
import com.wohaha.dodamdodam.dto.request.LoginUserRequestDto;
import com.wohaha.dodamdodam.dto.request.RegisterUserRequestDto;
import com.wohaha.dodamdodam.dto.request.UpdateUserRequestDto;
import com.wohaha.dodamdodam.dto.response.*;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.repository.ClassTeacherRepository;
import com.wohaha.dodamdodam.repository.ManageKidRepository;
import com.wohaha.dodamdodam.repository.UserRepository;
import com.wohaha.dodamdodam.util.EncodeUtils;
import com.wohaha.dodamdodam.util.JwtTokenUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.wohaha.dodamdodam.exception.BaseResponseStatus.*;

@Service
@Transactional
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final ClassTeacherRepository classTeacherRepository;
    private final ManageKidRepository kidRepository;
    private final SmsService smsService;

    @Override
    public RegisterUserResponseDto registerUser(RegisterUserRequestDto registerUserRequestDto) {

        //1. 이미 해당 핸드폰번호와 권한으로 가입된 유저인지 체크
        if (userRepository.isSignedUp(registerUserRequestDto.getPhone(), registerUserRequestDto.getRole())) {
            //이미 가입된 유저입니다.
            throw new BaseException(BaseResponseStatus.ALREADY_SIGNED_UP);
        }

        //2. 해당 유저의 휴대폰 인증이 완료됐는지 체크
        if (!smsService.isCheckedUser(registerUserRequestDto.getPhone())) {
            //휴대폰 인증을 먼저 진행해주세요
            throw new BaseException(BaseResponseStatus.FAIL);
        }

        //가입시킨다.
        User user = User.builder()
                .name(registerUserRequestDto.getName())
                .phoneNumber(registerUserRequestDto.getPhone())
                .role(registerUserRequestDto.getRole())
                .id(registerUserRequestDto.getId())
                .password(EncodeUtils.encode(registerUserRequestDto.getPassword()))
                .build();

        userRepository.save(user);

        //토큰 발급
        JwtTokenInfo jwtTokenInfo = JwtTokenUtils.allocateToken(user.getUserSeq(), user.getRole());

        //휴대폰 인증 삭제
        smsService.deleteCheckedUser(user.getPhoneNumber());

        //return
        RegisterUserResponseDto result = RegisterUserResponseDto.builder()
                .id(user.getId())
                .name(user.getName())
                .role(user.getRole())
                .phone(user.getPhoneNumber())
                .token(jwtTokenInfo.getAccessToken())
                .build();

        return result;
    }

    @Override
    public Object loginUser(LoginUserRequestDto loginUserRequestDto) {

        //아이디, 권한으로 유저 찾아오기
        User user = userRepository.findUserByIdAndRole(loginUserRequestDto.getId(),
                loginUserRequestDto.getRole()).orElseThrow(() -> {
            throw new BaseException(SIGNUP_REQUIRED);
        });

        //아이디 비밀번호 일치 여부 확인하기
        if (!EncodeUtils.matches(loginUserRequestDto.getPassword(), user.getPassword())) {
            throw new BaseException(WRONG_PASSWORD);
        }

        //토큰 발급
        JwtTokenInfo jwtTokenInfo = JwtTokenUtils.allocateToken(user.getUserSeq(), user.getRole());

        LoginResponseDto result = LoginResponseDto.builder()
                .name(user.getName())
                .id(user.getId())
                .role(user.getRole())
                .phone(user.getPhoneNumber())
                .token(jwtTokenInfo.getAccessToken())
                .build();

        Object response = result;
        switch (loginUserRequestDto.getRole()) {
            case 1: // 원장 선생님 (관리자)
                Boolean kindergarten = userRepository.findKindergartenSeq(user.getUserSeq()) != null;
                response = new LoginAdminResponseDto(kindergarten, result);
                break;

            case 2: // 선생님
                LoginTeacherResponseDto loginTeacherResponseDto = userRepository.findClassInfoByUserSeq(user.getUserSeq());
                loginTeacherResponseDto.setLoginResponseDto(result);
                response = loginTeacherResponseDto;
                break;
            case 3: // 부모님
                LoginParentResponseDto loginParentResponseDto = userRepository.findKidInfoByUserSeq(user.getUserSeq());
                loginParentResponseDto.setLoginResponseDto(result);
                response = loginParentResponseDto;
                break;
        }

        return (response instanceof LoginResponseDto) ? new BaseException(BaseResponseStatus.WRONG_ROLE) : response;
    }

    @Override
    public User getUser(Long userSeq) {
        return userRepository.findById(userSeq).orElseThrow(() -> {
            throw new BaseException(UNREGISTERED_USER);
        });
    }

    @Override
    public boolean updateUser(UpdateUserRequestDto updateUserRequestDto, Long userSeq) {
        updateUserRequestDto.setPassword(EncodeUtils.encode(updateUserRequestDto.getPassword()));
        updateUserRequestDto.setUserSeq(userSeq);
        userRepository.updateUser(updateUserRequestDto);
        return true;
    }

    @Override
    public boolean isExist(Long userSeq) {
        return userRepository.existsById(userSeq);
    }

    @Override
    public Boolean checkIdDuplicate(String id) {
        return userRepository.findUserIdCntByUserId(id) > 0;
    }

    @Override
    public List<ClassInfoResponseDto> getTeacherClassList() {
        Long userSeq = 1L;
//                ((CustomAuthenticatedUser) SecurityContextHolder.getContext().getAuthentication()).getUserSeq();
        return classTeacherRepository.findClassListByUserSeq(userSeq);
    }

    @Override
    public List<KidInfoResponseDto> getParentKidList() {
        Long userSeq = 18L;
//                ((CustomAuthenticatedUser) SecurityContextHolder.getContext().getAuthentication()).getUserSeq();
        return kidRepository.findKidListByUserSeq(userSeq);
    }


}
