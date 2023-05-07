package com.wohaha.dodamdodam.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Entity
@Getter
@Table(name = "tbl_kindergarten_info")
@Setter
@NoArgsConstructor
@ToString
public class KindergartenInfo {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "kindergarten_info_seq", nullable = false)
  private Long kindergartenInfoSeq;

  @Column(name="name")
  private String name;

  @Column(name="director")
  private String director;

  @Column(name="address")
  private String address;

}
