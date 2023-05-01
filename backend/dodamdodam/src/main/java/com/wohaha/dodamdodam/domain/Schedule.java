package com.wohaha.dodamdodam.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "tbl_schedule")
@Getter
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class Schedule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "schedule_seq", nullable = false)
    private Long scheduleSeq;

    @Column(name = "kindergarten_seq", nullable = false)
    private Long kindergartenSeq;

    @Column(name = "class_seq")
    private Long classSeq;

    @Column(name = "schedule_type_seq")
    private Long scheduleTypeSeq;

    @Column(name = "content")
    private String content;

    @Column(name = "date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;

    @ManyToOne(targetEntity = ScheduleType.class)
    @JoinColumn(name = "schedule_type_seq", insertable = false, updatable = false)
    private ScheduleType scheduleType;
}
