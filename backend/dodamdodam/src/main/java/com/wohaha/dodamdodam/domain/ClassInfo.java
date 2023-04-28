package com.wohaha.dodamdodam.domain;

import lombok.*;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "tbl_class")
@Getter
@NoArgsConstructor
@Builder
@AllArgsConstructor
@ToString
public class ClassInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "class_seq", nullable = false)
    private Long classSeq;

    @Column(name = "kindergarten_seq", nullable = false)
    private Long kindergartenSeq;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "count", nullable = false)
    private Integer count;

    @Column(name = "age")
    private String age;

    @Column(name = "created_at")
    private Timestamp createdAt;

    @Column(name = "updated_at")
    private Timestamp updatedAt;
}
