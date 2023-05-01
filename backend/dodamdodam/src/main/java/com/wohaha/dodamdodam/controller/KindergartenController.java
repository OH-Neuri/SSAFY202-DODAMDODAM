package com.wohaha.dodamdodam.controller;

import com.wohaha.dodamdodam.dto.response.BaseResponseDto;
import com.wohaha.dodamdodam.dto.response.request.CreateClassRequestDto;
import com.wohaha.dodamdodam.dto.response.request.CreateScheduleRequestDto;
import com.wohaha.dodamdodam.dto.response.request.UpdateClassRequestDto;
import com.wohaha.dodamdodam.dto.response.response.ClassListResponseDto;
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

    @GetMapping("class")
    public BaseResponseDto<List<ClassListResponseDto>> classList(){
        try{
            return new BaseResponseDto<>(manageClassService.classList());
        }catch (Exception e){
            if(e instanceof BaseException){
                throw e;
            }else{
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @PutMapping("class")
    public BaseResponseDto<?> updateClass(@RequestBody UpdateClassRequestDto updateClassRequestDto){
        try{
            return new BaseResponseDto<>(manageClassService.updateClass(updateClassRequestDto));
        }catch (Exception e){
            if( e instanceof BaseException){
                throw e;
            }else{
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @DeleteMapping("class/{classSeq}")
    public BaseResponseDto<?> deleteClass(@PathVariable Long classSeq){
        try{
            return new BaseResponseDto<>(manageClassService.deleteClass(classSeq));
        }catch(Exception e){
            if(e instanceof BaseException){
                throw e;
            }else{
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    


}