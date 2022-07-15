package com.grand.util.common;

public class NullUtil {

    /**
     * 문자열이 null 이거나 NULL 에 관련된 문자는 모두 whiteSpace를 반환한다.
     * 
     * @param string
     * @return String
     */
    public static String nullToWhiteSpace( String string ) {
    	string = isNull( string ) ? "" : string;
    	String whitespace = upperCase(string);
        if(whitespace.equals("NULL"))string="";
    	else if(whitespace.equals("(NULL)"))string="";
    	return string;
    }
    
    /**
     * 문자열 대문자 반환한다.
     * 
     * @param string
     * @return String
     */
    public static String upperCase(String s){
        char cArray[] = s.toCharArray();
        String upperStr ="";
        for (int i=0; i<cArray.length; i++){
                Character ch = new Character(cArray[i]);
                if (ch.isLowerCase(cArray[i])){
                	upperStr += ch.toUpperCase(cArray[i])+"";
                }else{
                	upperStr += ch+"";;
                }
        }
        return upperStr;
    }

    /**
     * 문자열 소문자 반환한다.
     * 
     * @param string
     * @return String
     */
    public static String lowerCase(String s){
        char cArray[] = s.toCharArray();
        String upperStr ="";
        for (int i=0; i<cArray.length; i++){
                Character ch = new Character(cArray[i]);
                if (ch.isUpperCase(cArray[i])){
                	upperStr += ch.toLowerCase(cArray[i])+"";
                }else{
                	upperStr += ch+"";;
                }
        }
        return upperStr;
    }

    /**
     * 첫 문자가 대문자인지 소문자인지 반환한다. 대문자 true 소문자 false
     * 
     * @param string
     * @return String
     */
    public static boolean isUpperChar(String s){
        boolean isupper=false;
    	char cArray[] = s.toCharArray();
        Character ch = new Character(cArray[0]);
        if (ch.isUpperCase(cArray[0])){
        	isupper = true;
        }
        return isupper;
    }

    /* Util.java 파일에서 이동 */
    /**
     * 문자열의 널값 검사를 한다.
     * <BR>문자열이 null 또는 white space인 경우에는 "참"을 반환한다.
     *
     * @param str
     * @return  boolean
     */
    public static boolean isNull( String str ) {
        return ( str == null || "null".equals( str ) || "".equals( str ) );
    }
    
    
    /* Util.java 파일에서 이동 */    
    /**
     * 문자열의 널값 검사를 한다.
     * <BR>문자열이 null 또는 white space인 경우에는 "거짓"을 반환한다.
     *
     * @param str
     * @return  boolean
     */
    public static boolean isNotNull( String str ) {
        return !( str == null || "".equals( str ) );
    }

    /* Util.java 파일에서 이동 */    
    /**
     * 문자열이 null인 경우에는 whiteSpace를 반환한다.
     *
     * @param string
     * @return String
     */
    public static String nullToEmptyString( String string ) {
    	return isNull( string ) ? "" : string;
    }    
    
    
	/**
	 * 문자열이 null인 경우에는 " "를 반환한다.
	 * 
	 * @param string
	 * @return String
	 */
    
    /* StringUtil.java 파일에서 이동 */    
	public static String nullToBlankString(String string) {

		if (isNull(string)) {
			string = " ";
		}
		string = string.replace('　', ' ');
		string = string.trim();
		return string;
	}    
	
	/**
	 * 문자열이 null인 경우에는 "0"를 반환한다.
	 * 
	 * @param string
	 * @return String
	 */
	
    /* StringUtil.java 파일에서 이동 */	
	public static String nullToZeroString(String string) {

		if (isNull(string)) {
			string = "0";
		} else if (string.equals("")) {
			string = "0";
		} else if (string.trim().equals("")) {
			string = "0";
		}
		return string;
	}	
	
	
    /**
     * 문자열이 null이거나 값이 없으면 대체 스트링으로 반환한다.
     *
     * @param string
     * @param replace
     * @return String
     */
	
	/* Util.java 파일에서 이동 */
	public static String nullOrEmptyToReplaceString(String string, String replace) {

		if (string == null || string.length() == 0) {
			return replace;
		} else {
			return string;
		}
	}	
	
	
	/**
	 * 파라미터가 null 이거나 공백이 있을경우 "" 로 return
	 * 
	 * @param value
	 * @return
	 */
	
	/* StringUtil.java 파일에서 이동 */
	public static String replaceNull(String value) {

		return replaceNull(value, "");
	}

	/**
	 * 파라미터로 넘어온 값이 null 이거나 공백이 포함된 문자라면 defaultValue를 return 아니면 값을 trim해서 넘겨준다.
	 * 
	 * @param value
	 * @param repStr
	 * @return
	 */
	
	/* StringUtil.java 파일에서 이동 */
	public static String replaceNull(String value, String defaultValue) {

		if (NullUtil.isNull(value)) {
			return defaultValue;
		}
		return value.trim();
	}
	
}
