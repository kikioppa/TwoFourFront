package culturelandFront.core.util;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.time.DateUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class NdnUtil extends StringUtils {
	
	
	/**
	 * 옵션 데이타 가공
	 */
	public static Map optList_init(Map view){
		
		int optCnt = NdnUtil.checkInt(PropUtil.get("opt.cnt"));
		
		List optList = new ArrayList();
		for(int c=0;c<optCnt;c++){
			optList.add(view.get("op"+(c+1) ) );
		}
		view.put("optList", optList);

		
		return view;
	}

	public static String checkNull(String inputString) {
		return checkNull(inputString, "");
	}

	public static String checkNull(String inputString, String defaultString) {
		try{
			if (inputString == null) return defaultString;
		}catch(Exception e){
			return defaultString;
		}
		return inputString;
	}
	
	public static String checkNull(Object inputString) {
		return checkNull(inputString, "");
	}

	public static String checkNull(Object inputString, String defaultString) {
		if (inputString == null) return defaultString;
		return String.valueOf(inputString);
	}

	public static int checkInt(String numericString) {
		return checkInt(numericString, 0);
	}

	public static int checkInt(String numericString, int defaultInt) {
		if (numericString == null) return defaultInt;
		try {
			return Integer.parseInt(numericString);
		} catch (NumberFormatException e) {
			return defaultInt;
		}
	}
	
	public static float checkFloat(String numericString, float defaultInt) {
		if (numericString == null) return defaultInt;
		try {
			return Float.parseFloat(numericString);
		} catch (NumberFormatException e) {
			return defaultInt;
		}
	}
	
	
	public static int convertInt(Object obj) throws NumberFormatException {
		if( isEmpty(obj) ) {
			return 0;
		}
		
		return Integer.parseInt(obj.toString());
	}
	
	public static int convertInt(Object obj, int defaultInt)  {
		try {
			if( isEmpty(obj) ) {
				return defaultInt;
			}
			return convertInt(obj);
		} catch(NumberFormatException ne) {
			return defaultInt;
		}
	}
	
	public static String convertString(Object obj) {
		if( isEmpty(obj) )
			return "";
		else 
			return obj.toString();
	}
	
	/**
	 *  HashMap(String, String)  - > List
	 */
	public static List hashMapToList1(HashMap<String, String> map){
		
    	List entryList = new ArrayList();
	   	Map paramMap  = new HashMap();
	   	for (Entry<String, String>entry : map.entrySet()) {
	   		paramMap  = new HashMap();
	   		paramMap.put("key", entry.getKey());
	   		paramMap.put("value", entry.getValue());
	   		entryList.add(paramMap);
	   	}
		return entryList;
	}

	/**
	 *  HashMap(Integer, String)  - > List
	 */
	public static List hashMapToList2(HashMap<Integer, String> map){
		
    	List entryList = new ArrayList();
	   	Map paramMap  = new HashMap();
	   	for (Entry<Integer, String>entry : map.entrySet()) {
	   		paramMap  = new HashMap();
	   		paramMap.put("key", entry.getKey());
	   		paramMap.put("value", entry.getValue());
	   		entryList.add(paramMap);
	   	}
		return entryList;
	}

	
	public static String getToday() {
		return getToday("");
	}
	
	public static String addYear(int addyear) {
		Calendar aCalendar = Calendar.getInstance();
		int year = aCalendar.get(Calendar.YEAR) + addyear;
		return Integer.toString(year);
	}	
	
	public static String getYear() {
		Calendar aCalendar = Calendar.getInstance();
		int year = aCalendar.get(Calendar.YEAR);
		return Integer.toString(year);
	}
	
	public static String getMonth() {
		Calendar aCalendar = Calendar.getInstance();
		int month = aCalendar.get(Calendar.MONTH) + 1;
		return lpad(month, 2);
	}
	
	public static String getDay() {
		Calendar aCalendar = Calendar.getInstance();
		int month = aCalendar.get(Calendar.DATE);
		return lpad(month, 2);
	}
	
	public static String getDateDay() {
		Calendar aCalendar = Calendar.getInstance();
		int dayNum = aCalendar.get(Calendar.DAY_OF_WEEK);
		
		String day = "" ;
		switch(dayNum){
        case 1:
            day = "일";
            break ;
        case 2:
            day = "월";
            break ;
        case 3:
            day = "화";
            break ;
        case 4:
            day = "수";
            break ;
        case 5:
            day = "목";
            break ;
        case 6:
            day = "금";
            break ;
        case 7:
            day = "토";
            break ;
             
		}
		
		return day;
	}
	
	
	public static String addMonth(int add) {
		Calendar aCalendar = Calendar.getInstance();
		aCalendar.add(aCalendar.MONTH, add);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMM");
		String year = dateFormat.format(aCalendar.getTime()).substring(0,4);
		String month = dateFormat.format(aCalendar.getTime()).substring(4,6);
		return year + month;
	}
	
	/**
	 * 
	 * @param date
	 * @param day
	 * @return
	 */
	public static Date addDay(Date date, int day) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DATE, day);
        return cal.getTime();
	}
	
	/**
	 * 
	 * @param dateStr
	 * @param day
	 * @return
	 */
    public static String addDay(String dateStr, int day) {
        return addYearMonthDay(dateStr, 0, 0, day);
    }
    
    public static String addHours(int add, String format, String timeZone) {
		Date prevDate = DateUtils.addHours(new Date(), add);
		DateFormat df = new SimpleDateFormat(format);
		if( timeZone != null ) {
			TimeZone tz = TimeZone.getTimeZone(timeZone);
			df.setTimeZone(tz);
		}
		return df.format(prevDate); 
	}
    
    public static String addYearMonthDay(String sDate, int year, int month, int day) {

    	String dateStr = validChkDate(sDate);

        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd", Locale.getDefault());
        try {
            cal.setTime(sdf.parse(dateStr));
        } catch (ParseException e) {
            throw new IllegalArgumentException("Invalid date format: " + dateStr);
        }

        if (year != 0)
            cal.add(Calendar.YEAR, year);
        if (month != 0)
            cal.add(Calendar.MONTH, month);
        if (day != 0)
            cal.add(Calendar.DATE, day);
        return sdf.format(cal.getTime());
    }
	
	public static String lpad(int value, int len) {
		String str = Integer.toString(value);
		
		if( str.length() >= len )
			return str;
		
		int diff = len - str.length();
		for( int i = 0; i < diff  ; i++  ) {
			str = "0" + str;
		}
		return str;
	}
	
	public static String rpad(String value, int len) {
		if( value.length() >= len ) {
			return value;
		}
		
		String str = value;
		int diff = len - value.length();
		for( int i = 0; i < diff  ; i++  ) {
			str =  str + "0";
		}
		return str;
	}
	
    /**
     * 현재(한국기준) 날짜정보를 얻는다.                     
     * 표기법은 yyyy-mm-dd                                  
     * @return  String      yyyymmdd형태의 현재 한국시간.   
     */
    public static String getToday(String dateType) {
        Calendar aCalendar = Calendar.getInstance();

        int year = aCalendar.get(Calendar.YEAR);
        int month = aCalendar.get(Calendar.MONTH) + 1;
        int date = aCalendar.get(Calendar.DATE);
        String strDate = Integer.toString(year) +
                ((month<10) ? "0" + Integer.toString(month) : Integer.toString(month)) +
                ((date<10) ? "0" + Integer.toString(date) : Integer.toString(date));
        
        if(!"".equals(dateType)) strDate = convertDate(strDate, "yyyyMMdd", dateType);

        return  strDate;
    }
    
	public static String getTimeStamp() {

		String rtnStr = null;

		// 문자열로 변환하기 위한 패턴 설정(년도-월-일 시:분:초:초(자정이후 초))
		String pattern = "yyyyMMddhhmmssSSS";

		try {
			SimpleDateFormat sdfCurrent = new SimpleDateFormat(pattern, Locale.KOREA);
			Timestamp ts = new Timestamp(System.currentTimeMillis());

			rtnStr = sdfCurrent.format(ts.getTime());
		} catch (Exception e) {
			// e.printStackTrace();
			throw new RuntimeException(e); // 2011.10.10 보안점검 후속조치
		}

		return rtnStr;
	}
	
	
	/**
	 * NULL일 경우 공백을 리턴한다.
	 * @param str
	 */
	public static String isNull(String str) {
		if ( str == null )	return "";
		else	return str;
	}
	
	
	/**
	 * 입력받은 int value에 정해진 길이 만큼 "0"을 append하여 리턴
	 * @param s
	 * @param n
	 * @return
	 */
	public static String fillZero(int s, int n) {
		String ret = ""; 
		String ss = null; 

		try {
			ss = Integer.toString(s); 
			for(int i=n; i>ss.length(); i--) ret += "0"; 
		} catch(Exception e) {
			return null;
		}

		ret += ss;	  
		return ret;
	}
	
	
	
	/**
	 * 시스템의 현재 시간을 'YYYYMMDDMMSSSSSSS' 형태로 반환
	 * @param 
	 */
	public static String getMilTime() {
		String retStr;
		Calendar cal = Calendar.getInstance();
		TimeZone tz  = cal.getTimeZone();

		tz.setID("GMT");
		tz.setRawOffset(9 * 60 * 60 * 1000);
		cal.setTime(new Date());


		retStr = Integer.toString(cal.get(Calendar.YEAR));
		retStr = retStr + fillZero(cal.get(Calendar.MONTH) + 1, 2);
		retStr = retStr + fillZero(cal.get(Calendar.DAY_OF_MONTH), 2);
		retStr = retStr + fillZero(cal.get(Calendar.HOUR_OF_DAY), 2);
		retStr = retStr + fillZero(cal.get(Calendar.MINUTE), 2); 
		retStr = retStr + fillZero(cal.get(Calendar.SECOND), 2); 
		retStr = retStr + fillZero(cal.get(Calendar.MILLISECOND), 3); 
		return retStr;
	}
	
	/**
	 * 시스템의 현재 시간을 'HHMMSSMMM' 형태로 반환
	 * @param 
	 */
	public static String getTime() {
		String ret = "";
		Calendar cal = Calendar.getInstance();
		TimeZone tz  = cal.getTimeZone(); 
		
		try {
			tz.setID("GMT");
			tz.setRawOffset(9 * 60 * 60 * 1000);
			cal.setTime(new Date()); 
			
			ret = fillZero((cal.get(Calendar.HOUR_OF_DAY)),2);
			ret = ret + fillZero((cal.get(Calendar.MINUTE)), 2);
			ret = ret + fillZero((cal.get(Calendar.SECOND)), 2); 
			ret = ret + fillZero((cal.get(Calendar.MILLISECOND)), 3);
		} catch(Exception e) {
			return null;
		}

		return ret;
	}
	
	/**
	 * 시스템의 현재시간을 FORMAT 형태의 문자열로 반환
	 * @param format
	 */
	public static String getTimeFormat(String format) {
		if (isNull(format).equals("")) {
			return getTime();
		}

		TimeZone tz = TimeZone.getDefault();
		tz.setRawOffset((60*60*1000) * 9);
		TimeZone.setDefault(tz);
		Calendar cal = Calendar.getInstance(tz);
		Date date = cal.getTime();
		SimpleDateFormat formater = new SimpleDateFormat(format);
		String timestamp = formater.format(date);
		return timestamp;
	}
	
	/**
	 * 주어진 날짜를 지정한 포멧 형태로 리턴.
	 * @param date 날짜
	 * @param format 포멧
	 * @return
	 */
	public static String getTimeStampString(String format){
		Date date = new Date();
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat (format, java.util.Locale.KOREA);
		return formatter.format(date);
	}
	
	/**
	 * 입력력 숫자만큼 계산해서 YYYYMMDD 형태로 반환
	 * @param tday
	 * @param day
	 */
	public static String getAddedDay(String tday, int day) {
		int syear = 0;
		int smonth = 0;
		int sday = 0;

		try {
			syear = Integer.parseInt(tday.substring(0, 4));
			smonth = Integer.parseInt(tday.substring(4, 6));
			sday = Integer.parseInt(tday.substring(6));
		} catch(NumberFormatException e) {
			return Integer.toString(sday);
		}

		Calendar cal = Calendar.getInstance();
		cal.set(syear, smonth-1, sday);

		cal.add(Calendar.DATE, day);

		return Integer.toString(cal.get(Calendar.YEAR))
				+ toMonthDay(cal.get(Calendar.MONTH) + 1)
				+ toMonthDay(cal.get(Calendar.DAY_OF_MONTH));
	}
	
	/**
	 * 전달된 인수의 길이가 1인 스트링일 경우 문자열앞에 "0"을 추가하여 반환
	 * @param mord
	 */
	public static String toMonthDay(int mord) {
		String retStr=null;

		if(mord>=10) return Integer.toString(mord);

		mord += 100;

		retStr = Integer.toString(mord);
		return retStr.substring(1, 3);
	} 
	

	/**
	 * 시스템의 현재일자+ 1month를 'YYYYMM' 형태의 문자열로 반환
	 * @return
	 */
	public static String getNextMonth() {
		String tday = getTimeFormat("yyyyMMdd");
		return AddMonth(tday, 1, "yyyyMM");
	}

	/**
	 * yyyyMM 형식으로 입력받은 날자에 month만큼 가감한 날자 구해옴
	 * @param yyyyMM
	 * @param month
	 * @return yyyyMM
	 */
	public static String getAddedMonth(String yyyyMM, int month) {
		return AddMonth(yyyyMM.substring(0, 6)+"01", month, "yyyyMM");
	}



	/**
	 * 시스템의 현재일자- 1month를 'YYYYMM' 형태의 문자열로 반환
	 * @return
	 */
	public static String getPrevMonth() {
		String tday = getTimeFormat("yyyyMMdd");
		return AddMonth(tday, -1, "yyyyMM");
	}  
 
	
	/**
	 * 시스템의 현재일자- 1month를 'YYYYMM' 형태의 문자열로 반환
	 * @param yyyy
	 * @param MM
	 * @param dd
	 * @return
	 */
	public static String getPrevMonth(int yyyy, int MM, int dd) {
		
		Calendar cal = Calendar.getInstance();
		cal.set(yyyy, MM-1, dd);

		cal.add(Calendar.MONTH, -1);

		Date date = cal.getTime();
		SimpleDateFormat formater = new SimpleDateFormat("yyyyMM");
		
		return formater.format(date);
	}
	
	
	/**
	 * 시스템의 현재일자+ 1month를 'YYYYMM' 형태의 문자열로 반환
	 * @param yyyy
	 * @param MM
	 * @param dd
	 * @return
	 */
	public static String getNextMonth(int yyyy, int MM, int dd) {

		Calendar cal = Calendar.getInstance();
		cal.set(yyyy, MM-1, dd);

		cal.add(Calendar.MONTH, 1);
		Date date = cal.getTime();
		SimpleDateFormat formater = new SimpleDateFormat("yyyyMM");
		
		return formater.format(date);
	}	
	
	
	/**
	 * yyyyMMdd 형태로 입력받은 날자에 month 만큼 가감해서  'YYYYMM' 형태의 문자열로 반환
	 * @param yyyyMMdd
	 * @param mm
	 * @return
	 */
	public static String getAddMonth(String yyyyMMdd, int mm) {
		return AddMonth(yyyyMMdd.substring(0, 8), mm, "yyyyMM");
	}
	
	/**
	 * yyyyMMdd 형태로 날자를 입력받아 mm 만큼 가감한 날자를 format 형태에 따라 리턴함.
	 * @param yyyyMMdd
	 * @param mm
	 * @param format(YYYYMM or YYYYMMDD)
	 * @return
	 */
	public static String AddMonth(String yyyyMMdd, int mm, String format) {

		int syear = 0;
		int smonth = 0;
		int sday = 0;

		try {
			syear	= Integer.parseInt(yyyyMMdd.substring(0, 4));
			smonth	= Integer.parseInt(yyyyMMdd.substring(4, 6));
			sday	= Integer.parseInt(yyyyMMdd.substring(6));
		} catch(NumberFormatException e) {
			return Integer.toString(sday);
		}
		
		Calendar cal = Calendar.getInstance();
		cal.set(syear, smonth-1, sday);
		cal.add(Calendar.MONTH, mm);
		
		if(format.toUpperCase().equals("YYYYMM"))		 format = "yyyyMM";
		else if(format.toUpperCase().equals("YYMM"))	 format = "yyMM";
		else if(format.toUpperCase().equals("YYYYMMDD")) format = "yyyyMMdd";
		else if(format.toUpperCase().equals("YYMMDD"))	 format = "yyMMdd";
		
		Date date = cal.getTime();
		SimpleDateFormat formater = new SimpleDateFormat(format);
		
		return formater.format(date);
	}
	
	/**
	 * yyyyMMdd 형태로 날자를 입력받아 mm 만큼 가감한 날자를 format 형태에 따라 리턴함.
	 * @param yyyyMMdd
	 * @param mm
	 * @param format(YYYYMM or YYYYMMDD)
	 * @return
	 */
	public static String AddMonthShort(String yyMMdd, int mm, String format) {
		return AddMonth("20"+yyMMdd, mm, format);
	}
	
	
	/**
	 * 시스템의 현재날자를 'YYMMDD'형태로 반환
	 * @return
	 */
	public static String getDate() {
		return getTimeFormat("yyMMdd");
	}
	
	
	/**
	 * 시스템의 현재날자를 'YYMM'형태로 반환
	 * @return
	 */
	public static String getDate2() {
		return getTimeFormat("yyMM");
	}
	

	public static String formatDate(String date) {
		if( date.length() == 8 ) {
			return date.substring(0,4) + "-" + date.substring(4,6)  + "-" + date.substring(6);
		}
		return date;
	}
    
    
    public static String convertDate(String sDate, String sTime, String sFormatStr) {
        String dateStr = validChkDate(sDate);
        String timeStr = validChkTime(sTime);
        
        Calendar cal = null;
        cal = Calendar.getInstance() ;
        
        cal.set(Calendar.YEAR        , Integer.parseInt(dateStr.substring(0,4)));
        cal.set(Calendar.MONTH       , Integer.parseInt(dateStr.substring(4,6))-1 );
        cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(dateStr.substring(6,8)));
        cal.set(Calendar.HOUR_OF_DAY , Integer.parseInt(timeStr.substring(0,2)));
        cal.set(Calendar.MINUTE      , Integer.parseInt(timeStr.substring(2,4)));
        
        SimpleDateFormat sdf = new SimpleDateFormat(sFormatStr,Locale.ENGLISH);
        
        return sdf.format(cal.getTime());
    }   

    /**
     * 입력된 일자 문자열을 확인하고 8자리로 리턴   
     * @param sDate
     * @return
     */
    public static String validChkDate(String dateStr) {
        String _dateStr = dateStr;
        
        if (dateStr == null || !(dateStr.trim().length() == 8 || dateStr.trim().length() == 10)) {
            throw new IllegalArgumentException("Invalid date format: " + dateStr);
        }
        if (dateStr.length() == 10) {
                _dateStr = removeMinusChar(dateStr);
        }
        return _dateStr;
    }
 
    
    
    /**
     * <p>기준 문자열에 포함된 모든 대상 문자(char)를 제거한다.</p>
     *
     * <pre>
     * StringUtil.remove(null, *)       = null
     * StringUtil.remove("", *)         = ""
     * StringUtil.remove("queued", 'u') = "qeed"
     * StringUtil.remove("queued", 'z') = "queued"
     * </pre>
     *
     * @param str  입력받는 기준 문자열
     * @param remove  입력받는 문자열에서 제거할 대상 문자열
     * @return 제거대상 문자열이 제거된 입력문자열. 입력문자열이 null인 경우 출력문자열은 null
     */
    public static String remove(String str, char remove) {
        if (isEmpty(str) || str.indexOf(remove) == -1) {
            return str;
        }
        char[] chars = str.toCharArray();
        int pos = 0;
        for (int i = 0; i < chars.length; i++) {
            if (chars[i] != remove) {
                chars[pos++] = chars[i];
            }
        }
        return new String(chars, 0, pos);
    }
    
    /**
     * 입력된 일자 문자열을 확인하고 8자리로 리턴   
     * @param sDate
     * @return
     */
    public static String validChkTime(String timeStr) {
        String _timeStr = timeStr;
        
        if (_timeStr.length() == 5) {
                _timeStr = remove(_timeStr,':');
        }
        if (_timeStr == null || !(_timeStr.trim().length() == 4)) {
            throw new IllegalArgumentException("Invalid time format: " + _timeStr);
        }

        return _timeStr;
    }
    
    public static String removeMinusChar(String str) {
        return remove(str, '-');
    }
    
    public static String secSSN(String str) {
    	if( str.length() == 13 ) {
    		return str.substring(0,6) + "-" + str.substring(6,7) + "******";
    	}
    	return str;
    }
    
    public static String arrayToString(Object[] obj ) {
    	String rtn = "";
    	for(Object o : obj ) {
    		if( !isEmpty(rtn) ) 
    			rtn += ",";
    		rtn += o.toString().trim();	
    	}
    	return rtn;
    }
    
    
    public static boolean isNotEmpty(final Object obj) {
		if(null == obj) return false;
		else {
			if(obj instanceof String) return "".equals(obj) ? false : true;
			else if(obj instanceof List) return !((List<?>)obj).isEmpty();
			else if(obj instanceof Map) return !((Map<?,?>)obj).isEmpty();
			else if(obj instanceof Object[]) return 0 == Array.getLength(obj) ? false : true;
			else if(obj instanceof Integer) return !(null == obj);
			else if(obj instanceof Long) return !(null == obj);
			else return false;
		}
	}

	public static boolean isEmpty(final Object obj) {
    	return !isNotEmpty(obj);
    }


	
	public static String getTimeStampString(final Date date) {
		return getTimeStampString(date, "yyyyMMddHHmmss");
	}
    
    public static String getTimeStampString(final Date date, final String format){
    	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat (format, java.util.Locale.KOREA);
    	return formatter.format(date);
    }
    
    public static String getTimeStampString(String date, final String format) {
    	try {
    	    if(null == date || "".equals(date)) return "";
    	    
    	    Date	d	= null;
    	    		date= replace(date, "-", "");
    	    
    	    switch(date.length()) {
    	    	case 14: break;
    	    	case 12: date += "00";			break;
    	    	case 10: date += "0000";		break;
    	    	case 8:	 date += "000000";		break;
    	    	case 6:	 date += "01000000";	break;
    	    	case 4:	 date += "0101000000";	break;
    	    	default: return "";
    	    }
    	    
    		java.text.SimpleDateFormat tmpFormat = new java.text.SimpleDateFormat("yyyyMMddHHmmss", java.util.Locale.KOREA);

	    	if("".equals(date)) d = new Date();
	    	else {
	    	    tmpFormat.setLenient(true);
	    		d = tmpFormat.parse(date);
	    	}
	    	
	    	return getTimeStampString(d, format);
    	} catch(Exception e) {
    		e.printStackTrace();
    		return "";
    	}
    }
    
	public static Map<String,String> convertParam(String paramStr) {
		Map<String, String> paramMap = new HashMap<String, String>();
		if( isEmpty(paramStr) )
			return paramMap;
		String[] paramAry = paramStr.split("&amp;");
		for(String str : paramAry) {
			String[] param = str.split("=");
			paramMap.put(param[0], param[1]);
		}
		return paramMap;
	}
	
	public static String[] singleChars(String s) {
	    return s.split("(?!^)");
	}
	
	
	/**
	 * create rand pw
	 * @param	maxlength	random number max length 
	 */
	public static String randpw(int maxlength){
		int couponSize = 1000;
		final char[] possibleCharacters =
				{'1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'A', 'B', 'C', 'D', 'E', 'F',
						'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U',
						'V', 'W', 'X', 'Y', 'Z'};
		final int possibleCharacterCount = possibleCharacters.length;
		String[] arr = new String[couponSize];
		Random rnd = new Random();
		int currentIndex = 0;
		int i = 0;
		String result = "";
		StringBuffer buf = new StringBuffer(maxlength);
		for (i= maxlength; i > 0; i--) {
			buf.append(possibleCharacters[rnd.nextInt(possibleCharacterCount)]);
		}
		long start_time = System.nanoTime();
		//System.out.print(start_time);
		
		result = buf.toString();
		return result;
	}
	
	
	
	
	 /**
     * 문자가 null일 경우 다른 문자로 대체
     *
     * @param str
     *            문자
     * @param val
     *            Null일 경우 대체될 문자
     * @author sybaek
     */
    public static String nvl(Object obj, String val) {

        String ret = (obj!=null) ? obj.toString().trim() : "";

        if ( "".equals(ret) ) {
            return val;
        } else {
            return ret;
        }
    }

    /**
     * 문자가 null일 경우 다른 문자로 대체
     *
     * @param str
     *            문자
     * @param val
     *            Null일 경우 대체될 문자
     * @author sybaek
     */
    public static String nvl(String str, String val) {

        if (str == null || "".equals(str.trim())) {
            return val;
        } else {
            return str;
        }
    }
    
    
    /**
     * 문자가 null 일 경우 다른 문자로 대체
     * 
     * @param obj
     * @param val
     * @return
     */
    public static int nvl(Object obj, int val) {

        String ret = (obj!=null) ? obj.toString().trim() : "";

        if ( "".equals(ret) ) {
            return val;
        } else {
            return Integer.parseInt(ret);
        }
    }
    
    /**
     * 문자가 null 일 경우 다른 문자로 대체
     * @param str
     * @param val
     * @return
     */
    public static int nvl(String str, int val) {

        if (str == null || "".equals(str.trim())) {
            return val;
        } else {
            return Integer.parseInt(str);
        }
    }
    

	
	
	/**
     * String 중 특정한 문자가 몇번 들어가 있는지 return
     *
     * @param str
     *            대상 문자열
     * @param find
     *            찾고자 하는 문자열
     */
    public static int cntInStr(String str, String find) {
        int i = 0;
        int pos = 0;

        while (true) {
            pos = str.indexOf(find, pos);

            if (pos == -1) {
                break;
            }

            i++;
            pos++;
        }
        return i;
    }
    
    
    /**
	 * @param szText 대상문자열
	 * @param szKey 시작위치로할키워드
	 * @param nLength 자를길이
	 * @param nPrev 키워드위치에서얼마나이전길이만큼포함할것인가
	 * @param isNotag 태그를없앨것인가
	 * @param isAdddot 긴문자일경우"..."을추가할것인가
	 * @return
	 *
	[예]
	"가나다라" 에서 2바이트까지 자르고 싶을경우 strCut("가나다라", null, 2, 0, true, true); 처럼 하시면 됩니다.
	 => 결과 : "가"
	"가나다라" 에서 "다"라는 키워드 기준에서 2바이트까지 자르고싶을경우 strCut("가나다라", "다", 2, 0, true, true); 처럼 하시면 됩니다.
	 => 결과 : "다"
	"가나다라" 에서 "라"라는 키워드 기준으로 그 이전의 4바이트까지 포함하여 6바이트까지 자르고 싶을 경우 strCut("가나다라", "라", 6, 4, true, true); 처럼 하시면 됩니다.
	 => 결과 : "나다라"
	"가나다라" 에서 3바이트를 자를 경우
	 => 결과 : "가"
	"가a나다라" 에서 3바이트를 자를 경우
	 => 결과 : "가a"
	"가나다라" 에서 "나" 키워드 기준으로 이전 1바이트 포함하여 4바이트까지 자를 경우
	 => 결과 : "나"
	 */
	public static String strCut(String szText, String szKey, int nLength, int nPrev, boolean isNotag, boolean isAdddot){  // 문자열 자르기

	    String r_val = szText;
	    int oF = 0, oL = 0, rF = 0, rL = 0;
	    int nLengthPrev = 0;
	    Pattern p = Pattern.compile("<(/?)([^<>]*)?>", Pattern.CASE_INSENSITIVE);  // 태그제거 패턴

	    if(isNotag) {r_val = p.matcher(r_val).replaceAll("");}  // 태그 제거
	    r_val = r_val.replaceAll("&amp;", "&");
	    r_val = r_val.replaceAll("(!/|\r|\n|&nbsp;)", "");  // 공백제거

	    try {
	      byte[] bytes = r_val.getBytes("UTF-8");     // 바이트로 보관

	      if(szKey != null && !szKey.equals("")) {
	        nLengthPrev = (r_val.indexOf(szKey) == -1)? 0: r_val.indexOf(szKey);  // 일단 위치찾고
	        nLengthPrev = r_val.substring(0, nLengthPrev).getBytes("MS949").length;  // 위치까지길이를 byte로 다시 구한다
	        nLengthPrev = (nLengthPrev-nPrev >= 0)? nLengthPrev-nPrev:0;    // 좀 앞부분부터 가져오도록한다.
	      }

	      // x부터 y길이만큼 잘라낸다. 한글안깨지게.
	      int j = 0;

	      if(nLengthPrev > 0) while(j < bytes.length) {
	        if((bytes[j] & 0x80) != 0) {
	          oF+=2; rF+=3; if(oF+2 > nLengthPrev) {break;} j+=3;
	        } else {if(oF+1 > nLengthPrev) {break;} ++oF; ++rF; ++j;}
	      }

	      j = rF;

	      while(j < bytes.length) {
	        if((bytes[j] & 0x80) != 0) {
	          if(oL+2 > nLength) {break;} oL+=2; rL+=3; j+=3;
	        } else {if(oL+1 > nLength) {break;} ++oL; ++rL; ++j;}
	      }

	      r_val = new String(bytes, rF, rL, "UTF-8");  // charset 옵션

	      if(isAdddot && rF+rL+3 <= bytes.length) {r_val+="...";}  // ...을 붙일지말지 옵션
	    } catch(UnsupportedEncodingException e){ e.printStackTrace(); }

	    return r_val;
	}
    
    
	
	/*
	 * html 추출
	 */
	public static String getNoHtml(String content) {
		
		if (content!=null)
		{
		
	        Pattern SCRIPTS = Pattern.compile("<(no)?script[^>]*>.*?</(no)?script>", Pattern.DOTALL);
	        Pattern STYLE = Pattern.compile("<style[^>]*>.*</style>", Pattern.DOTALL);

	        Matcher m;

	        m = SCRIPTS.matcher(content);
	        content = m.replaceAll("");
	        //System.out.println("content1" + content);
	        m = STYLE.matcher(content);
	        content = m.replaceAll("");

	        
		} else {
			content = "";
		}

        return content;
    }

	/**
	 * URL + 파라미터  가져오기
	 * 
	 */
	public static String getUrlParamStr(){
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = sra.getRequest();
		
		//String URL = request.getRequestURL()+"";
		String URL = request.getServletPath()+"";
		
		 // request URL
        Enumeration param = request.getParameterNames();
        String strParam = "";
        
        String method = request.getMethod();        
        if ( "GET".equals(method)){
	        while(param.hasMoreElements()) { 
	            String name = (String)param.nextElement(); 
	            String value = request.getParameter(name); 
	            
	            strParam += name + "=" + value + "&"; 
	        }
        }
        
        if ( !"".equals(strParam)){
        	URL =  URL+ "?" + strParam;
        }
          
        
        return URL;
	}
	
	public static String reverseXSS(String str) {
		return str.replaceAll("&amp;#40;", "(")
				.replaceAll("&amp;#41;", ")");
		
	}	
	
	
	/**
	 * 콤마 찍기
	 * 
	 */
	public static String comma(String value){
		String result;
		
			if(value.equals("")){
				result="0";
			} else {
	     DecimalFormat format = new DecimalFormat("####,##0");
	     result= format.format(Double.parseDouble(value));
			}
			return result;
	    
	}
	
	
	
	/**
	 * 할인 금액 구하기
	 *  money: 원금 
	 *  percent : 할인률
	 *  
	 */
	public static int sale(int money, double percent) {
		int price = 0;
		if( percent != 0){
			double M3=percent*0.01; // M3는 %를 소수점으로 변환한 값이다 즉 20%를 0.2로 변환한다
			double yourmoney=money*M3; // 할인되는 가격
			double actually=money-yourmoney; // 실제 가격		
			actually = Math.floor(actually*0.1)*10;	// 1자리 버림		
			price = (int)actually;
		}else{
			price = money;
		}
		return price;
	}
	
	
	/**
	 * 오른쪽 부터 글자 자르기
	 * 
	 */
	public static String rightString(String sText, int iTextLenth){
		String sConvertText;
	    if (sText.length() < iTextLenth){
	        iTextLenth= sText.length();
	    }

	    sConvertText= sText.substring(sText.length() - iTextLenth, sText.length());
	    return sConvertText;
	}
	
	/**
	 * 오른쪽 특정 칸에 글자 넣기
	 */
	public static String rpadInStr(String sText, String inStr ,  int iTextLenth){
		String sConvertText = "";
		
		
		try{
			String rpad = rightString(sText, iTextLenth);			
			String tmpLpad = sText.replaceAll(rpad , "" );
			
			sConvertText = tmpLpad+""+inStr+""+rpad;
		
		}catch(Exception e){
			sConvertText = sText;
		}
		
	    return sConvertText;
	}
	
	/**
	 * 모든 HTML 태그를 제거하고 반환한다.
	 * 
	 * @param html
	 * @throws Exception  
	 */
	public static String removeTag(String html) throws Exception {
		String aa =html.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		aa =aa.replaceAll("&nbsp;", "");
		return aa;
	}
	/**
	 * 모든 태그를 제거하고 반환한다.
	 * 
	 * @param html
	 * @throws Exception  
	 */
	public static String removeAllTag(String html) throws Exception {
		String aa =html.replaceAll("<[^>]*>", "");
		aa =aa.replaceAll("&nbsp;", "");
		return aa;
	}
	
	/**
	 * 모든 따옴표, 쌍따옴표를 제거하고 반환한다.
	 * 
	 * @param html
	 * @throws Exception  
	 */
	public static String removeQuotes(String html) throws Exception {
		String aa =html.replaceAll("\'", "");
		aa =aa.replaceAll("\"", "");
		aa =aa.replaceAll("!", "");
		return aa;
	}
	
	/**
	 * &amp에서 &형태로 변환한다.
	 * 
	 * @param html
	 * @throws Exception  
	 */
	public static String toTEXT(String str) {
		if(str == null)
		return null;

		String returnStr = str;

		returnStr = returnStr.replaceAll("<br>", "\n");

		returnStr = returnStr.replaceAll("&gt;", ">");

		returnStr = returnStr.replaceAll("&lt;", "<");

		returnStr = returnStr.replaceAll("&quot;", "\"");

		returnStr = returnStr.replaceAll("&nbsp;", " ");

		returnStr = returnStr.replaceAll("&amp;", "&");

		returnStr = returnStr.replaceAll("\"", "&#34;");

		return returnStr;

	}
	
	public static String getSpclStrCnvr(String srcString) {
		String rtnStr = null;

		try{
			StringBuffer strTxt = new StringBuffer("");
			char chrBuff;
			int len = srcString.length();
	
			for(int i = 0; i < len; i++) {
			chrBuff = (char)srcString.charAt(i);
	
				switch(chrBuff) {
		
					case '<':
						strTxt.append("&lt;");
					break;
					
					case '>':
						strTxt.append("&gt;");
					break;
					case '&':
						strTxt.append("&amp;");
					break;
					default:
					strTxt.append(chrBuff);
				}
			}
			rtnStr = strTxt.toString();
		}catch(Exception e) {
			e.printStackTrace();
		}
	
		return rtnStr;
	}
	
	public static String getRemoteAddr(HttpServletRequest request){
		String ip = null;
		
		ip = request.getHeader("X-Forwarded-For");
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("Proxy-Client-IP");
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("WL-Proxy-Client-IP");
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("HTTP_CLIENT_IP");
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	    	ip = request.getHeader("X_Real-IP");
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	    	ip = request.getHeader("X_RealIP");
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	    	ip = request.getHeader("REMOTE_ADDR");
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getRemoteAddr();
	    }
	    
		return ip;
	}
}
