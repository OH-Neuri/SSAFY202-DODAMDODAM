package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.dto.response.ClassInfoResponseDto;

import java.util.List;

public interface ClassTeacherRepositoryCustom {

    boolean isExist(Long classSeq, Long userSeq);
    //반에서 선생님 삭제
    void deleteClassTeacher(Long classTeacherSeq);
    List<ClassInfoResponseDto> findClassListByUserSeq(Long userSeq);

}
