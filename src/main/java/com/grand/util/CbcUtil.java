package com.grand.util;


import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;


public class CbcUtil {
	static String charset = "utf-8";
	
    public static byte pbUserKey[] = { (byte) 0x2c, (byte) 0x11, (byte) 0x19, (byte) 0x1d, (byte) 0x1f, (byte) 0x16, (byte) 0x12,
            (byte) 0x12, (byte) 0x11, (byte) 0x19, (byte) 0x1d, (byte) 0x1f, (byte) 0x10, (byte) 0x14, (byte) 0x1b,
            (byte) 0x16 };

	public static byte bszIV[] = { (byte)0x00, (byte)0x5F, (byte)0xA0, (byte)0x0F, (byte)0xE0, (byte)0x2A, (byte)0xBB, (byte)0x00,
			(byte)0x00, (byte)0xB2, (byte)0x3E, (byte)0x79, (byte)0x4D, (byte)0xCE, (byte)0x89, (byte)0x00};
	
	

    public static byte[] encrypt(String str) {
        byte[] enc = null;
        try {
            //암호화 함수 호출
            enc = KISA_SEED_CBC.SEED_CBC_Encrypt(pbUserKey, bszIV, str.getBytes(charset), 0, str.getBytes(charset).length);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
 
        Encoder encoder = Base64.getEncoder();
        byte[] encArray = encoder.encode(enc);
        /*try {
            System.out.println(new String(encArray, "utf-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }*/
        return encArray;
    }
    
    public static String decrypt(byte[] str) {
    	 
        Decoder decoder = Base64.getDecoder();
        byte[] enc = decoder.decode(str);
 
        String result = "";
        byte[] dec = null;
 
        try {
            //복호화 함수 호출
            dec = KISA_SEED_CBC.SEED_CBC_Decrypt(pbUserKey, bszIV, enc, 0, enc.length);
            result = new String(dec, charset);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
 
        return result;
    }
}
