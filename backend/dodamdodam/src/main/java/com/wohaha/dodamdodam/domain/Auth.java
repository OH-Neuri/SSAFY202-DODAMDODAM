package com.wohaha.dodamdodam.domain;

import java.sql.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import lombok.Setter;

@Entity
@Table(name = "tbl_auth")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Auth {
  @Id
  @Column(name = "phone", nullable = false)
  private String phone;

  @Column(name = "code", nullable = false)
  private String code;

  @Column(name = "is_checked", nullable = false)
  private Boolean isChecked;

  @Column(name = "request_cnt", nullable = false)
  private Integer requestCnt;

}
