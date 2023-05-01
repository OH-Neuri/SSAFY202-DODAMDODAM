package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.ClassInfo;
import com.wohaha.dodamdodam.dto.response.request.CreateClassRequestDto;
import com.wohaha.dodamdodam.dto.response.request.UpdateClassRequestDto;
import com.wohaha.dodamdodam.dto.response.response.ClassListResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.repository.KindergartenRepository;
import com.wohaha.dodamdodam.repository.ManageClassRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.PersistenceException;
import java.util.List;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class ManageClassServiceImpl implements ManageClassService {
    @Autowired
    private ManageClassRepository manageClassRepository;

    @Autowired
    private final KindergartenRepository kindergartenRepository;

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
                .orElseThrow(() -> new BaseException(BaseResponseStatus.KINDERGARTEN_NULL_FAIL));

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




}
