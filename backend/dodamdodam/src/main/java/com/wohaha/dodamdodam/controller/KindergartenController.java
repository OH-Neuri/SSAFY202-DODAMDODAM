package com.wohaha.dodamdodam.controller;

import com.wohaha.dodamdodam.dto.response.BaseResponseDto;
<<<<<<< HEAD
import com.wohaha.dodamdodam.dto.response.request.CreateKidRequestDto;
import com.wohaha.dodamdodam.dto.response.request.CreateScheduleRequestDto;
=======
import com.wohaha.dodamdodam.dto.response.request.CreateClassRequestDto;
import com.wohaha.dodamdodam.dto.response.response.ClassListResponseDto;
>>>>>>> afed7396f140db696f7cdfc4e8f3278588f68879
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.service.ManageClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/kindergarten")
public class KindergartenController {
    @Autowired
    ManageClassService manageClassService;

    @PostMapping("/class")
    public BaseResponseDto<?> createClass(@RequestBody CreateClassRequestDto createClassRequestDto) {
        try{
            boolean result = manageClassService.createClass(createClassRequestDto);
            return new BaseResponseDto<>(result);
        }catch (Exception e){
            if(e instanceof BaseException){
                throw e;
            }else{
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

<<<<<<< HEAD
    @PostMapping("/schedule")
    public BaseResponseDto<?> createSchedule(@RequestBody CreateScheduleRequestDto createScheduleRequestDto) {
        try {
//            boolean result =
        } catch (Exception e) {
            if(e instanceof BaseException) {
                throw e;
            }
            throw new BaseException(BaseResponseStatus.FAIL);
        }
    }





=======
    @GetMapping("class")
    public BaseResponseDto<List<ClassListResponseDto>> classList(){
        try{
            //수정할거!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            long kindergartenSeq = 1; //token에 있는 원장 seq로 kindergartenSeq 구해서 넣기
>>>>>>> afed7396f140db696f7cdfc4e8f3278588f68879

            return new BaseResponseDto<>(manageClassService.classList(kindergartenSeq));
        }catch (Exception e){
            if(e instanceof BaseException){
                throw e;
            }else{
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    
}