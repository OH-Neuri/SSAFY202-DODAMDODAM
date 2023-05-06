package com.wohaha.dodamdodam.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "tbl_user")
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_seq", nullable = false)
    private Long userSeq;

    @Column(name = "id", nullable = false)
    private String id;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "name")
    private String name;

    @Column(name = "role", nullable = false)
    private Integer role;

    @Column(name = "phone_number")
    private String phoneNumber;

    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    @Column(name = "created_at")
    private Timestamp createdAt;

    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    @Column(name = "updated_at")
    private Timestamp updatedAt;

}
