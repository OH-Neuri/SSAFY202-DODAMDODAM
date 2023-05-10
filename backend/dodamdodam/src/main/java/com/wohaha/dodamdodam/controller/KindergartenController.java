package com.wohaha.dodamdodam.controller;

import com.wohaha.dodamdodam.domain.KindergartenInfo;
import com.wohaha.dodamdodam.dto.BaseResponseDto;
import com.wohaha.dodamdodam.dto.request.*;
import com.wohaha.dodamdodam.dto.response.*;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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

    @Autowired
    KindergartenService kindergartenService;

    @Autowired
    private ManageScheduleService manageScheduleService;

    @Autowired
    private ManageFoodService manageFoodService;

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

            String uploadUrl = null;
            //이미지 s3 업로드 후 링크 가져오기
            if(!createKidRequestDto.getPhoto().isEmpty()) {
                uploadUrl = s3UploadService.upload(createKidRequestDto.getPhoto(), "kidProfile");
            }
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
    public BaseResponseDto<List<KidResponseDto>> kidList(){
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

    @GetMapping("/kidInfo/{kidSeq}")
    public BaseResponseDto<KidResponseDto> kidInfo(@PathVariable Long kidSeq){
        try{
            return new BaseResponseDto<>(manageKidService.kidInfo(kidSeq));
        }catch (Exception e){
            if(e instanceof BaseException){
                throw  e;
            }else{
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @PostMapping("/Image")
    public BaseResponseDto<String> Image(@ModelAttribute KidImageFileRequestDto kidImageFileRequestDto){
        try{
            //이미지 s3 업로드 후 링크 가져오기
            if(!kidImageFileRequestDto.getPhoto().isEmpty()){
                String uploadUrl = s3UploadService.upload(kidImageFileRequestDto.getPhoto(),"kidProfile");
                return new BaseResponseDto<>(uploadUrl);
            }
            return new BaseResponseDto<>("No Image");
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
            String uploadUrl = null;
            //이미지 s3 업로드 후 링크 가져오기
            if(!updateKidRequestDto.getPhoto().isEmpty()) {
                uploadUrl = s3UploadService.upload(updateKidRequestDto.getPhoto(), "kidProfile");
            }

            return new BaseResponseDto<>(manageKidService.updateKid(updateKidRequestDto,uploadUrl));
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

    @GetMapping("/search")
    public BaseResponseDto<List<KindergartenInfo>> searchKindergartenInfo(@RequestParam String keyword){
        try{
            return new BaseResponseDto<>(kindergartenService.getKindergartenInfoList(keyword));
        }catch(Exception e){
            if(e instanceof BaseException){
                throw e;
            }else{
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @DeleteMapping("/teacher/{classTeacherSeq}")
    public BaseResponseDto<Boolean> deleteClassTeacher(@PathVariable Long classTeacherSeq){
        try{
            //api 완성되면 -> method security (원장만)
            return new BaseResponseDto<>(manageClassService.deleteClassTeacher(classTeacherSeq));
        }catch(Exception e){
            if(e instanceof BaseException){
                throw e;
            }else{
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    // 일정 관리
    @PostMapping("/schedule")
    public BaseResponseDto<Boolean> createSchedule(@RequestBody CreateScheduleRequestDto createScheduleRequestDto) {
        try {
            boolean result = manageScheduleService.createSchedule(createScheduleRequestDto);
            return new BaseResponseDto<>(result);
        } catch (Exception e) {
            if (e instanceof BaseException) {
                throw e;
            }
            throw new BaseException(BaseResponseStatus.FAIL);
        }
    }

    @GetMapping("/schedule/month")
    public BaseResponseDto<KindergartenScheduleListResponseDto> getMonthScheduleList(@RequestParam String year, @RequestParam String month) {
        try {
            KindergartenScheduleListResponseDto kScheduleList = manageScheduleService.getMonthScheduleList(year, month);
            return new BaseResponseDto<>(kScheduleList);
        } catch (Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @GetMapping("schedule")
    public BaseResponseDto<List<ScheduleResponseDto>> getDayScheduleList(@RequestParam String year,
                                                                         @RequestParam String month,
                                                                         @RequestParam String day) {
        try {
            List<ScheduleResponseDto> kDayScheduleList = manageScheduleService.getDayScheduleList(year, month, day);
            return new BaseResponseDto<>(kDayScheduleList);
        } catch (Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @DeleteMapping("/schedule/{scheduleSeq}")
    public BaseResponseDto<Boolean> deleteSchedule(@PathVariable Long scheduleSeq) {
        try {
            return new BaseResponseDto<>(manageScheduleService.deleteSchedule(scheduleSeq));
        } catch (Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    // 일정 분류 관리
    @PostMapping("/scheduleType")
    public BaseResponseDto<Boolean> createScheduleType(@RequestBody List<ScheduleTypeRequestDto> scheduleType) {
        try {
            for (ScheduleTypeRequestDto st : scheduleType) {
                if (st.getScheduleTypeSeq() == null) {
                    // create
                    if (!manageScheduleService.createScheduleType(st.getContent())) {
                        throw new BaseException(BaseResponseStatus.SCHEDULE_TYPE_CREATE_FAIL);
                    }
                } else if (st.getContent() == null) {
                    // delete
                    if (!manageScheduleService.deleteScheduleType(st.getScheduleTypeSeq())) {
                        throw new BaseException(BaseResponseStatus.SCHEDULE_TYPE_DELETE_FAIL);
                    }
                } else {
                    // update
                    if (!manageScheduleService.updateScheduleType(st)) {
                        throw new BaseException(BaseResponseStatus.SCHEDULE_TYPE_UPDATE_FAIL);
                    }
                }
            }
        } catch (Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
        return new BaseResponseDto<>(true);
    }

    @GetMapping("/scheduleType")
    public BaseResponseDto<List<ScheduleTypeResponseDto>> getScheduleTypeList() {
        try {
            List<ScheduleTypeResponseDto> scheduleTypeList = manageScheduleService.getScheduleTypeList();
            return new BaseResponseDto<>(scheduleTypeList);
        } catch (Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    // 식단 관리
    @PostMapping("/food")
    public BaseResponseDto<String> modifyFood(@RequestBody FoodRequestDto foodRequestDto) {
        try {
            return new BaseResponseDto<>(manageFoodService.modifyFood(foodRequestDto));
        } catch (Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @GetMapping("/food")
    public BaseResponseDto<FoodResponseDto> getFood(@RequestParam String year,
                                                    @RequestParam String month,
                                                    @RequestParam String day) {
        try {
            return new BaseResponseDto<>(manageFoodService.getFood(year, month, day));
        } catch (Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    //    api/dodam/kindergarten/food/month?year={year}&month={month}
    @GetMapping("/food/month")
    public BaseResponseDto<FoodListResponseDto> getFoodList(@RequestParam String year,
                                                            @RequestParam String month) {
        try {
            return new BaseResponseDto<>(manageFoodService.getFoodList(year, month));
        } catch (Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }


}