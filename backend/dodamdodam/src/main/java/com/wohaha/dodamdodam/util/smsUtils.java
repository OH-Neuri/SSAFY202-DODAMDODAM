//package com.wohaha.dodamdodam.util;
//
//import net.nurigo.sdk.message.model.Message;
//import org.springframework.beans.factory.annotation.Value;
//
//public class smsUtils {
//  @Value("${coolsms.apiKey}")
//  private String apiKey;
//
//  @Value("${coolsms.secretKey}")
//  private String apiSecret;
//
//  @Value("${coolsms.from}")
//  private String from;
//
//  public void sendMessage(String to, String random) {
//
//    Message coolsms = new Message();
//
//    HashMap<String, String> params = new HashMap<String, String>();
//    params.put("to", toNumber);
//    params.put("from", fromNumber);
//    params.put("type", "SMS");
//    params.put("text", "[grabMe] 인증번호 "+randomNumber+" 를 입력하세요.");
//    params.put("app_version", "test app 1.2"); // application name and version
//
//    try {
//      JSONObject obj = (JSONObject) coolsms.send(params);
//      System.out.println(obj.toString());
//    } catch (CoolsmsException e) {
//      System.out.println(e.getMessage());
//      System.out.println(e.getCode());
//    }
//  }
//
//}