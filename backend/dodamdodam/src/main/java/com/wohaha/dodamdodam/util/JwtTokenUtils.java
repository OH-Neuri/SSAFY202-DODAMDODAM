package com.wohaha.dodamdodam.util;

import com.wohaha.dodamdodam.domain.JwtTokenInfo;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import java.util.Base64;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;

public class JwtTokenUtils {

  private static final String SECRET_KEY = Base64.getEncoder()
      .encodeToString("jwt-temp-secret-key".getBytes());

  //access 토큰 15분
//  public static final long ACCESS_PERIOD = 1000L * 60L * 15L;

  //refresh 토큰 하루
  public static final long REFRESH_PERIOD = 1000L * 60L * 60L * 24L;

  //개발용 access 토큰 30일
  public static final long ACCESS_PERIOD = 1000L * 60L * 60L * 24L * 30L;

  //userIdx와 role로 토큰 발급
  public static JwtTokenInfo allocateToken(Long userSeq, Integer role) throws BaseException {
    try {
      JwtBuilder jwtBuilder = Jwts.builder()
          .setHeaderParam("alg", "HS256")
          .setHeaderParam("typ", "JWT");

      jwtBuilder.claim("userSeq", userSeq);
      jwtBuilder.claim("role", role);

      Date now = new Date();
      return new JwtTokenInfo(
          jwtBuilder.setIssuedAt(now)
              .setExpiration(new Date(now.getTime() + ACCESS_PERIOD))
              .signWith(SignatureAlgorithm.HS256, SECRET_KEY)
              .compact(),
          jwtBuilder.setIssuedAt(now)
              .setExpiration(new Date(now.getTime() + REFRESH_PERIOD))
              .signWith(SignatureAlgorithm.HS256, SECRET_KEY)
              .compact()
      );
    } catch (Exception e) {
      throw new BaseException(BaseResponseStatus.TOKEN_ALLOCATE_ERROR);

    }
  }

  public static Claims getClaims(String token) throws BaseException {
    try {
      token = token.replace("Bearer ","");
      return Jwts.parser().setSigningKey(SECRET_KEY).parseClaimsJws(token).getBody();
    } catch (Exception e) {
      throw new BaseException(BaseResponseStatus.TOKEN_CLAIM_ERROR, e.toString());
    }
  }

  public static String getClaimAttribute(String token, String key) throws BaseException {
    return getClaims(token).getOrDefault(key, null).toString();
  }

  //토큰 시간 지났는지 검사
  public static boolean isValidToken(String token) {
    return getClaims(token)
        .getExpiration()
        .after(new Date());
  }

  public static String resolveAccessToken(HttpServletRequest req) throws BaseException {

    String accessToken = req.getHeader("Authorization");
//    if (accessToken == null) {
//      throw new BaseException(BaseResponseStatus.TOKEN_NULL_ERROR);
//    }
    return accessToken;

  }
//
//  //userIdx와 role로 토큰 발급
//  public static TokenInfo allocateDevToken(Long userIdx) throws BaseException {
//    try {
//      JwtBuilder jwtBuilder = Jwts.builder()
//          .setHeaderParam("alg", "HS256")
//          .setHeaderParam("typ", "JWT");
//
//      jwtBuilder.claim("userIdx", userIdx);
//      jwtBuilder.claim("role", Role.TYPE5);
//
//      Date now = new Date();
//      return new TokenInfo(
//          jwtBuilder.setIssuedAt(now)
//              .setExpiration(new Date(now.getTime() + DEV_ACCESS_PERIOD))
//              .signWith(SignatureAlgorithm.HS256, SECRET_KEY)
//              .compact(),
//          jwtBuilder.setIssuedAt(now)
//              .setExpiration(new Date(now.getTime() + REFRESH_PERIOD))
//              .signWith(SignatureAlgorithm.HS256, SECRET_KEY)
//              .compact()
//      );
//    } catch (Exception e) {
//      throw new BaseException(BaseResponseStatus.TOKEN_ALLOCATE_ERROR);
//    }
//  }

}
