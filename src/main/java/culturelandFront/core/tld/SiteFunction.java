package culturelandFront.core.tld;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import culturelandFront.core.security.seed.Base64;
import culturelandFront.core.security.seed.SeedED;
import culturelandFront.core.security.sha256.sha256;
import culturelandFront.core.util.NdnUtil;
import culturelandFront.core.util.PropUtil;
import culturelandFront.core.util.StaticContextAccessor;
import culturelandFront.core.value.MapValue;

/**
 * jstl Util
 * @author jsnoh
 *
 */
public class SiteFunction {

	public static Boolean hasMenuAuth(String[] userAuths, String targetAuths) {
		
		boolean hasAuth = false;
		
		String[] auths = targetAuths.split(",");
		
	
		for(int i = 0; i < auths.length ; i++ ) {
			if( userAuths[Integer.parseInt(auths[i])].equals("1") ) {
				hasAuth = true;
				break;
			}
		}
		
		return hasAuth;
	}
	
	
	/**
	 *  비밀번호 암호화 
	 */
	public static String pwEncode(String pw){
		String pwEncode = null;
		if ( pw != null && !"".equals(pw)){
			sha256 sha = new sha256();
			try {
				pwEncode = sha.createHash(NdnUtil.nvl(pw, ""));
			} catch (Exception e) {
				pwEncode = "";
			}
		}
		return pwEncode;
	}
	
	/**
	 * 암호화
	 * 
	 */
	public static String base64Encode(String str){
		String returnStr = null;
		try {
			returnStr = SeedED.encoding(str);
		} catch (Exception e) {
			returnStr = "";
		}
		return returnStr;
	}
	
	/**
	 * 
	 * 암호화 한것 디컴파일
	 * 
	 */
	public static String base64Decode(String str){
		String returnStr = null;
		
		base64Encode("");
		try {
			returnStr= SeedED.decoding(Base64.decode(str));
		} catch (Exception e) {
			returnStr = "";
		}
		return returnStr;
	}
	
	

	
	/**
	 * comma 찍기
	 */
	public static String comma(String value){
		String result;
		
		if("".equals(value) ){
			result="0";
		} else {
			DecimalFormat format = new DecimalFormat("####,##0");
			result= format.format(Double.parseDouble(value));
		}
			
		return result;
	}
	
	
/*	*//**
	 * 색상값 가져오기
	 *//*
	public static String getColor(int color , String etc){
		String result = "";
		
		if ( "".equals(etc)){	//기타색상컬럼에 값이 없을경우
			etc = "기타";
		}
		
		if ( color == 31 ){	// 기타일 경우 기타색상으로 
			result = etc;
		}else{
			result =  CodeMap.COLOR_CODE.get(color);
		}
		
		
		return result;
	}
	
	*//**
	 * 차량 상태값
	 *//*
	public static String getState(int state, int stand_type, int del_category, int ext_link_company , String ext_link_compete){
		String result = "";
		
		result = CodeMap.STATE_CODE.get(state);		
		if ( state == 2){
			result = CodeMap.STAND_TYPE.get(stand_type);	
		}else if( state == 4){
			if( CodeMap.DEL_CATEGORY.get( del_category) != null && !"".equals(CodeMap.DEL_CATEGORY.get( del_category))){
				result+="("+CodeMap.DEL_CATEGORY.get( del_category)+")";
			}
		}
		
		return result;
	}
	
	*/
	
	
	/**
	 * 이미지 URL
	 *  -> position : 1 자세히 보기 용
	 *  	 position : 3 썸네일 용 
	 */
	public static String getRandImgUrl(String imgname, int position , String defaultImg) {
		String result = "";
		String imgDomain = PropUtil.get("image.web.upload.url");
		String domain = PropUtil.get("web.nomal.url");
		
		
		if ( !"".equals(imgname)){
			result = imgDomain + "/car/" + imgname + "_" + position + ".jpg";
		}else{
			 if( defaultImg == null ||  "".equals(defaultImg)){
				 result = domain + "/images/common/no-image.jpg";
			 }else{
				 result = domain +""+ defaultImg;
			 }
		}
		
		return result;
	}
	
