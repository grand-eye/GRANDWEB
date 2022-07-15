package com.grand.util.common;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;

public class DateUtil {

	private static final int minYear  = 1900;
	private static final int maxYear = 2200;
	private static final int minMonth = 1;
	private static final int maxMonth = 12;
	private static final int minDay = 1;
	private static final int maxDay = 31;
	private static final int minHour = 1;
	private static final int maxHour = 23;
	private static final int childMax = 12;
	private static final int infantMax = 2;
	private static String delimYearStr = "년";
	private static String delimMonthStr = "월";
	private static String delimDayStr = "일";
	private static String delimHourStr = "시";
	private static String delimMinStr = "분";
	private static String delimYearToMonth = "-";
	private static String delimMonthToDay = "-";
	private static String delimDayToHour = " ";
	private static String delimHourToMin = ":";
	private static String delimMinToSec = ":";
	private static String delimDate = "/";
	private static String TIMEZONE = "GMT+9";

	/**
	 * 현재 일자
	 * 
	 * @return "yyyy"
	 */
	public static String getYear() {

		return DateUtil.getDateUtil("yyyy");
	}

	/**
	 * 현재 월
	 * 
	 * @return "MM"
	 */
	public static String getMonth() {

		return DateUtil.getDateUtil("MM");
	}

	/**
	 * 현재 일자
	 * 
	 * @return "yyyyMM"
	 */
	public static String getYearMonth() {

		return DateUtil.getDateUtil("yyyyMM");
	}

	/**
	 * 현재 일
	 * 
	 * @return "dd"
	 */
	public static String getDay() {

		return DateUtil.getDateUtil("dd");
	}

	/**
	 * 현재 일자
	 * 
	 * @return "yyyyMMdd"
	 */
	public static String getDate() {

		return DateUtil.getDateUtil("yyyyMMdd");
	}
	

	/**
	 * 현재 일자
	 * 
	 * @return "yyyyMMdd"
	 */
	public static String getDateTime() {

		return DateUtil.getDateUtil("yyyyMMddHHmmss");
	}	
	
	public static String getDateTime2() {

		return DateUtil.getDateUtil("yyyy-MM-dd HH:mm:ss");
	}		
	
	public static String getDate2() {

		return DateUtil.getDateUtil("yyyy-MM-dd");
	}
		
	
	/**
	 * 현재 일자
	 * 
	 * @return "yyMMdd"
	 */
	public static String getDateMin() {

		return DateUtil.getDateUtil("yyMMdd");
	}
	

	public static String getDatePattern(String ptrn) {

		return DateUtil.getDateUtil(ptrn);
	}
	
	
	/**
	 * 하루 다음일자
	 * 
	 * @return "yyyyMMdd"
	 */
	public static String getNexDate() {

		return DateUtil.getOffsetDate(1);
	}

	/**
	 * 하루 이전일자
	 * 
	 * @return "yyyyMMdd"
	 */
	public static String getPrevDate() {

		return DateUtil.getOffsetDate(-1);
	}

	/**
	 * 현재 시간 : 시분초
	 * 
	 * @return "HHmmss"
	 */
	public static String getTime() {

		return DateUtil.getDateUtil("HHmmss");
	}

	/**
	 * 현재 시간 : 시분초(밀리Sec)
	 * 
	 * @return "HHmmssSSS"
	 */
	public static String getMiliTime() {

		return DateUtil.getDateUtil("HHmmssSSS");
	}

	/**
	 * 현재 시간 : 분초(밀리Sec)
	 * 
	 * @return "mmssSSS"
	 */
	public static String getMinMiliSec() {

		return DateUtil.getDateUtil("mmssSSS");
	}

	/**
	 * 현재 날짜와시간
	 * 
	 * @return "yyyyMMddHHmmss"
	 */
	public static String getDateMinTime() {

		return DateUtil.getDateUtil("yyyyMMddHHmm");
	}

	/**
	 * 현재 날짜와시간
	 * 
	 * @return "yyyyMMddHHmmss"
	 */
	public static String getDateSecTime() {

		return DateUtil.getDateUtil("yyyyMMddHHmmss");
	}

	/**
	 * 현재 날짜와시간
	 * 
	 * @return "yyyyMMddHHmmssSSS"
	 */
	public static String getDateMiliSecTime() {

		return DateUtil.getDateUtil("yyyyMMddHHmmssSSS");
	}

