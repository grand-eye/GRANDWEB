package com.grand.util.mcash;

import java.io.PrintStream;

public class McashCipher
{
  private static String padding = "123456789123456789";
  private String tradeid;
  private byte[] hashKey = null;
  
  public McashCipher(String tradeid)
  {
    this.tradeid = tradeid;
    String tmpKey = tradeid;
    int keyLength = tradeid.length();
    if (keyLength < 16) {
      tmpKey = tmpKey + padding.substring(0, 16 - keyLength);
    } else {
      tmpKey = tmpKey.substring(tmpKey.length() - 16, tmpKey.length());
    }
    byte[] tmp = tmpKey.getBytes();
    for (int i = 0; i < 16; i++) {
      tmp[i] = ((byte)(tmp[i] ^ i + 1));
    }
    this.hashKey = tmp;
  }
  
  public String encodeString(String plainValue)
  {
    return McashSeed.encodeString(plainValue, this.hashKey);
  }
  
  public String decodeString(String cipherValue)
  {
    return McashSeed.decodeString(cipherValue, this.hashKey).trim();
  }
  
  public static byte[] getKey(String hashKey)
  {
    String tmpKey = hashKey;
    int keyLength = hashKey.length();
    if (keyLength < 16) {
      tmpKey = tmpKey + padding.substring(0, 16 - keyLength);
    } else {
      tmpKey = tmpKey.substring(tmpKey.length() - 16, tmpKey.length());
    }
    byte[] tmp = tmpKey.getBytes();
    for (int i = 0; i < 16; i++) {
      tmp[i] = ((byte)(tmp[i] ^ i + 1));
    }
    return tmp;
  }
  
  public static String encodeString(String plainValue, String hashKey)
  {
    return McashSeed.encodeString(plainValue, getKey(hashKey));
  }
  
  public static String decodeString(String cipherValue, String hashKey)
  {
    return McashSeed.decodeString(cipherValue, getKey(hashKey)).trim();
  }
  
  public static void main(String[] args)
  {
    String tradeid = "13424427496561354564564645646";
    
    String plainText = "원본텍스트입니다";
    
    String encodeText = encodeString(plainText, tradeid);
    
    String decodeText = decodeString(encodeText, tradeid).trim();
    
    /*System.out.println("원본:" + plainText);
    System.out.println("암호화:" + encodeText);
    System.out.println("복호화:" + decodeText);
    
    System.out.println("====================================================================");
    System.out.println(" 가맹점측 결제정보  암호화 전달값  ");
    System.out.println("====================================================================");*/
    
    tradeid = "20120706123456789";
    String Okurl = "www.daum.net";
    String Prdtprice = "55000";
    String Cryptstring = Prdtprice + Okurl;
    
    String cOkurl = encodeString(Okurl, tradeid);
    String cPrdtprice = encodeString(Prdtprice, tradeid);
    String cCryptstring = encodeString(Cryptstring, tradeid);
    /*System.out.println("Okurl=" + cOkurl);
    System.out.println("Prdtprice=" + cPrdtprice);
    System.out.println("Cryptstring=" + cCryptstring);
    
    System.out.println("====================================================================");
    System.out.println(" 모빌리언스  전달값  복호화 ");
    System.out.println("====================================================================");
    
    System.out.println("Okurl=" + decodeString(cOkurl, tradeid));
    System.out.println("Prdtprice=" + decodeString(cPrdtprice, tradeid));
    System.out.println("Cryptstring=" + decodeString(cCryptstring, tradeid));
    
    System.out.println("암호화전달값체크 =" + 
      decodeString(cCryptstring, tradeid).equals(
      new StringBuffer(String.valueOf(decodeString(cPrdtprice, tradeid))).append(decodeString(cOkurl, tradeid)).toString()));*/
  }
}