	/**
	 * array 파라미터  값 셋팅
	 */
	public static boolean  getOptionCheckedItem(String code,  String[] opt_str ) {
		boolean result = false;
			try{
					if(code!=null){						
						for (int i=0;i<opt_str.length ; i++ ){
							
							if (  code.equals(String.valueOf(opt_str[i])) ){
								return true;
							}
						}
	
					}else{
						result = false;
					}
			}catch (Exception e){
					
			}
	
			return result;
	}
	
	
	/**
	 * 자유 등록권 OR 옵션 계산 결과
	 * 
	 * @param dayCost 1개당 가격
	 * @param tmpMap DB에서 가져온 해당 옵션 Map 
	 * @param month 달
	 * @param count 대수
	 * @param optionInt 해당 옵션 갯수
	 * @param optionRemainday 해당옵션 종료일 ( 일할계산을 위한 )
	 * @param salePercent 할인률
	 * 
	 */
	public static int freeMoneyCalculator( int dayCost , Map tmpMap, int month, int count , int optionInt , int optionRemainday, int salePercent  ){
		int price = 0;
		
		if ( month != 0 ){
			price = NdnUtil.convertInt(tmpMap.get("t"+count));
			// 판매금액 +  (  1대금액 * ( 추가대수 - 현재대수) * 남은날짜  )
			price =  price + (dayCost * (count - optionInt) * (optionRemainday) );
			
		}else{ // 대수 늘리기			
			// 일할금액 * ( 추가대수 - 현재대수) * 남은날짜
			price = (dayCost* (count-optionInt))*optionRemainday;
			
		}
				
		price = NdnUtil.sale(price, salePercent);	// 할인금액 적용
		return price;
	}
	
	
	/**
	 * 자유등록권 일할 계산된 금액 ( 일할계산식 )
	 * 
	 * @param dayCost 1개당 가격
	 * @param tmpMap DB에서 가져온 해당 옵션 Map 
	 * @param month 달
	 * @param count 대수
	 * @param optionInt 해당 옵션 갯수
	 * @param optionRemainday 해당옵션 종료일 ( 일할계산을 위한 )
	 * @param salePercent 할인률
	 * 
	 */
	public static String freeMoneyCalculatorStr( int dayCost , Map tmpMap, int month, int count , int optionInt , int optionRemainday, int salePercent  ){
		String returnStr = "";
		int price = 0;
		
		// 계산된 금액
		returnStr = NdnUtil.comma( String.valueOf(freeMoneyCalculator( dayCost ,  tmpMap,  month,  count ,  optionInt ,  optionRemainday,  salePercent  ) ));
		
		// 계산식
		if ( optionInt != 0 ){	// 현재 가지고 있는 옵션이 없으면 계산식은 없어도 됨			
			if ( month != 0  ){	// 기간 + 대수 늘리기
				
				if (  (count - optionInt ) != 0 ){	// 대수가 그대로면 계산식 필요 없음
					price = NdnUtil.convertInt(tmpMap.get("t"+count));
					price = NdnUtil.sale(price, salePercent);	// 할인금액 적용
					
					// 판매금액 +  ( 1대금액 * ( 추가대수 - 현재대수) * 남은날짜   )
					returnStr +=  "<span>"+NdnUtil.comma( String.valueOf( price )) +"+"+NdnUtil.comma( String.valueOf( (count - optionInt) * dayCost *optionRemainday))+"</span>";
					
				}
			}else{  // 대수 늘리기
				
				if (  (count - optionInt ) != 0 ){	// 대수가 그대로면 계산식 필요 없음
					dayCost = NdnUtil.sale(dayCost, salePercent);	// 할인금액 적용
					
					// 일할금액 * ( 추가대수 - 현재대수) * 남은날짜
					returnStr += "<span>"+NdnUtil.comma( String.valueOf(dayCost * (count-optionInt)  )) +"*" + NdnUtil.comma( String.valueOf(optionRemainday))+"</span>";
				}
			}		
		}
		
		return returnStr;
	}
	
	
	
	/**
	 * 대당 월할 금액 계산
	 * @param optionAdd 옵션추가 여부
	 * @param term	등록권기간
	 * @param remainday	 등록권 남은기간
	 * @param price 금액
	 */
	public static int extMonthCal(String optionAdd , int term , int remainday , int price){
		int resultPrice = 0;
		double tmpTerm =(double)(extMonthDayCal(optionAdd ,  term ,  remainday) / 30);
		
		if ( "Y".equals(optionAdd) ){
			
			double tmpPrice = (double)price * (double)( tmpTerm / 3  ) ;
			tmpPrice = Math.floor(tmpPrice*0.1)*10;	// 1자리 버림		
			resultPrice = (int)tmpPrice;
			
		}else{
			resultPrice = price;
		}
		
		return resultPrice;
	}
	public static String extMonthCalStr(String optionAdd , int term , int remainday , int price){
		String returnStr = "";
		int day = extMonthCal( optionAdd ,  term ,  remainday ,  price);
		returnStr = NdnUtil.comma(String.valueOf(day));
		return returnStr;
	}
	
