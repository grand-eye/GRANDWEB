package com.grand.util.common;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class StringUtil {
	
	public static boolean isEmpty(Object obj) {
        if (obj == null) { return true; }
        if ((obj instanceof String) && (((String)obj).trim().length() == 0)) { return true; }
        if (obj instanceof Map) { return ((Map<?, ?>) obj).isEmpty(); }
        if (obj instanceof List) { return ((List<?>)obj).isEmpty(); }
        if (obj instanceof Object[]) { return (((Object[])obj).length == 0); }

        return false;
    }
	
	public static String replaceDoubleQuter( String str)
	{
		String replaceStr = str.replace("\"", "");
		return replaceStr;
	}
	
	public static String getRandomString(int length)
	{
	  StringBuffer buffer = new StringBuffer();
	  Random random = new Random();
	 
	  String chars[] = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,0,1,2,3,4,5,6,7,8,9".split(",");
	 
	  for (int i=0 ; i<length ; i++)
	  {
		  buffer.append(chars[random.nextInt(chars.length)]);
	  }
	  return buffer.toString();
	}
	
	
	/**
	 * 목록의 제목이 max보다 클경우 max 크기만큼만 잘라서 반환한다.
	 * 
	 * @param s -
	 *        String
	 * @param max -
	 *        int
	 * @return String
	 */
	public static String formatTitle(String s, int max) {

		if (s == null) {
			return "";
		}
		if (s.length() <= max) {
			return s;
		}
		String tmp = null;
		byte bTmp[] = null;
		String rets = "";
		for (int i = 0, k = 0; i < s.length(); i++) {
			tmp = s.substring(i, i + 1);
			bTmp = tmp.getBytes();
			if (bTmp.length > 1) {
				rets += tmp;
				k += 2;
			} else {
				rets += tmp;
				k++;
			}
			if (max <= k) {
				break;
			}
		}
		return rets + "...";
	}

	public static String formatTitleLen(String strData, int cutLen) {

		if (strData == null || strData.equals("")) {
			return "";
		}
		strData = strData.trim();
		byte[] data = strData.getBytes();
		byte[] tmp;
		int len = data.length;
		if (cutLen >= len) {
			tmp = new byte[len];
			System.arraycopy(data, 0, tmp, 0, len);
		} else {
			cutLen = cutLen - 3;
			int pos = cutLen - 1;
			try {
				while ((data[pos] & 0x80) == 0x80) {
					pos--;
				}
			} catch (Exception ex) {}
			tmp = new byte[cutLen + 3];
			System.arraycopy(data, 0, tmp, 0, cutLen - ((cutLen + pos + 1) % 2));
		}
		String strTemp = new String(tmp);
		strTemp = strTemp.trim();
		byte[] datatemp = strTemp.getBytes();
		if (datatemp.length >= cutLen - 1) {
			strTemp = strTemp.substring(0, strTemp.length() - 1);
		}
		if (len > cutLen) {
			strTemp = strTemp + "...";
		}
		return strTemp;
	}

	/**
	 * 문자열을 변환한다.
	 * 
	 * @param str -
	 *        String
	 * @param pattern -
	 *        String
	 * @param replace -
	 *        String
	 * @return String
	 */
	public static String replace(String str, String pattern, String replace) {

		int s = 0;
		int e = 0;
		StringBuffer result = new StringBuffer();
		
		while ((e = str.indexOf(pattern, s)) >= 0) {
			result.append(str.substring(s, e));
			result.append(replace);
			s = e + pattern.length();
		}
		
		result.append(str.substring(s));
		return result.toString();
	}

	/**
	 * 문자열 해당코드로 변환한다..
	 * 
	 * @param str -
	 *        String
	 * @param encode -
	 *        String
	 * @param charsetName -
	 *        String
	 * @return String
	 * @throws UnsupportedEncodingException
	 */
	private static String encodeText(String str, String encode, String charsetName) {

		String result = null;
		try {
			result = NullUtil.isNull(str) ? null : new String(str.getBytes(encode), charsetName);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 문자열을 euc-kr에서 8859_1로 디코딩 한다.
	 * 
	 * @param str
	 * @return String
	 * @throws UnsupportedEncodingException
	 */
	public static String decode(String str) {

		return StringUtil.encodeText(str, "euc-kr", "ISO-8859-1");
	}

	/**
	 * 문자열을 8859_1에서 euc-kr로 인코딩 한다.
	 * 
	 * @param str
	 * @return String
	 * @throws UnsupportedEncodingException
	 */
	public static String encode(String str) {

		return StringUtil.encodeText(str, "ISO-8859-1", "euc-kr");
	}

	/**
	 * 문자열을 8859_1에서 ksc5601로 인코딩 한다.
	 * 
	 * @param str
	 * @return String
	 * @throws UnsupportedEncodingException
	 */
	public static String encodek(String str) {

		return StringUtil.encodeText(str, "8859_1", "KSC5601");
	}

	/**
	 * 문자열을 ksc5601에서 8859_1로 디코딩 한다.
	 * 
	 * @param str
	 * @return String
	 * @throws UnsupportedEncodingException
	 */
	public static String decodek(String str) {

		return StringUtil.encodeText(str, "KSC5601", "8859_1");
	}

	/**
	 * 문자열을 8859_1에서 ksc5601로 인코딩 한다.
	 * 
	 * @param str
	 * @return String
	 * @throws UnsupportedEncodingException
	 */
	public static String encodeu(String str) {

		return StringUtil.encodeText(str, "8859_1", "UTF-8");
	}

	/**
	 * 문자열을 ksc5601에서 8859_1로 디코딩 한다.
	 * 
	 * @param str
	 * @return String
	 * @throws UnsupportedEncodingException
	 */
	public static String decodeu(String str) {

		return StringUtil.encodeText(str, "UTF-8", "8859_1");
	}

	/**
	 * 특정 패턴의 갯수를 리턴한다. ex)System.out.print("단어: " + count(word, "[^\\s]+") + "개, "); System.out.print("공백: " +
	 * count(word, "\u0020") + "개, "); System.out.print("탭 : " + count(word, "\t") + "개\n");
	 * 
	 * @param target
	 * @param pattern
	 * @return int
	 */
	public static final int count(String target, String pattern) {

		Pattern p = Pattern.compile(pattern);
		Matcher matcher = p.matcher(target);
		int c = 0;
		for (int i = 0; matcher.find(i); c++, i = matcher.end()) {
			;
		}
		return c;
	}

	/**
	 * formatInt()
	 * 
	 * @param value
	 * @return 포맷으로 표현된 문자열
	 */
	public static String formatInt(int value) {

		return StringUtil.formatInt(String.valueOf(value));
	}

	/**
	 * formatInt() 입력받은 문자열을 천단위 구분자(,)가 있는 문자열로 반환한다.
	 * 
	 * @param value
	 *        String
	 * @return 포멧으로 표현된 문자열
	 */
	public static String formatInt(String value) {

		long longvalue = Long.parseLong(value);
		NumberFormat format = NumberFormat.getInstance();
		format.setGroupingUsed(true);
		return format.format(longvalue);
	}

	public static String formatInt(long value) {

		NumberFormat format = NumberFormat.getInstance();
		format.setGroupingUsed(true);
		return format.format(value);
	}

	/**
	 * 내용 읽기 <br>
	 * 태그 포함
	 * 
	 * @param comment
	 * @return
	 */
	public static String getContent(String comment) {

		return StringUtil.br("", "<br>", comment);
	}

	public static String br(String first, String brTag, String comment) {

		StringBuffer buffer = new StringBuffer();
		StringTokenizer st = new StringTokenizer(comment, "\n");
		int count = st.countTokens();
		buffer.append(first);
		int i = 1;
		while (st.hasMoreTokens()) {
			if (i == count) {
				buffer.append(st.nextToken());
			} else {
				buffer.append(st.nextToken() + brTag);
			}
			i++;
		}
		return buffer.toString();
	}

	/**
	 * 입력한 단어가 숫자인지 확인
	 * 
	 * @param String
	 *        putMsg
	 * @param String
	 *        logPath
	 * @return
	 * @throws Exception
	 */
	public synchronized static boolean getIsNumber(String putMsg) {

		boolean intyn = false;
		char cArray[] = putMsg.toCharArray();
		char[] carr = new char[cArray.length];
		for (int i = 0; i < cArray.length; i++) {
			if (cArray[i] == '0' || cArray[i] == '1' || cArray[i] == '2' || cArray[i] == '3' || cArray[i] == '4' || cArray[i] == '5' || cArray[i] == '6' || cArray[i] == '7' || cArray[i] == '8' || cArray[i] == '9') {
				carr[i] = cArray[i];
				intyn = true;
			} else {
				intyn = false;
				break;
			}
		}
		return intyn;
	}

	/**
	 * 입력한 단어를 숫자로 변환
	 * 
	 * @param String
	 *        putMsg
	 * @param String
	 *        logPath
	 * @return
	 * @throws Exception
	 */
	public synchronized static int getNumber(String putMsg) {

		int returnint = 0;
		char cArray[] = putMsg.toCharArray();
		char[] carr = new char[cArray.length];
		carr = cArray;
		for (int i = 0; i < cArray.length; i++) {
			if (cArray[i] == '0') {
				carr[i] = ' ';
			} else {
				break;
			}
		}
		String newstr = new String(carr);
		newstr = newstr.trim();
		returnint = Integer.parseInt(newstr);
		return returnint;
	}

	/**
	 * 문자열 자르기
	 * 
	 * @param strData
	 * @param cutLen
	 * @return
	 */
	public static String cutBytes(String strData, int cutLen) {

		if (strData == null || strData.equals("")) {
			return "";
		}
		strData = strData.trim();
		byte[] data = strData.getBytes();
		byte[] tmp;
		int len = data.length;
		if (cutLen >= len) {
			tmp = new byte[len];
			System.arraycopy(data, 0, tmp, 0, len);
		} else {
			cutLen = cutLen - 3;
			int pos = cutLen - 1;
			try {
				while ((data[pos] & 0x80) == 0x80) {
					pos--;
				}
			} catch (Exception ex) {}
			tmp = new byte[cutLen + 3];
			System.arraycopy(data, 0, tmp, 0, cutLen - ((cutLen + pos + 1) % 2));
		}
		String strTemp = new String(tmp);
		strTemp = strTemp.trim();
		byte[] datatemp = strTemp.getBytes();
		if (datatemp.length >= cutLen - 1) {
			strTemp = strTemp.substring(0, strTemp.length() - 1);
		}
		if (len > cutLen) {
			strTemp = strTemp + "...";
		}
		return strTemp;
	}

	
	/**
	 * 로그 포멧으로 해당 시간 남기기
	 * @param mesg
	 * @return
	 */
	public static String logStr(String mesg) {

		if (NullUtil.isNull(mesg)) {
			mesg = "";
		}
		mesg = "[" + DateUtil.getPatternDate(new java.util.Date(), "HH:mm:ss") + "] " + mesg + "\r\n";
		return mesg;
	}

 
	/**
	 * 현대카드와의 통신전문에서 금액을 12자리로 맞추기 위해서...
	 * 12345 ==> 000000012345
	 * @param amt
	 * @return
	 */
	public static String toNcrmAmount(String amt) {

		String retTmp = "";
		if (NullUtil.isNull(amt)) {
			return "000000000000";
		}
		int index = 0;
		int size = amt.length();
		for (int i = 0; i < 12; i++) {
			if ((12 - i) > size) {
				retTmp += "0";
			} else {
				retTmp += amt.charAt(index++);
			}
		}
		return retTmp;
	}

 
	/**
	 * 카드에 - 넣어주기..
	 * @param CardNo
	 * @return
	 */
	public static String getRCard(String CardNo) {

		String CardNo1 = "";
		String CardNo2 = "";
		String CardNo3 = "";
		String CardNo4 = "";
		String cards = "";
		if (CardNo != null && !CardNo.equals("") && CardNo.length() == 16) {
			CardNo1 = CardNo.substring(0, 4);
			CardNo2 = CardNo.substring(4, 8);
			CardNo3 = CardNo.substring(8, 12);
			CardNo4 = CardNo.substring(12);
			cards = CardNo1 + "-" + CardNo2 + "-" + CardNo3 + "-" + CardNo4;
		}
		return cards;
	}

 
	/**
	 * 주민번호에 - 넣어주기..
	 * @param Jumin
	 * @return
	 */
	public static String getRJumin(String Jumin) {

		String Jumin1 = "";
		String Jumin2 = "";
		String Jumins = Jumin;
		if (Jumin != null && !Jumin.equals("") && Jumin.length() == 13) {
			Jumin1 = Jumin.substring(0, 6);
			Jumin2 = Jumin.substring(6);
			Jumins = Jumin1 + "-" + Jumin2;
		}
		return Jumins;
	}

 
	/**
	 * 사업자번호에 - 넣어주기..
	 * @param BsNo
	 * @return
	 */
	public static String getRBsNo(String BsNo) {

		String BsNo1 = "";
		String BsNo2 = "";
		String BsNo3 = "";
		String BsNos = BsNo;
		if (BsNo != null && !BsNo.equals("") && BsNo.length() == 10) {
			BsNo1 = BsNo.substring(0, 3);
			BsNo2 = BsNo.substring(3, 5);
			BsNo3 = BsNo.substring(5);
			BsNos = BsNo1 + "-" + BsNo2 + "-" + BsNo3;
		}
		return BsNos;
	}

 
	/**
	 * 우편번호호에 - 넣어주기..
	 * @param Zip
	 * @return
	 */
	public static String getRZip(String Zip) {

		String Zip1 = "";
		String Zip2 = "";
		String Zips = "";
		if (Zip != null && !Zip.equals("") && Zip.length() == 6) {
			Zip1 = Zip.substring(0, 3);
			Zip2 = Zip.substring(3);
			Zips = Zip1 + "-" + Zip2;
		}
		return Zips;
	}

	
	/**
	 * 입력된 String을 Delimeter로 토크나이징 하여 토크나이징된 토큰들을 String 배열로 반환한다.
	 * 
	 * @param pm_sString
	 *        토크나이징되는 문자열
	 * @param pm_sDelimeter
	 *        문자열를 분리하는 delimeter 문자
	 * @return 토크나이징된 토큰들의 String 배열
	 * @see java.util.StringTokenizer
	 */
	public static String[] getTokens(String pm_sString, String pm_sDelimeter) {

		StringTokenizer lm_oTokenizer = new StringTokenizer(pm_sString, pm_sDelimeter);
		String[] lm_sReturns = new String[lm_oTokenizer.countTokens()];
		for (int i = 0; lm_oTokenizer.hasMoreTokens(); i++) {
			lm_sReturns[i] = lm_oTokenizer.nextToken();
		}
		return lm_sReturns;
	}

	/**
	 * 특정 문자열 앞의 문자열을 리턴 - 검색 문자열이 없으면 전체 문자열 리턴
	 * 
	 * @param str
	 * @return
	 */
	public static String substringBefore(String str, String search) {

		str = NullUtil.nullToEmptyString(str);
		if (str.indexOf(search) > -search.length()) {
			return str.substring(0, str.indexOf(search));
		} else {
			return str;
		}
	}

	/**
	 * 특정 문자열 뒤의 문자열을 리턴 - 검색할 문자열이 없으면 빈 문자열 리턴
	 * 
	 * @param str
	 * @return
	 */
	public static String substringAfter(String str, String search) {

		str = NullUtil.nullToEmptyString(str);
		if (str.indexOf(search) > -search.length()) {
			return str.substring(str.indexOf(search) + search.length());
		} else {
			return "";
		}
	}

	/**
	 * string에 있는 ', ", \r\n 를 HTML 코드로 변환한다.
	 * 
	 * @param str
	 * @return
	 */
	public static String changeQuotation(String str) {

		String rtnValue = str;
		rtnValue = NullUtil.replaceNull(rtnValue);
		rtnValue = replace(replace(replace(replace(rtnValue, "'", "&#39;"), "\"", "&#34;"), "\r\n", "<br>"), "\n","<br>");
		return rtnValue;
	}

	/**
	 * string에 있는 ', ", \r\n 를 HTML 코드로 변환한다.
	 * 
	 * @param obj
	 * @return
	 */
	public static String changeQuotation(Object obj) {

		if (isStringInteger(obj)) {
			return changeQuotation(String.valueOf(obj));
		}
		return "";
	}

	/**
	 * 해당 Object가 String or Integer 이면 true 아니면 false
	 * 
	 * @param obj
	 * @return
	 */
	public static boolean isStringInteger(Object obj) {

		boolean flag = false;
		if (obj instanceof String || obj instanceof Integer) {
			flag = true;
		}
		return flag;
	}

	
	/**
	 * 트랜잭션 ID 생성
	 * 
	 * @param obj 트랜잭션이 수행되는 객체
	 * @return String 트랜잭션 ID
	 */
    public static String getTxId(Object obj) {

		String tx = null;
		if (obj != null) {
			tx = DateUtil.getDateMiliSecTime() + obj.hashCode();
		}
		return tx;
	}
    
    /**
     * 문자열의 널값 검사를 한다.
     * <BR>문자열이 null 또는 white space인 경우에는 "거짓"을 반환한다.
     *
     * @param str
     * @return  boolean
     */
    public static boolean isNotNull(String str) {
        return !(str == null || "".equals(str));
    }
    
    /* Util.java 파일에서 이동 */
    /**
     * 제목을 max만큼 잘라서 반환
     * @param s
     * @param max
     * @return
     */
    public static String formatTitleBlog( String s, int max )  {
        if( s == null ) return "";
        s = s.trim();
        if( s.getBytes().length <= max) return s;
        String tmp = null;
        byte bTmp[] = null;
        String rets = "" ;

        for(int i=0, k=0; i < s.length(); i++) {
            tmp = s.substring( i, i+1 );
            bTmp = tmp.getBytes();
            if( bTmp.length > 1 || NullUtil.isUpperChar(tmp) ) {
                rets += tmp;
                k +=2;
            }  else {
                rets += tmp;
                k ++;
            }

            if( max <= k ) break;
        }
        rets = rets.trim();
        return rets;
    }
    
    /* Utril.java 파일에서 이동 */
    /**
     * 문자열 자르기
     * @param strData
     * @param cutLen
     * @return
     */

    public static String selCutBytes(String gu, String strData, int cutLen) {

	    if(strData==null || strData.equals(""))return "";
	    strData = strData.trim();
	      byte[] data = strData.getBytes();

	      byte[] tmp;
	      int len = data.length;
	      if (cutLen*1.5 >= len) {
	          tmp = new byte[len];
	          System.arraycopy(data, 0, tmp, 0, len);
	      }
	      else {
	         cutLen = cutLen - 3;
	         int pos = cutLen - 1;

	         try{
		         while ((data[pos] & 0x80) == 0x80) {
		               pos--;
		         }
	           }catch(Exception ex){}
	         tmp = new byte[cutLen+3];
	         System.arraycopy(data, 0, tmp, 0, cutLen- ((cutLen + pos + 1) % 2));

	      }
	      String strTemp = new String(tmp);
	      strTemp = strTemp.trim();
	      byte[] datatemp = strTemp.getBytes();

	      if(gu.equals("A")){
		      if(datatemp.length>=cutLen-1){
		          strTemp = strTemp.substring(0, strTemp.length()-1);
		      }
		      //if(len > cutLen*1.5)strTemp=strTemp+"...";
	      }else{

	    	  if(len > cutLen*1.5){
	    		  strTemp = strData.substring(strTemp.length()-1);
	    	  }else{
	    		  strTemp = "";
	    	  }
	      }
	      return strTemp;
      }
    
    /* Util.java 파일에서 이동 */
	/**
	 * lineCount
	 * @param comment
	 * @return
	 */
	public static int lineCount(String comment){
		if(comment==null) return 0;
		StringBuffer buffer = new StringBuffer();
		StringTokenizer st = new StringTokenizer(comment, "\n");
		int count = st.countTokens();
		return count;
	}

    /* Util.java 파일에서 이동 */
	/**
	 * 라인수로 자르기...
	 * @param gu
	 * @param comment
	 * @param cutLen
	 * @return
	 */
	public static String setCutLines(String gu, String comment, int cutLen) {
		if(comment==null) return "";
		String cmtData = "";
		String tmp[] = comment.split("\n");
		int count = tmp.length;
		int i = 0;
		if(gu.equals("A")){
			count = cutLen-1;
		}else{
			if(count>cutLen-1) i = cutLen-1;
		}
		for (int j=i; j<count; j++){
			cmtData += tmp[j]+"<br>";
		}
		return cmtData;
	}    
	
	
    /* Util.java 파일에서 이동 */
    /**
     * lefPad
     * @param str
     * @param size
     * @param padChar
     * @return
     */
	public static String lefPad(String str, int size, String padChar) {
		
	     StringBuilder sb = new StringBuilder();
	      for (int i = 0; i < size; i++) {
	         sb.append(padChar);
	      }
	      String padding = sb.toString();
	      String paddedString = padding.substring(str.length()) + str;
	      return paddedString;
   }

	
	/* Util.java 파일에서 이동 */
    /**
     * uniQueName
     * @return
     */
	public static String uniQueName() {
    	String n = DateUtil.getDateMiliSecTime();
    	/*
    	int o = 0;
    	for(o=0;o<5;o++){
    		n += Math.floor(Math.random()*65535);
    	}
    	*/
    	return	"p"+n;
	}	
	
	
	public static String convertToHash(String _strValue, String _strAlgorithm){
		String strHash = ""; 
		
		if (NullUtil.isNull(_strValue)
				|| NullUtil.isNull(_strAlgorithm)) {
			return "";
		}
		
		if ((_strAlgorithm.equals("MD5")
				|| _strAlgorithm.equals("SHA-256")) == false) {
			return "";
		}
		
		try{
			MessageDigest md = MessageDigest.getInstance(_strAlgorithm); 
			md.update(_strValue.getBytes()); 
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer(); 
			for(int i = 0 ; i < byteData.length ; i++){
				sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
			}
			strHash = sb.toString();
			
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace(); 
			strHash = ""; 
		}
		return strHash;
	}
	
	
	/**
	 * @Method : convertToMD5
	 * @Description : String 값을 MD5 값으로 변경
	 * @param _strValue
	 * @return
	 */
	public static String convertToMD5(String _strValue) {
		return convertToHash(_strValue, "MD5");
	}
	
	/**
	 * @Method : convertToSHA256
	 * @Description : String 값을 SHA-256 값으로 변경
	 * @param _strValue
	 * @return
	 */
	public static String convertToSHA256(String _strValue) {
		return convertToHash(_strValue, "SHA-256");
	}
	
	public static String stringToHtml(String inputstr)
	{
		inputstr = inputstr.replaceAll("%20;", " ");
		inputstr = inputstr.replaceAll("&amp;", "&");
		inputstr = inputstr.replaceAll("&#35;", "#");
		inputstr = inputstr.replaceAll("&lt;", "<");
		inputstr = inputstr.replaceAll("&gt;", ">");
		inputstr = inputstr.replaceAll("&quot;", "'");
		inputstr = inputstr.replaceAll("&#39;", "\\");
		inputstr = inputstr.replaceAll("&#37;", "%");
		inputstr = inputstr.replaceAll("&#40;", "(");
		inputstr = inputstr.replaceAll("&#41;", ")");
		inputstr = inputstr.replaceAll("&#43;", "+");
		inputstr = inputstr.replaceAll("&#47;", "/");
		inputstr = inputstr.replaceAll("&#46", ".");
		inputstr = inputstr.replaceAll("&#59;", ";");
		return inputstr;
	}
}
