package com.wohaha.dodamdodam.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "tbl_schedule_type")
@Getter
@NoArgsConstructor
public class ScheduleType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "schedule_type_seq", nullable = false)
    private Long scheduleTypeSeq;

    @Column(name = "kindergarten_seq", nullable = false)
    private Long kindergartenSeq;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "is_valid", nullable = false, columnDefinition = "TINYINT(1) default 1")
    private boolean isValid;
}