	/**
	 * 대당 월할 일자 계산
	 * @param optionAdd 옵션추가 여부
	 * @param term	등록권기간
	 * @param remainday	 등록권 남은기간 
	 */
	public static int extMonthDayCal(String optionAdd , int term , int remainday){
		int day = 0;
		int tmpTerm = term/3; // 30
		double tmpRemainday = (double)remainday /  (double)tmpTerm;	// 3
		
		if ( "Y".equals(optionAdd) ){
			
			if ( tmpRemainday > 2){
				day = term;						//   90
			}else if(  tmpRemainday > 1 ){
				day = term-(tmpTerm);		//   90 - 30
			}else{
				day = term-(tmpTerm*2);	//   90 - 60
			}
		}else{
			day = term;
		}
		return day;
	}
	public static String extMonthDayCalStr(String optionAdd , int term , int remainday){
		String returnStr = "";
		int day = extMonthDayCal(optionAdd ,  term ,  remainday);
		returnStr = NdnUtil.comma(String.valueOf(day));
		return returnStr;
	}
	
	
	
	/**
	 * 서버 정보
	 */
	public static String getProfile(){		
		return StaticContextAccessor.getProfiles();
	}
	
	
	public static String getImgUrl(String file_stre_cours, String stre_file_nm ){
		String returnStr = "";
		
		if ( !"".equals(file_stre_cours) && !"".equals(stre_file_nm)){
			String uri = PropUtil.get("image.web.upload.url");
			returnStr = uri+""+ file_stre_cours +"" + stre_file_nm;
			
			File uFile = new File(PropUtil.get("image.web.upload.path")+""+file_stre_cours, stre_file_nm);
			int fSize = (int) uFile.length();
			
			if( fSize == 0){
				returnStr="/images/common/no-image.jpg";
			}
			
		}else{
			returnStr="/images/common/no-image.jpg";
		}

		return returnStr;
	}
	
	/**
	 * html 삭제
	 * 
	 */
    public static String stripHTML(String htmlStr) {
        Pattern p = Pattern.compile("<(?:.|\\s)*?>");
        Matcher m = p.matcher(htmlStr);

        return (m.replaceAll("").replaceAll("&nbsp;", " ").replaceAll("&lt;", "<").replaceAll("&gt;", ">")).replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
    }   
	
	
    
	public static String getPropUtil(String str){		
		return PropUtil.get(str); 
	}
	
	
	/**
	 * 포인트 적립금
	 */
	public static int savingPoint(int money, int percent) {
		int savingPoint = 0;
		if( percent != 0){
			double M3=percent*0.01; // M3는 %를 소수점으로 변환한 값이다 즉 20%를 0.2로 변환한다
			double yourmoney=money*M3; // 할인되는 가격
			double actually=yourmoney; // 실제 가격
			if ( actually >= 10){	// 두자리수 이상이면
				actually = Math.floor(actually*0.1)*10;	// 1자리 버림
			}
			savingPoint = (int)actually;
		}else{
			savingPoint = money;
		}
		return savingPoint;
	}
	
	
	/**
	 * 권한 배열 체크
	 */
	public static boolean authChk(String auth , String sub_menu_id){
		boolean result = false;
		try{
			String[] auths = auth.split("\\|");			
			int menu_id =  Integer.parseInt( sub_menu_id );
			if ( "1".equals( auths[menu_id-1] ) ){
				result = true;
			}
		}catch(Exception e){ }
		
		return result;
	}
	
	
	/**
	 * GNB 메뉴 링크 가져오기
	 * 
	 */
	public static String authChkMenuUrl(String auth , List authMenuList){
		String returnStr = null;
		
		MapValue mapValue = new MapValue();	
		
		try{
			for(int i=0;i<authMenuList.size();i++){
				HashMap tmp = (HashMap) authMenuList.get(i);
				String sub_menu_id = (String) tmp.get("key");
				if ( authChk(auth, sub_menu_id)){
					HashMap urlMap = (HashMap) mapValue.getAuthMenuUrlCode();
					return (String) urlMap.get(sub_menu_id);
				}
				
				
			}
		}catch(Exception e){
		}
		
		
		return returnStr;
	}
	
	
	/**
	 * JSTL Split의 경우 특수문자 적용이 안되서 java에서 split 처리 함
	 * 
	 */
	public static String[] fn_split(String str , String word){
		
		String[] result = null;
		
		try{
			result = str.split("\\"+word);
		}catch(Exception e){
		}
		
		return result;
	}
	
	/**
	 * Seed 복호화
	 * @throws IOException 
	 * 
	 */
	public static String seedDecoding(String str) throws IOException {
		byte[] base64 = Base64.decode(str);
		String deSeed = SeedED.decoding(base64);
		return deSeed;
	}
	
}