	/**
	 * 현재 날짜에서 offset을 계산한 날짜 리턴
	 * 
	 * @return "yyyyMMdd"
	 */
	public static String getOffsetDate(int offset) {

		return DateUtil.getDateUtil("yyyyMMdd", offset);
	}

	
	
	public static String getOffsetDate(String sDate, int offset, String Pattern) throws ParseException {

		return DateUtil.getDateUtil(Pattern, sDate, offset);
	}	
	/**
	 * 현재 날짜에서 offset을 계산한 날짜 리턴
	 * 
	 * @return "yyyyMMddHHmmss"
	 */
	public static String getOffsetDateTime(int offset) {

		return DateUtil.getDateUtil("yyyyMMddHHmmss", offset);
	}

	/**
	 * 현재 날짜에서 offset을 계산한 날짜 리턴
	 * 
	 * @return "yyyyMMddHHmmssSSS"
	 */
	public static String getOffsetDateMiliTime(int offset) {

		return DateUtil.getDateUtil("yyyyMMddHHmmssSSS", offset);
	}

	/**
	 * 입력한 날짜에 대한 Calendar 객체 반환
	 * 
	 * @param dateStr
	 *        YYYYMMddHHmm
	 * @return
	 */
	public static Calendar getCalendarObj(String dateStr) {

		TimeZone tz = TimeZone.getTimeZone(DateUtil.TIMEZONE);
		Calendar cal = Calendar.getInstance(tz, Locale.KOREAN);
		cal.set(Integer.valueOf(dateStr.substring(0, 4)), Integer.valueOf(dateStr.substring(4, 6)) - 1, Integer.valueOf(dateStr.substring(6, 8)), Integer.valueOf(dateStr.substring(8, 10)), Integer.valueOf(dateStr.substring(10)));
		return cal;
	}

	/**
	 * 입력한 날짜에 대한 Calendar 객체 반환
	 * 
	 * @param dateStr
	 *        YYYYMMdd
	 * @return
	 */
	public static Calendar getCalendarObj2(String dateStr) {

		TimeZone tz = TimeZone.getTimeZone(DateUtil.TIMEZONE);
		Calendar cal = Calendar.getInstance(tz, Locale.KOREAN);
		cal.set(Integer.valueOf(dateStr.substring(0, 4)), Integer.valueOf(dateStr.substring(4, 6)) - 1, Integer.valueOf(dateStr.substring(6, 8)));
		return cal;
	}

	/**
	 * 입력한 날짜에 대한 Calendar 객체 반환
	 * 
	 * @param dateStr
	 *        YYYYMMddHHmm
	 * @return
	 */
	public static Calendar getCalendarObj(String dateStr, String timeZone) {

		TimeZone tz = TimeZone.getTimeZone(timeZone);
		Calendar cal = Calendar.getInstance(tz, Locale.KOREAN);
		cal.set(Integer.valueOf(dateStr.substring(0, 4)), Integer.valueOf(dateStr.substring(4, 6)) - 1, Integer.valueOf(dateStr.substring(6, 8)), Integer.valueOf(dateStr.substring(8, 10)), Integer.valueOf(dateStr.substring(10)));
		return cal;
	}

	/**
	 * 입력한 Forma 으로 날짜와시간 반환
	 * 
	 * @param pattern
	 * @return formatted string representation of current day and time with your pattern.
	 */
	public static String getDateUtil(String pattern) {

		SimpleDateFormat simpleFormat = new SimpleDateFormat(pattern);
		TimeZone tz = TimeZone.getTimeZone(DateUtil.TIMEZONE);
		Calendar cal = Calendar.getInstance(tz, Locale.KOREAN);
		simpleFormat.setTimeZone(tz);
		return simpleFormat.format(cal.getTime());
	}

	public static String getDateUtil(String pattern, int offset) {

		SimpleDateFormat simpleFormat = new SimpleDateFormat(pattern);
		TimeZone tz = TimeZone.getTimeZone(DateUtil.TIMEZONE);
		Calendar cal = GregorianCalendar.getInstance(tz, Locale.KOREAN);
		cal.add(Calendar.DAY_OF_YEAR, offset);
		simpleFormat.setTimeZone(tz);
		return simpleFormat.format(cal.getTime());
	}
	
