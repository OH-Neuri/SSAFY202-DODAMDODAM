package com.wohaha.dodamdodam.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "tbl_kid")
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Kid {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "kid_seq", nullable = false)
    private Long kidSeq;

    @Column(name = "user_seq")
    private Long userSeq;

    @Column(name = "class_seq", nullable = false)
    private Long classSeq;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "photo", nullable = false)
    private String photo;

    @Column(name = "birth", nullable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birth;

    @Column(name = "gender")
    private String gender;
}
