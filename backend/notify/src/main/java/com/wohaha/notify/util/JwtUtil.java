package com.wohaha.notify.util;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import java.util.Base64;
import java.util.Date;

public class JwtUtil {

    private static final String SECRET_KEY = Base64.getEncoder()
            .encodeToString("jwt-temp-secret-key".getBytes());

    public static Claims getClaims(String token) {
        try {
            token = token.replace("Bearer ","");
            return Jwts.parser().setSigningKey(SECRET_KEY).parseClaimsJws(token).getBody();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String getClaimAttribute(String token, String key){
        return getClaims(token).getOrDefault(key, null).toString();
    }

    //토큰 시간 지났는지 검사
    public static boolean isValidToken(String token) {
        return getClaims(token)
                .getExpiration()
                .after(new Date());
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
