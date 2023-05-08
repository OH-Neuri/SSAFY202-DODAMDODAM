package com.wohaha.dodamdodam.repository;

import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.dto.response.KidAttendanceListResponseDto;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

import static com.querydsl.core.types.ExpressionUtils.anyOf;
import static com.wohaha.dodamdodam.domain.QKid.kid;
import static com.wohaha.dodamdodam.domain.QAttendance.attendance;
public class AttendanceRepositoryImpl implements AttendanceRepositoryCustom {
    @Autowired
    JPAQueryFactory query;

    @Override
    public List<KidAttendanceListResponseDto> getKidAttendanceList(Long classSeq, LocalDate day) {
        Timestamp startOfDay = Timestamp.valueOf(day.atStartOfDay());
        Timestamp endOfDay = Timestamp.valueOf(day.atTime(LocalTime.MAX));
        return query
                .select(Projections.constructor(KidAttendanceListResponseDto.class,
                        kid.kidSeq, kid.name, kid.photo,
                        attendance.attendanceSeq, attendance.forthTimeCheck, attendance.backTimeCheck))
                .from(kid)
                .leftJoin(attendance)
                .on(kid.kidSeq.eq(attendance.kidSeq))
                .where(kid.classSeq.eq(classSeq),
                        anyOf(attendance.updatedAt.between(startOfDay, endOfDay), attendance.isNull()))
                .fetch();
    }
}
