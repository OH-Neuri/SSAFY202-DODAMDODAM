package com.wohaha.dodamdodam.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "tbl_medicine")
@Getter
@NoArgsConstructor
@Builder
@AllArgsConstructor
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

    private Timestamp requestDate;

    @Column(name = "request_name", nullable = false)
    private String requestName;


    @Column(name = "response_date")
    private Timestamp responseDate;

    @Column(name = "response_name")
    private String responseName;
}
