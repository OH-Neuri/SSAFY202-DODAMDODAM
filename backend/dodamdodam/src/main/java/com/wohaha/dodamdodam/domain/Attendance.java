package com.wohaha.dodamdodam.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Time;
import java.sql.Timestamp;

@Entity
@Table(name = "tbl_attendance")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Attendance {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "attendance_seq", nullable = false)
    private Long attendanceSeq;

    @Column(name = "kid_seq", nullable = false)
    private Long kidSeq;

    @Column(name = "forth_time")
    private Time forthTime;

    @Column(name = "back_time")
    private Time backTime;

    @Column(name = "back_way")
    private String backWay;

    @Column(name = "parent_name")
    private String parentName;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "temp_parent_name")
    private String tempParentName;

    @Column(name = "temp_phone_number")
    private String tempPhoneNumber;

    @Column(name = "forth_time_check")
    private Time forthTimeCheck;

    @Column(name = "back_time_check")
    private Time backTimeCheck;

    @Column(name = "created_at")
    private Timestamp createdAt;

    @Column(name = "updated_at")
    private Timestamp updatedAt;

}
