package com.wohaha.dodamdodam.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.LocalDate;

@Entity
@Table(name = "tbl_food")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Food {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "food_seq", nullable = false)
    private Long foodSeq;

    @Column(name = "kindergarten_seq", nullable = false)
    private Long kindergartenSeq;

    @Column(name = "date", nullable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate date;

    @Column(name = "rice")
    private String rice;

    @Column(name = "soup")
    private String soup;

    @Column(name = "dish1")
    private String dish1;

    @Column(name = "dish2")
    private String dish2;

    @Column(name = "dish3")
    private String dish3;

    @Column(name = "morning_snack1")
    private String morningSnack1;

    @Column(name = "morning_snack2")
    private String morningSnack2;

    @Column(name = "afternoon_snack1")
    private String afternoonSnack1;

    @Column(name = "afternoon_snack2")
    private String afternoonSnack2;

    @Column(name = "created_at")
    private Timestamp createdAt;

    @Column(name = "updated_at")
    private Timestamp updatedAt;
}
