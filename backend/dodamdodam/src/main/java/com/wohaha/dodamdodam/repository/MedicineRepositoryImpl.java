package com.wohaha.dodamdodam.repository;

import com.querydsl.core.types.Projections;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.dto.request.CompleteMedicineRequestDto;
import com.wohaha.dodamdodam.dto.response.MedicineClassResponseDto;
import com.wohaha.dodamdodam.dto.response.MedicineInfoResponseDto;
import com.wohaha.dodamdodam.dto.response.MedicineKidResponseDto;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.temporal.TemporalAdjusters;
import java.util.List;
import java.util.Optional;

import static com.wohaha.dodamdodam.domain.QKid.kid;
import static com.wohaha.dodamdodam.domain.QMedicine.medicine;

public class MedicineRepositoryImpl implements MedicineRepositoryCustom {

    @Autowired
    private JPAQueryFactory query;

    @Override
    public void updateMedicine(CompleteMedicineRequestDto completeMedicineRequestDto) {
        query
                .update(medicine)
                .set(medicine.responseDate, Timestamp.valueOf(completeMedicineRequestDto.getResponseDate()))
                .set(medicine.responseName, completeMedicineRequestDto.getResponseName())
//                .set(medicine.responseSign, completeMedicineRequestDto.getResponseSignUrl())
                .where(medicine.medicineSeq.eq(completeMedicineRequestDto.getMedicineSeq()))
                .execute();
    }

    @Override
    public long kidSeq(long medicineSeq) {
        return query
                .select(medicine.kidSeq)
                .from(medicine)
                .where(medicine.medicineSeq.eq(medicineSeq))
                .fetchOne();
    }

    @Override
    public List<MedicineClassResponseDto> getMedicineByClassList(Long classSeq, LocalDateTime date) {

        Timestamp startOfDate = Timestamp.valueOf(date.with(LocalTime.MIN));
        Timestamp endOfDate = Timestamp.valueOf(date.with(LocalTime.MAX));

        return query
                .select(Projections.constructor(MedicineClassResponseDto.class,
                        medicine.medicineSeq.as("medicineSeq"),
                        kid.name.as("name"),
                        kid.photo,
                        Expressions.stringTemplate("TIME_FORMAT({0}, '%H:%i')", medicine.responseDate).as("responseDate")))
                .from(medicine)
                .innerJoin(kid).on(medicine.kidSeq.eq(kid.kidSeq))
                .where(kid.classSeq.eq(classSeq).and(medicine.requestDate.between(startOfDate, endOfDate)))
                .orderBy(medicine.requestDate.asc())
                .fetch();
    }

    @Override
    public List<MedicineKidResponseDto> getMedicineByKidList(Long kidSeq, LocalDateTime date) {

        Timestamp startOfMonth = Timestamp.valueOf(date.withDayOfMonth(1).with(LocalTime.MIN));
        Timestamp endOfMonth = Timestamp.valueOf(date.with(TemporalAdjusters.lastDayOfMonth()).with(LocalTime.MAX));

        return
                query.select(Projections.fields(MedicineKidResponseDto.class,
                                medicine.medicineSeq,
                                medicine.responseDate.as("responseDate"),
                                medicine.requestDate.as("requestDate")))
                        .from(medicine)
                        .where(medicine.kidSeq.eq(kidSeq)
                                .and(medicine.requestDate.between(startOfMonth, endOfMonth)))
                        .orderBy(medicine.requestDate.asc())
                        .fetch();

    }

    @Override
    public Optional<MedicineInfoResponseDto> findMedicineById(Long medicineSeq) {
        return Optional.ofNullable(query.select(Projections.constructor(MedicineInfoResponseDto.class,
                        medicine.medicineSeq, medicine.kidSeq, medicine.symptom, medicine.pill, medicine.capacity, medicine.count,
                        medicine.time, medicine.keep, medicine.content, medicine.requestDate, medicine.requestName, medicine.responseDate, medicine.responseName))
                .from(medicine).where(medicine.medicineSeq.eq(medicineSeq))
                .fetchOne());
    }


}
