package culturelandFront.core.value;

import java.util.HashMap;

import culturelandFront.core.util.NdnUtil;

/**
 * 공통코드
 * @author jin-seok
 * @desc
 *  - 사용법 -
 * 
 *  - JSP 에서 jstl 로 코드 리스트 뿌릴때
 * ex) <c:forEach var="cmm" items="${CodeMap.areaCode }" varStatus="status">	
 *			${cmm.key} ${cmm.value} 	
 *		</c:forEach> 
 *
 * - JSP 에서 해당 키값 가져올때
 *${CodeMap.areaCode["A"] }
 *${CodeMap.colorCode[(1).intValue() ]}
 *
 *  - java에서 특정 키값을 가져올때 * 
 * CodeMap.GEAR_CODE.get( NdnUtil.convertInt( "1" ))
 * NdnUtil.hashMapToList1 String형
 */
public class CodeMap {

	
	public Object getMemberCodeList(){
		return  NdnUtil.hashMapToList1(MEMBER_CODE);
	}	
	public Object getMemberCode(){
		return  MEMBER_CODE;
	}
	
	/**
	 * 회원 구분
	 */ 
	public static final HashMap<String, String> MEMBER_CODE = new HashMap<String, String>() {
		private static final long serialVersionUID = 1L;
		{
			put("A",	"관리자");
			put("M",	"일반회원");
		}
	};
	
}
