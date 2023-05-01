package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.ClassInfo;
import com.wohaha.dodamdodam.dto.response.request.CreateClassRequestDto;
import com.wohaha.dodamdodam.dto.response.response.ClassListResponseDto;
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
        System.out.println(classInfo.toString());
        //반등록
        manageClassRepository.save(classInfo);
        return true;
    }

    @Override
    public List<ClassListResponseDto> classList(long kindergartenSeq) {
        //    private Long classSeq(CLASS), String name(CLASS),String age(CLASS),teacherSeq(CLASS_TEACHER), teacherName(USER);
        //반 정보 (반시퀀스, 반이름, 반별 연령)
        List<ClassListResponseDto> classList = manageClassRepository.classInfoList(kindergartenSeq);
        for(int i=0; i<classList.size(); i++){
            classList = manageClassRepository.teacherInfo(classList.get(i).getClassSeq());
        }
        return null;
    }
}
