package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.ClassInfo;
import com.wohaha.dodamdodam.domain.ClassTeacher;
import com.wohaha.dodamdodam.dto.request.CreateClassRequestDto;
import com.wohaha.dodamdodam.dto.request.UpdateClassRequestDto;
import com.wohaha.dodamdodam.dto.response.ClassListResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.repository.ClassTeacherRepository;
import com.wohaha.dodamdodam.repository.KindergartenRepository;
import com.wohaha.dodamdodam.repository.ManageClassRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class ManageClassServiceImpl implements ManageClassService {
    @Autowired
    private ManageClassRepository manageClassRepository;

    @Autowired
    private final KindergartenRepository kindergartenRepository;

    @Autowired
    private ClassTeacherRepository classTeacherRepository;

    @Override
    public boolean createClass(CreateClassRequestDto createClassRequestDto) {
        //수정할거!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        long kindergartenSeq = 1; //token에 있는 원장 seq로 kindergartenSeq 구해서 넣기

        //dto to entity
        ClassInfo classInfo = ClassInfo.builder()
                .kindergartenSeq(kindergartenSeq)
                .name(createClassRequestDto.getName())
                .age(createClassRequestDto.getAge())
                .count(0)
                .build();
        //반등록
        manageClassRepository.save(classInfo);
        return true;
    }

    @Override
    public List<ClassListResponseDto> classList() {
        Long userSeq = 1L; // 원장선생님 시퀀스 토큰에서 가져옴
        Long kindergartenSeq = kindergartenRepository.findKindergartenSeqByUserSeq(userSeq)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.UNREGISTERED_KINDERGARTEN));

        //반 정보 (반시퀀스, 반이름, 반별 연령)
        List<ClassListResponseDto> classList = manageClassRepository.classInfoList(kindergartenSeq);
        //선생님 정보 넣기
        for(int i=0; i<classList.size(); i++){
            classList.get(i).setTeacherInfo(manageClassRepository.teacherInfo(classList.get(i).getClassSeq()));
        }
        return classList;
    }

    @Override
    public boolean updateClass(UpdateClassRequestDto updateClassRequestDto) {
        manageClassRepository.updateClass(updateClassRequestDto);
        return true;
    }

    @Override
    public boolean deleteClass(long classSeq) {
        manageClassRepository.deleteClass(classSeq);
        return true;
    }

    @Override
    public boolean createClassTeacher(Long classSeq, Long userSeq) {

        //이미 연관관계가 존재하는지 찾는다.
        if(classTeacherRepository.isExist(classSeq, userSeq)){
            throw new BaseException(BaseResponseStatus.ALREADY_REGISTERED_TEACHER);
        }

        //등록한다.
        ClassTeacher classTeacher =  ClassTeacher.builder()
                .classSeq(classSeq)
                .userSeq(userSeq)
                .build();

        classTeacherRepository.save(classTeacher);

        return true;
    }

    @Override
    public boolean deleteClassTeacher(Long classTeacherSeq) {
        classTeacherRepository.deleteClassTeacher(classTeacherSeq);
        return true;
    }


}
