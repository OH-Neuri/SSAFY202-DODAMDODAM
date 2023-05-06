package com.wohaha.dodamdodam.domain;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import lombok.*;
import org.springframework.data.annotation.Id;
import org.springframework.data.redis.core.RedisHash;

import java.time.LocalDateTime;
import java.util.Map;

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
@AllArgsConstructor
@NoArgsConstructor
public class AuthParent {

    @Id
    private String phone;

    //key: code, value: AuthCode(seq,providedAt)
    Map<String, AuthCode> codeMap;

}

