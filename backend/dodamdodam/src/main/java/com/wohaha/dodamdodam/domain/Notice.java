package com.wohaha.dodamdodam.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "tbl_notice")
@Getter
@NoArgsConstructor
public class Notice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "notice_seq", nullable = false)
    private Long noticeSeq;

    @Column(name = "class_seq", nullable = false)
    private Long classSeq;

    @Column(name = "title")
    private String title;

    @Column(name = "content")
    private String content;

    @Column(name = "announcement", nullable = false, columnDefinition = "TINYINT(1) default 0")
    private boolean announcement;

    @Column(name = "created_at", nullable = false)
    private Timestamp createdAt;

    @Column(name = "updated_at", nullable = false)
    private Timestamp updatedAt;

}