	public static String getDateUtil(String pattern, String setDate, int offset) throws ParseException {

		SimpleDateFormat simpleFormat = new SimpleDateFormat(pattern);
		TimeZone tz = TimeZone.getTimeZone(DateUtil.TIMEZONE);
		Calendar cal = GregorianCalendar.getInstance(tz, Locale.KOREAN);
		cal.setTime( simpleFormat.parse(setDate) );
		cal.add( Calendar.DATE , offset);
		
		simpleFormat.setTimeZone(tz);
		return simpleFormat.format(cal.getTime());
	}	

	/**
	 * 다음 년도
	 * 
	 * @return "yyyyMMdd"
	 */
	public static String getNextYear() {

		return DateUtil.getNextYear(DateUtil.getDate());
	}

	/**
	 * 입력한 년도의 다음 년도
	 * 
	 * @param date :
	 *        "yyyyMMdd"
	 * @return "yyyyMMdd"
	 */
	public static String getNextYear(String date) {

		if (date == null && date.length() < 8) {
			return "";
		}
		StringBuffer sb = new StringBuffer(date);
		int year = Integer.parseInt(sb.substring(0, 4));
		year += 1;
		sb.replace(0, 4, Integer.toString(year));
		return sb.toString();
	}

	/**
	 * 입력한 년도의 다음 년도
	 * 
	 * @param date :
	 *        "yyyyMMdd"
	 * @return "yyyyMMdd"
	 */
	public static String getNextYear(String date, int yearCnt) {

		if (date == null && date.length() < 8) {
			return "";
		}
		StringBuffer sb = new StringBuffer(date);
		int year = Integer.parseInt(sb.substring(0, 4));
		year += yearCnt;
		sb.replace(0, 4, Integer.toString(year));
		return sb.toString();
	}

	/**
	 * 입력한 일자에 dayCnt만큼 일자를 변경한다 ex) getNextDay('20080730', 3) -> return value : '20080802'
	 * 
	 * @param date
	 * @param dayCnt
	 * @return
	 */
	public static String getNextDay(String date, int dayCnt) {

		String result = null;
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyyMMdd");
		try {
			Date dt = simpledateformat.parse(date.replace("-", ""));
			calendar.setTime(dt);
			calendar.add(Calendar.DAY_OF_MONTH, dayCnt);
			dt = calendar.getTime();
			result = simpledateformat.format(dt);
		} catch (java.text.ParseException parseexception) {
			result = date;
		}
		return result;
	}

	public static String getNextMonthDay(String date, int dayCnt) {

		String result = null;
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyyMMdd");
		try {
			Date dt = simpledateformat.parse(date.replace("-", ""));
			calendar.setTime(dt);
			calendar.add(Calendar.MONTH , dayCnt);
			dt = calendar.getTime();
			result = simpledateformat.format(dt);
		} catch (java.text.ParseException parseexception) {
			result = date;
		}
		return result;
	}	
	
