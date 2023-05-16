package com.wohaha.dodamdodam.controller;

import com.fasterxml.jackson.databind.ser.Serializers;
import com.wohaha.dodamdodam.domain.User;
import com.wohaha.dodamdodam.dto.BaseResponseDto;
import com.wohaha.dodamdodam.dto.request.LoginUserRequestDto;
import com.wohaha.dodamdodam.dto.request.RegisterUserRequestDto;
import com.wohaha.dodamdodam.dto.request.SleepModeRequestDto;
import com.wohaha.dodamdodam.dto.request.UpdateUserRequestDto;
import com.wohaha.dodamdodam.dto.response.ClassInfoResponseDto;
import com.wohaha.dodamdodam.dto.response.KidInfoResponseDto;
import com.wohaha.dodamdodam.dto.response.KidResponseDto;
import com.wohaha.dodamdodam.dto.response.RegisterUserResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.security.CustomAuthenticatedUser;
import com.wohaha.dodamdodam.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.wohaha.dodamdodam.exception.BaseResponseStatus.UNAUTHORIZED_USER;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("")
    public BaseResponseDto<RegisterUserResponseDto> registerUser(@RequestBody RegisterUserRequestDto registerUserRequestDto) {
        try {
            RegisterUserResponseDto result = userService.registerUser(registerUserRequestDto);
            return new BaseResponseDto<>(result);
        } catch (Exception e) {
            e.printStackTrace();
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @PostMapping("/login")
    public BaseResponseDto<?> login(@RequestBody LoginUserRequestDto loginUserRequestDto) {
        try {
            return new BaseResponseDto<>(userService.loginUser(loginUserRequestDto));
        } catch (Exception e) {
            e.printStackTrace();
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @GetMapping("/{userSeq}")
    public BaseResponseDto<User> getUser(@PathVariable Long userSeq) {
        try {
            if (((CustomAuthenticatedUser) SecurityContextHolder.getContext().getAuthentication()).getUserSeq() != userSeq) {
                throw new BaseException(UNAUTHORIZED_USER);
            }
            return new BaseResponseDto<>(userService.getUser(userSeq));
        } catch (Exception e) {
            e.printStackTrace();
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @GetMapping("/check/{id}")
    public BaseResponseDto<Boolean> checkIdDuplicate(@PathVariable String id) {
      try {
        return new BaseResponseDto<>(userService.checkIdDuplicate(id));
      } catch (Exception e) {
        if (e instanceof BaseException) {
          throw e;
        } else {
          throw new BaseException(BaseResponseStatus.FAIL);
        }
      }
    }

    @GetMapping("/class")
    public BaseResponseDto<List<ClassInfoResponseDto>> getTeacherClassList() {
        try {
            List<ClassInfoResponseDto> result = userService.getTeacherClassList();
            return new BaseResponseDto<>(result);
        } catch (Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @GetMapping("/kid")
    public BaseResponseDto<List<KidInfoResponseDto>> getParentKidList() {
        try {
            List<KidInfoResponseDto> result = userService.getParentKidList();
            return new BaseResponseDto<>(result);
        } catch (Exception e) {
            e.printStackTrace();
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @PutMapping("/{userSeq}")
    public BaseResponseDto<Boolean> updateUser(@RequestBody UpdateUserRequestDto updateUserRequestDto,
                                               @PathVariable Long userSeq) {
        try {
            if (((CustomAuthenticatedUser) SecurityContextHolder.getContext().getAuthentication()).getUserSeq() != userSeq) {
                throw new BaseException(UNAUTHORIZED_USER);
            }
            return new BaseResponseDto<>(userService.updateUser(updateUserRequestDto, userSeq));
        } catch (Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @GetMapping("/userSleepMode")
    public BaseResponseDto<SleepModeRequestDto> getSleepMode() {
        try {
            return new BaseResponseDto<>(userService.getSleepMode());
        } catch (Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @PutMapping("/userSleepMode")
    public BaseResponseDto<Boolean> updateSleepMode(@RequestBody SleepModeRequestDto sleepModeRequestDto) {
        try {
            return new BaseResponseDto<>(userService.updateSleepMode(sleepModeRequestDto));
        } catch (Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

}
