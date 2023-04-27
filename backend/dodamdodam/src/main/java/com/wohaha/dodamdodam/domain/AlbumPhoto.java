package com.wohaha.dodamdodam.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "tbl_album_photo")
@Getter
@NoArgsConstructor
public class AlbumPhoto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "album_photo_seq", nullable = false)
    private Long albumPhotoSeq;

    @Column(name = "album_seq", nullable = false)
    private Long albumSeq;

    @Column(name = "photo")
    private String photo;
}
