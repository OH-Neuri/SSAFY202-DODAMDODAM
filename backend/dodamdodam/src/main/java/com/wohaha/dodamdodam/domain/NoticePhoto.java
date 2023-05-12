package com.wohaha.dodamdodam.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "tbl_notice_photo")
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class NoticePhoto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "notice_photo_seq", nullable = false)
    private Long noticePhotoSeq;

    @Column(name = "notice_seq", nullable = false)
    private Long noticeSeq;

    @Column(name = "photo")
    private String photo;

    @Column(name = "idx")
    private Integer idx;
}
