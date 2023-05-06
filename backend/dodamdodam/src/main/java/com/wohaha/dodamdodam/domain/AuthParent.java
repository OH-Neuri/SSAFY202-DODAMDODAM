package com.wohaha.dodamdodam.domain;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.Id;
import org.springframework.data.redis.core.RedisHash;

import java.time.LocalDateTime;

/*
  @value : 해쉬키값(테이블명)
  @timeToLive : 만료시간
 */
@RedisHash(
        value = "authParent",
        timeToLive = 60L * 60L * 24L
)
@Getter
@Setter
@ToString
@Builder
public class AuthParent {

    @Id
    private String phone;

    private String code;

    private Long kidSeq;

    @JsonDeserialize(
            using = LocalDateTimeDeserializer.class
    )
    @JsonSerialize(
            using = LocalDateTimeSerializer.class
    )
    private LocalDateTime providedAt;

}