	public static String getNextMonthDay2(String date, int dayCnt) {

		String result = null;
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date dt = simpledateformat.parse(date.replace("-", ""));
			calendar.setTime(dt);
			calendar.add(Calendar.MONTH , dayCnt);
			dt = calendar.getTime();
			result = simpledateformat.format(dt);
		} catch (java.text.ParseException parseexception) {
			result = date;
		}
		return result;
	}		
	/**
	 * 이전 년도
	 * 
	 * @return "yyyyMMdd"
	 */
	public static String getPrevYear() {

		return DateUtil.getPrevYear(DateUtil.getDate());
	}

	/**
	 * 입력한 년도의 이전년도
	 * 
	 * @param date
	 *        "yyyyMMdd"
	 * @return "yyyyMMdd"
	 */
	public static String getPrevYear(String date) {

		if (date == null && date.length() < 8) {
			return "";
		}
		StringBuffer sb = new StringBuffer(date);
		int year = Integer.parseInt(sb.substring(0, 4));
		year -= 1;
		sb.replace(0, 4, Integer.toString(year));
		return sb.toString();
	}

	/**
	 * 입력한 년, 월의 총 일수
	 * 
	 * @param year
	 * @param month
	 * @return int
	 */
	public static int getTotalDays(int year, int month) {

		int totalDays = 0;
		// ------------------------------------------------------------
		// 1. 각 달의 총 날수를 구한다.
		// ----------------------------------------------------------
		if (month == 4 || month == 6 || month == 9 || month == 11) {
			totalDays = 30;
		} else {
			totalDays = 31;
		}
		// --------------------------------------------------------
		// 1-1.윤년에 따른 2월 총 날수 구한다.
		// --------------------------------------------------------
		if (month == 2) {
			// 윤년조사
			if ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)) {
				totalDays = 29;
			} else {
				totalDays = 28;
			}
		}
		return totalDays;
	}

	/**
	 * 입력한 날짜의 년도
	 * 
	 * @param date
	 *        "yyyyMMdd"
	 * @return "yyyy"
	 */
	public static String getYear(String date) {

		return (date.length() == 8) ? date.substring(0, 4) : date;
	}

	/**
	 * 입력한 날짜의 달
	 * 
	 * @param date
	 *        "yyyyMMdd"
	 * @return "MM"
	 */
	public static String getMonth(String date) {

		return (date.length() == 8) ? date.substring(4, 6) : date;
	}

	/**
	 * 입력한 날짜의 일
	 * 
	 * @param date
	 *        "yyyyMMdd"
	 * @return "dd"
	 */
	public static String getDay(String date) {

		return (date.length() == 8) ? date.substring(6) : date;
	}

	/**
	 * 입력한 날짜의 년도
	 * 
	 * @param date
	 *        "yyyyMMddHHmmss"
	 * @return "yyyy"
	 */
	public static String getYearLong(String date) {

		return (date.length() == 14) ? date.substring(0, 4) : date;
	}

	/**
	 * 입력한 날짜의 달
	 * 
	 * @param date
	 *        "yyyyMMddHHmmss"
	 * @return "MM"
	 */
	public static String getMonthLong(String date) {

		return (date.length() == 14) ? date.substring(4, 6) : date;
	}

	/**
	 * 입력한 날짜의 일
	 * 
	 * @param date
	 *        "yyyyMMddHHmmss"
	 * @return "dd"
	 */
	public static String getDayLong(String date) {

		return (date.length() == 14) ? date.substring(6, 8) : date;
	}

	/**
	 * 입력한 날짜의 시
	 * 
	 * @param date
	 *        "yyyyMMddHHmmss"
	 * @return "HH"
	 */
	public static String getHourLong(String date) {

		return (date.length() == 14) ? date.substring(8, 10) : date;
	}

	/**
	 * 입력한 날짜의 분
	 * 
	 * @param date
	 *        "yyyyMMddHHmmss"
	 * @return "mm"
	 */
	public static String getMinuteLong(String date) {

		return (date.length() == 14) ? date.substring(10, 12) : date;
	}

	/**
	 * 입력한 날짜의 초
	 * 
	 * @param date
	 *        "yyyyMMddHHmmss"
	 * @return "ss"
	 */
	public static String getSecondLong(String date) {

		return (date.length() == 14) ? date.substring(12) : date;
	}

	/**
	 * 년월일시분초 에대한 delimeter setting
	 * 
	 * @param dlmY2M
	 * @param dlmM2D
	 * @param dlmD2H
	 * @param dlmH2M
	 * @param dlmM2S
	 */
	public static void setDateFormat(String dlmY2M, String dlmM2D, String dlmD2H, String dlmH2M, String dlmM2S) {

		DateUtil.delimYearToMonth = dlmY2M;
		DateUtil.delimMonthToDay = dlmM2D;
		DateUtil.delimDayToHour = dlmD2H;
		DateUtil.delimHourToMin = dlmH2M;
		DateUtil.delimMinToSec = dlmM2S;
	}

	/**
	 * delimeter setting 의한 현재 "년월일"을 return
	 * 
	 * @return yyyy DELIM mm DELIM dd
	 */
	
	public static String getFormattedDate() {

		return DateUtil.getDateUtil("yyyy" + DateUtil.delimYearToMonth + "MM" + DateUtil.delimMonthToDay + "dd");
	}
	

	/**
	 * delimeter setting 의한 현재 "년월일"을 return
	 * 
	 * @return yyyy DELIM mm DELIM dd
	 */
	public static String getFormattedKorDate() {

		return DateUtil.getDateUtil("yyyy" + DateUtil.delimYearStr + "MM" + DateUtil.delimMonthStr + "dd" + DateUtil.delimDayStr);
	}

	/**
	 * delimeter setting 의한 현재 "년월일시분초"를 return
	 * 
	 * @return yyyy DELIM mm DELIM dd DELIM HH DELIM mm DELIM ss DELIM
	 */
	public static String getFormattedTodayLong() {

		return DateUtil.getDateUtil("yyyy" + DateUtil.delimYearToMonth + "MM" + DateUtil.delimMonthToDay + "dd" + DateUtil.delimDayToHour + "HH" + DateUtil.delimHourToMin + "mm" + DateUtil.delimMinToSec + "ss");
	}

	/**
	 * delimeter setting 의한 현재 "년/월/일 시:분:초"를 return
	 * 
	 * @return yyyy/MM/dd HH:mm:ss
	 */
	public static String getFormattedTodaysLong() {

		return DateUtil.getDateUtil("yyyy/MM/dd HH:mm:ss");
	}

	/**
	 * String Type 년, 월, 일을 입력받아 하나의 Date Format으로 return
	 * 
	 * @return yyyyMMdd
	 */
	public static String getDate(String year, String month, String day) {

		String dateString = "";
		dateString += (year == null || year.equals("")) ? Integer.toString(DateUtil.minYear) : ((year.length() > 4) ? Integer.toString(DateUtil.maxYear) : year);
		dateString += (month == null || month.equals("")) ? Integer.toString(DateUtil.minMonth) : ((month.length() == 1) ? ("0" + month) : ((month.length() > 2) ? Integer.toString(DateUtil.maxMonth) : month));
		dateString += (day == null || day.equals("")) ? Integer.toString(DateUtil.minDay) : ((day.length() == 1) ? ("0" + day) : ((day.length() > 2) ? Integer.toString(DateUtil.maxDay) : day));
		return dateString;
	}

	/**
	 * int Type 년, 월, 일을 입력받아 하나의 Date Format으로 return
	 * 
	 * @return yyyyMMdd
	 */
	public static String getDate(int year, int month, int day) {

		String dateString = "";
		String monthString = "";
		String dayString = "";
		int yearNum, monthNum, dayNum;
		yearNum = (year < DateUtil.minYear) ? DateUtil.minYear : ((year > DateUtil.maxYear) ? DateUtil.maxYear : year);
		dateString = Integer.toString(yearNum);
		monthNum = (month < DateUtil.minMonth) ? DateUtil.minMonth : ((month > DateUtil.maxMonth) ? DateUtil.maxMonth : month);
		monthString = Integer.toString(monthNum);
		dateString += (monthString.length() == 1) ? ("0" + monthString) : monthString;
		dayNum = (day < DateUtil.minDay) ? DateUtil.minDay : ((day > DateUtil.maxDay) ? DateUtil.maxDay : day);
		dayString = Integer.toString(dayNum);
		dateString += (dayString.length() == 1) ? ("0" + dayString) : dayString;
		return dateString;
	}

	/**
	 * yyyyMMdd Format의 Date를 입력받아 setDateFormat(..)으로 다시 셋팅했거나 기본적으로 셋팅된 Date Format으로 변경하여 return
	 * 
	 * @param yyyyMMdd
	 * @return default yyyy/MM/dd
	 */
	public static String getFormattedDate(String dateStr) {

		if (dateStr == null) {
			dateStr = "";
		}
		if (dateStr.length() == 8) {
			return DateUtil.getYear(dateStr) + DateUtil.delimYearToMonth + DateUtil.getMonth(dateStr) + DateUtil.delimMonthToDay + DateUtil.getDay(dateStr);
		} else {
			return dateStr;
		}
	}

	/**
	 * yyyyMMdd Format의 Date를 입력받아 setDateFormat(..)으로 다시 셋팅했거나 기본적으로 셋팅된 Date Format으로 변경하여 return
	 * 
	 * @param dateStr
	 * @return yyyy.mm.dd
	 */
	public static String getFormattedDate2(String dateStr) {

		if (dateStr == null) {
			dateStr = "";
		}
		if (dateStr.length() == 8) {
			return DateUtil.getYear(dateStr) + "." + DateUtil.getMonth(dateStr) + "." + DateUtil.getDay(dateStr);
		} else {
			return dateStr;
		}
	}

	/**
	 * yyyyMMdd Format의 Date를 입력받아 setDateFormat(..)으로 다시 셋팅했거나 기본적으로 셋팅된 Date Format으로 변경하여 return
	 * 
	 * @param yyyyMMdd
	 * @return default yyyy년MM월dd일
	 */
	public static String getFormattedDareKor(String dateStr) {

		if (dateStr.length() == 8) {
			return DateUtil.getYear(dateStr) + DateUtil.delimYearStr + DateUtil.getMonth(dateStr) + DateUtil.delimMonthStr + DateUtil.getDay(dateStr) + DateUtil.delimDayStr;
		} else {
			return dateStr;
		}
	}

	/**
	 * yyyyMMddHHmmss Format의 Date를 입력받아 setDateFormat(..)으로 다시 셋팅했거나 기본적으로 셋팅된 Date Format으로 변경하여 return
	 * 
	 * @param yyyyMMddHHmmss
	 * @return default yyyy-MM-dd HH:mm:ss
	 */
	public static String getFormattedDateLong(String dateStr) {

		if (dateStr == null) {
			return "";
		}
		if (dateStr.length() == 14) {
			return DateUtil.getYearLong(dateStr) + DateUtil.delimYearToMonth + DateUtil.getMonthLong(dateStr) + DateUtil.delimMonthToDay + DateUtil.getDayLong(dateStr) + DateUtil.delimDayToHour + DateUtil.getHourLong(dateStr)
			+ DateUtil.delimHourToMin + DateUtil.getMinuteLong(dateStr) + DateUtil.delimMinToSec + DateUtil.getSecondLong(dateStr);
		} else {
			return dateStr;
		}
	}

	/**
	 * yyyyMMddHHmmss Format의 Date를 입력받아 setDateFormat(..)으로 다시 셋팅했거나 기본적으로 셋팅된 Date Format으로 변경하여 return
	 * 
	 * @param yyyyMMddHHmmss
	 * @return default yyyy-MM-dd HH:mm
	 */
	public static String getFormattedDateLong2(String dateStr) {

		if (dateStr == null) {
			dateStr = "";
		}
		if (dateStr.length() == 14) {
			return DateUtil.getYearLong(dateStr) + DateUtil.delimYearToMonth + DateUtil.getMonthLong(dateStr) + DateUtil.delimMonthToDay + DateUtil.getDayLong(dateStr) + DateUtil.delimDayToHour + DateUtil.getHourLong(dateStr)
			+ DateUtil.delimHourToMin + DateUtil.getMinuteLong(dateStr);
		} else {
			return dateStr;
		}
	}

	/**
	 * yyyyMMddHHmmss Format의 Date를 입력받아 setDateFormat(..)으로 다시 셋팅했거나 기본적으로 셋팅된 Date Format으로 변경하여 return
	 * 
	 * @param yyyyMMddHHmmss
	 * @return default yy-MM-dd HH:mm:ss
	 */
	public static String getFormattedDateLong4(String dateStr) {

		if (dateStr == null) {
			dateStr = "";
		}
		if (dateStr.length() == 14) {
			return DateUtil.getYearLong(dateStr).substring(2, 4) + DateUtil.delimYearToMonth + DateUtil.getMonthLong(dateStr) + DateUtil.delimMonthToDay + DateUtil.getDayLong(dateStr) + DateUtil.delimDayToHour
			+ DateUtil.getHourLong(dateStr) + DateUtil.delimHourToMin + DateUtil.getMinuteLong(dateStr);
		} else if (dateStr.length() == 8) {
			return DateUtil.getYearLong(dateStr).substring(2, 4) + DateUtil.delimYearToMonth + DateUtil.getMonthLong(dateStr) + DateUtil.delimMonthToDay + DateUtil.getDayLong(dateStr);
		} else {
			return dateStr;
		}
	}

	/**
	 * yyyyMMddHHmmss Format의 Date를 입력받아 setDateFormat(..)으로 다시 셋팅했거나 기본적으로 셋팅된 Date Format으로 변경하여 return
	 * 
	 * @param yyyyMMddHHmmss
	 * @return default yyyy/MM/dd HH:mm
	 */
	public static String getFormattedDateLongKor(String dateStr) {

		if (dateStr == null) {
			dateStr = "";
		}
		if (dateStr.length() == 14) {
			return DateUtil.getYearLong(dateStr) + DateUtil.delimYearStr + DateUtil.getMonthLong(dateStr) + DateUtil.delimMonthStr + DateUtil.getDayLong(dateStr) + DateUtil.delimDayStr + DateUtil.getHourLong(dateStr)
			+ DateUtil.delimHourStr + DateUtil.getMinuteLong(dateStr) + DateUtil.delimMinStr;
		} else {
			return dateStr;
		}
	}

	/**
	 * yyyyMMddHHmmss Format의 Date를 입력받아 setDateFormat(..)으로 다시 셋팅했거나 기본적으로 셋팅된 Date Format으로 변경 "년월일"만 return
	 * 
	 * @param yyyyMMddHHmmss
	 * @return default yyyy/MM/dd
	 */
	public static String getFormattedDateShort(String dateStr) {

		String formattedDateStr = "";
		if (dateStr != null && dateStr.length() == 14) {
			return formattedDateStr = DateUtil.getYearLong(dateStr) + DateUtil.delimYearToMonth + DateUtil.getMonthLong(dateStr) + DateUtil.delimMonthToDay + DateUtil.getDayLong(dateStr);
		} else if (dateStr == null) {
			return formattedDateStr;
		} else {
			return dateStr;
		}
	}

	/**
	 * yyyyMMddHHmmss Format의 Date를 입력받아 setDateFormat(..)으로 다시 셋팅했거나 기본적으로 셋팅된 Date Format으로 변경 "년월일"만 return
	 * 
	 * @param yyyyMMddHHmmss
	 * @return default yyyy-MM-dd
	 */
	public static String getFormattedDateShortWithHyphen(String dateStr) {

		String formattedDateStr = "";
		if (dateStr != null && dateStr.length() == 14) {
			return formattedDateStr = DateUtil.getYearLong(dateStr) + "-" + DateUtil.getMonthLong(dateStr) + "-" + DateUtil.getDayLong(dateStr);
		} 
		else if (dateStr != null && dateStr.length() == 8) 
		{
			return formattedDateStr = DateUtil.getYearLong(dateStr) + "-" + DateUtil.getMonthLong(dateStr) + "-" + DateUtil.getDayLong(dateStr);
		}
		
		else if (dateStr == null) 
		{
			return formattedDateStr;
		} 
		else
		{
			return dateStr;
		}
	}
	
	/*Util.java 파일에서 이동 */
	/**
	 * Date 객체의 날짜를 pattern의 형태로 반환한다.
	 *
	 * @param date
	 * @param pattern
	 * @return String
	 */
    public static String getPatternDate( Date date, String pattern ) {
    	return  new SimpleDateFormat( pattern ).format( date );
    }
    
    
    /*Util.java 파일에서 이동 */
    /**
     * 현재시간과초 HHmmss 까지 리턴해준다.
     * @param
     * @return String
     * @throws Exception
     */
	public static String getHHMISS() throws Exception	{
		SimpleDateFormat todayFormat=null;
		String dateString=null;
		try
		{
			java.util.Date   today = new java.util.Date();
			todayFormat = new SimpleDateFormat("HHmmss");
			dateString  = todayFormat.format(today);
			return dateString;
			//System.out.println(inputDate+" Day "+today_hour+"HH"+input_min+"MI"+input_sec+"SS  ||Message : "+putMsg);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return dateString;
	}    
    
    
    /*Util.java 파일에서 이동 */
    /**
     * 특정경로에 파일을 날짜별로 적는다.
     * @param
     * @return String
     * @throws Exception
     */
	public static String getYesterday() throws Exception	{
		SimpleDateFormat todayFormat=null;
		String dateString=null;
		
		try {
			long curTime = System.currentTimeMillis();
			curTime = curTime-86400000;
			java.util.Date   yesterday = new java.util.Date(curTime);
			todayFormat = new SimpleDateFormat("yyyyMMdd");
			dateString  = todayFormat.format(yesterday);
			return dateString;
			//System.out.println(inputDate+" Day "+today_hour+"HH"+input_min+"MI"+input_sec+"SS  ||Message : "+putMsg);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return dateString;
	}    
    
    
    /*Util.java 파일에서 이동 */
	/**
	 * 입력한 날짜의 전날을 리턴해준다
	 * @param inputday
	 * @param addmon
	 * @param addday
	 * @param addgubun
	 * @return
	 */
	public static String getcalculateday(String inputday, int addmon, int addday, String addgubun) {

		String strYear="";
		String strMon = "";
		String strDay ="";

		if(inputday.length()<8) {
			inputday = inputday+"01";		//년월이 들어왔을땐 8자리로 맞춰준다.
		}

		Calendar cal = new GregorianCalendar();
		cal.set(Integer.parseInt(inputday.substring(0, 4)),
	              Integer.parseInt(inputday.substring(4, 6))-1,
	              Integer.parseInt(inputday.substring(6, 8)));


		if(addgubun.equals("A")){
			cal.add(Calendar.MONTH, addmon);
			cal.add(Calendar.DATE, addday);
		}else{
			cal.add(Calendar.MONTH, -addmon);
			cal.add(Calendar.DATE, -addday);
		}

		strYear = String.valueOf(cal.get(Calendar.YEAR));

		//월계산
		if(cal.get(Calendar.MONTH)+1<10) {
			strMon = "0"+(cal.get(Calendar.MONTH)+1);
		}
		else{
			strMon = (cal.get(Calendar.MONTH)+1)+"";
		}

		//일계산
		if(addday>0){
			if((int)cal.get(Calendar.DATE)<10){
				strDay = "0"+String.valueOf(cal.get(Calendar.DATE));
			}
			else{
				strDay = String.valueOf(cal.get(Calendar.DATE));
			}
		}

		return strYear+strMon+strDay;
	}	
	
	
	/* Util.java 파일에서 이동 */
	/**
     * 날짜에 - 넣어주기
     * @param datestr
     * @return
     */
	public static String getNewsRoomDate(String datestr)  {

        String yyyy="";
        String mm="";
        String dd="";

        yyyy = datestr.substring(0,4);
        mm   = datestr.substring(4,6);
        dd   = datestr.substring(6,8);

        String times = yyyy + "-" + mm + "-" + dd;

        return times;
       }

	
	/* Util.java 파일에서 이동 */
    /**
     * getPatternDate
     * @param datestr
     * @return
     */
	public static String getPatternDate(String datestr)  {

    	String times = datestr;


    	if(datestr.length() > 16) times = datestr.substring(0, 10);


        return times;
    }

	/* Util.java 파일에서 이동 */
	/**
     * getPatternDate
     * @param datestr
     * @param pattern
     * @return
     */
	public static String getPatternDate(String datestr,String pattern)  {

        String y="";
        String m="";
        String d="";
        String hh="";
        String mm="";

        String times = "";

        if(datestr.indexOf("-")>-1){
        	if(datestr.length() > 16) times = datestr.substring(0, 16);
        }else{
	        if(datestr.length() > 6){
	        	//2012 06 13 08 23 51

	        	y = datestr.substring(0,4);
		        m   = datestr.substring(4,6);
		        if(datestr.length()>=8) d = datestr.substring(6,8);

		        if(datestr.length()==14){
		        	hh = datestr.substring(8,10);
		        	mm = datestr.substring(10,12);
		        }

		        if(datestr.length()==6){
		        	times = y + pattern + m;
		        }else if(datestr.length()==8){
		        	times = y + pattern + m + pattern + d;
		        }else if(datestr.length()==14){
		        	times = y + pattern + m + pattern + d + " " + hh + ":" + mm;
		        }else{
		        	times = y + pattern + m + pattern + d;
		        }
	        }else{
	        	times = datestr;
	        }
        }

        return times;
	}
	
	/* StringUtil.java 파일에서 이동 */
	/**
	 * 현재의 년월일 까지 리턴해준다.
	 * 
	 * @param
	 * @return String
	 * @throws Exception
	 */
	public static String getYYYYMMDD() throws Exception {

		SimpleDateFormat todayFormat = null;
		String dateString = null;
		try {
			java.util.Date today = new java.util.Date();
			todayFormat = new SimpleDateFormat("yyyy-MM-dd");
			dateString = todayFormat.format(today);
			return dateString;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dateString;
	}	
	
	public static long getDateDiff( String pattern, String start, String end) throws ParseException
	{
		SimpleDateFormat myFormat = new SimpleDateFormat(pattern);
		Date date1 = myFormat.parse(start);
		Date date2 = myFormat.parse(end);
		
		long diff = date2.getTime() - date1.getTime();
		return TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
	
	}

}
