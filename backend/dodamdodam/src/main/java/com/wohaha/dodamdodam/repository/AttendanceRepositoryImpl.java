package com.wohaha.dodamdodam.repository;

import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.dto.response.AttendanceDetailResponseDto;
import com.wohaha.dodamdodam.dto.response.AttendanceFormResponseDto;
import com.wohaha.dodamdodam.dto.response.AttendanceListResponseDto;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;

import static com.querydsl.core.types.ExpressionUtils.anyOf;
import static com.wohaha.dodamdodam.domain.QKid.kid;
import static com.wohaha.dodamdodam.domain.QAttendance.attendance;
public class AttendanceRepositoryImpl implements AttendanceRepositoryCustom {
    @Autowired
    JPAQueryFactory query;

    @Override
    public List<AttendanceListResponseDto> getAttendanceList(Long classSeq, LocalDate day) {
        Timestamp startOfDay = Timestamp.valueOf(day.atStartOfDay());
        Timestamp endOfDay = Timestamp.valueOf(day.atTime(LocalTime.MAX));
        return query
                .select(Projections.constructor(AttendanceListResponseDto.class,
                        kid.kidSeq, kid.name, kid.photo,
                        attendance.attendanceSeq, attendance.forthTimeCheck, attendance.backTimeCheck))
                .from(kid)
                .leftJoin(attendance).on(kid.kidSeq.eq(attendance.kidSeq))
                .where(kid.classSeq.eq(classSeq),
                        anyOf(attendance.updatedAt.between(startOfDay, endOfDay), attendance.isNull()))
                .fetch();
    }

    @Override
    public Optional<AttendanceDetailResponseDto> getAttendanceDetail(Long attendanceSeq) {
        return Optional.ofNullable(query.select(Projections.constructor(AttendanceDetailResponseDto.class,
                kid.name, kid.photo, attendance.createdAt, attendance.forthTime, attendance.backTime,
                attendance.forthTimeCheck, attendance.backTimeCheck, attendance.parentName, attendance.phoneNumber, attendance.tempParentName, attendance.tempPhoneNumber, attendance.backWay))
                .from(attendance)
                .join(kid).on(attendance.kidSeq.eq(kid.kidSeq))
                .where(attendance.attendanceSeq.eq(attendanceSeq))
                .fetchOne());
    }

    @Override
    public Optional<AttendanceFormResponseDto> getAttendanceForm(Long kidSeq, LocalDate day) {
        Timestamp startOfDay = Timestamp.valueOf(day.atStartOfDay());
        Timestamp endOfDay = Timestamp.valueOf(day.atTime(LocalTime.MAX));
        return Optional.ofNullable(query
                .select(Projections.constructor(AttendanceFormResponseDto.class,
                        kid.name, kid.photo, attendance.forthTime, attendance.backTime, attendance.backWay,
                        attendance.parentName, attendance.phoneNumber, attendance.tempParentName, attendance.tempPhoneNumber))
                .from(attendance)
                .leftJoin(kid).on(kid.kidSeq.eq(attendance.kidSeq))
                .where(kid.kidSeq.eq(kidSeq),
                        anyOf(attendance.createdAt.between(startOfDay, endOfDay), attendance.isNull()))
                .fetchOne());
    }

    @Override
    public Long updateAttendanceForm(Long attendanceSeq, Time forthTimeCheck, Time backTimeCheck) {
        return query
                .update(attendance)
                .set(attendance.forthTimeCheck, forthTimeCheck)
                .set(attendance.backTimeCheck, backTimeCheck)
                .where(attendance.attendanceSeq.eq(attendanceSeq))
                .execute();
    }


}
