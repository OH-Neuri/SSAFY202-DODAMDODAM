package com.wohaha.dodamdodam.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "tbl_class_teacher")
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ClassTeacher {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "class_teacher_seq", nullable = false)
    private Long classTeacherSeq;

    @Column(name = "user_seq", nullable = false)
    private Long userSeq;

    @Column(name = "class_seq", nullable = false)
    private Long classSeq;
}
