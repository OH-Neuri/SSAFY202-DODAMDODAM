package com.wohaha.dodamdodam.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "tbl_notice_kid")
@Getter
@NoArgsConstructor
public class NoticeKid {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "notice_kid_seq", nullable = false)
    private Long noticeKidSeq;

    @Column(name = "notice_seq", nullable = false)
    private Long noticeSeq;

    @Column(name = "kid_seq", nullable = false)
    private Long kidSeq;


}
