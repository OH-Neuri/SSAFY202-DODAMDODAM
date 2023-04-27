package com.wohaha.dodamdodam.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "tbl_medicine")
@Getter
@NoArgsConstructor
public class Medicine {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "medicine_seq", nullable = false)
    private Long medicineSeq;

    @Column(name = "kid_seq", nullable = false)
    private Long kidSeq;

    @Column(name = "symptom")
    private String symptom;

    @Column(name = "pill")
    private String pill;

    @Column(name = "capacity")
    private String capacity;

    @Column(name = "count")
    private String count;

    @Column(name = "time")
    private String time;

    @Column(name = "keep")
    private String keep;

    @Column(name = "content")
    private String content;

    @Column(name = "request_date", nullable = false)
    private Timestamp requestDate;

    @Column(name = "request_name", nullable = false)
    private String requestName;

    @Column(name = "request_sign", nullable = false)
    private String requestSign;
    @Column(name = "response_date")
    private Timestamp responseDate;

    @Column(name = "response_name")
    private String responseName;

    @Column(name = "response_sign")
    private String responseSign;
}
