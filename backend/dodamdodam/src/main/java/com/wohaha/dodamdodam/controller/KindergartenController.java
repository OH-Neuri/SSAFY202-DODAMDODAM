package com.wohaha.dodamdodam.controller;

import com.wohaha.dodamdodam.dto.BaseResponseDto;
import com.wohaha.dodamdodam.dto.request.CreateClassRequestDto;
import com.wohaha.dodamdodam.dto.request.CreateKidRequestDto;
import com.wohaha.dodamdodam.dto.request.KidImageFileRequestDto;
import com.wohaha.dodamdodam.dto.request.UpdateClassRequestDto;
import com.wohaha.dodamdodam.dto.request.UpdateKidRequestDto;
import com.wohaha.dodamdodam.dto.response.ClassListResponseDto;
import com.wohaha.dodamdodam.dto.response.KidListResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.service.ManageClassService;
import com.wohaha.dodamdodam.service.ManageKidService;
import com.wohaha.dodamdodam.service.S3UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/kindergarten")
public class KindergartenController {
    @Autowired
    ManageClassService manageClassService;

    @Autowired
    ManageKidService manageKidService;

    @Autowired
    S3UploadService s3UploadService;

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

    @PostMapping("/kid")
    public BaseResponseDto<?> createKid(@ModelAttribute CreateKidRequestDto createKidRequestDto){
        try{
            //이미지 s3 업로드 후 링크 가져오기
            String uploadUrl = s3UploadService.upload(createKidRequestDto.getPhoto(),"kidProfile");
            //db 저장
            boolean result = manageKidService.createKid(createKidRequestDto, uploadUrl);

            return new BaseResponseDto<>(result);
        }catch(Exception e){
            if( e instanceof  BaseException){
                throw e;
            }else{
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }

    }

    @GetMapping("/kid")
    public BaseResponseDto<List<KidListResponseDto>> kidList(){
        try{
            return new BaseResponseDto<>(manageKidService.kidList());
        }catch (Exception e){
            if(e instanceof BaseException){
                throw  e;
            }else{
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @PostMapping("/kidImage")
    public BaseResponseDto<String> kidImage(@ModelAttribute KidImageFileRequestDto kidImageFileRequestDto){
        try{
            //이미지 s3 업로드 후 링크 가져오기
            String uploadUrl = s3UploadService.upload(kidImageFileRequestDto.getPhoto(),"kidProfile");
            return new BaseResponseDto<>(uploadUrl);
        }catch (Exception e){
            if(e instanceof BaseException){
                throw  e;
            }else{
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }


    @PutMapping("kid")
    public BaseResponseDto<?> updateKid(@ModelAttribute UpdateKidRequestDto updateKidRequestDto){
        try{
            return new BaseResponseDto<>(manageKidService.updateKid(updateKidRequestDto));
        }catch (Exception e){
            if( e instanceof BaseException){
                throw e;
            }else{
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @DeleteMapping("kid/{kidSeq}")
    public BaseResponseDto<?> deleteKid(@PathVariable Long kidSeq){
        try{
            return new BaseResponseDto<>(manageKidService.deleteKid(kidSeq));
        }catch(Exception e){
            if(e instanceof BaseException){
                throw e;
            }else{
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }


}