package culturelandFront.core.helper;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import culturelandFront.core.util.NdnUtil;

import org.apache.commons.collections.iterators.IteratorEnumeration;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class ListHelper {

	public static String  PAGE_PARAM_NAME = "curPage";
	
	private int totalCount;
	private int curPage = 1;
	private String curUrl;
	private String urlParam;
	private int totalPage 	= 0;
	
	
	private List list;
	
	private int cntPerPage 		= 10;		// 리스트 사이즈 셋팅
	private int startNum 		= 1;			// 리스트 시작점
	private int endNum 			= cntPerPage;		// 리스트 마지막점
	
	
	private int rowNum=0;
	
	private Map paramMap;
	
	

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	private void setPage() {
		this.startNum = ((this.curPage-1) * this.cntPerPage ) ;
		this.endNum = this.startNum + (this.cntPerPage);
		
		paramMap.put("startNum", 		startNum);
		paramMap.put("endNum", 			cntPerPage);
		paramMap.put("cntPerPage", 		cntPerPage);
		paramMap.put("curPage", 		curPage);			
	}
	

	
	public int getTotalPage() {
		if( this.totalPage == 0 ) {
			if ( this.totalCount % this.cntPerPage == 0) {
				this.totalPage = (int) ( this.totalCount / this.cntPerPage);
			} else {
				this.totalPage = (int) ( this.totalCount / this.cntPerPage) + 1;
			}
		}
		return this.totalPage;
	}

	
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	
	public void setCurUrl(String curUrl) {
		this.curUrl = curUrl;
	}
	
	public String getCurUrl() {
		return this.curUrl;
	}
	
	public void setUrlParam(String urlParam) {
		this.urlParam = urlParam;
	}
	
	public String getUrlParam() {
		return this.urlParam;
	}
	
	public int getStartNo() {
		return this.totalCount - ( cntPerPage *  (curPage - 1) );
	}
	
	
	public List getList() {
		return this.list;
	}
	
	public void setList(List list) {
		this.list = list;
	}
	
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	public int getTotalCount() { 
		return this.totalCount;
	}
	
	public int getCntPerPage() {
		return this.cntPerPage;
	}
	
	public Map getParamMap() {
		return this.paramMap;
	}
	
	public int getCurPage() {
		return this.curPage;
	}
	
	public void setParamValue(String key, Object value) {
		if( NdnUtil.isEmpty(value) ) {
			
			this.paramMap.put(key, null);
		}
		
		if( value instanceof Integer) {
			this.paramMap.put(key, Integer.parseInt(value.toString()));
		} else if( value instanceof Double) {
			this.paramMap.put(key, Double.parseDouble(value.toString()));
		} else if( value instanceof String ){
			this.paramMap.put(key, value.toString());
		} else {
			this.paramMap.put(key, value);
		}
	}
	
	
	
	
	
	
	public ListHelper() {
		this.paramMap = new HashMap();
	}
	
	

	
	public ListHelper(Map param) {		
		initListVO(param, cntPerPage);
	}

	public ListHelper(Map param, int cntPerPage) {
		initListVO(param, cntPerPage);
	}

	
	
	
	private void initListVO(Map param, int cntPerPage) {
		
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = sra.getRequest();
						
		if(  paramMap == null )
			paramMap = new HashMap(param);
		
		
		
		this.curPage = NdnUtil.convertInt( param.get(PAGE_PARAM_NAME), 1 );
		this.cntPerPage = cntPerPage;
		
		setPage();
		
		String url = request.getRequestURI();
		setCurUrl(url);
		
		try{
			StringBuffer paramBuf = new StringBuffer();
			Enumeration eParam = new IteratorEnumeration(param.keySet().iterator());
			
			while (eParam.hasMoreElements()) {
				String pName = (String)eParam.nextElement();
				String pValue = (String)param.get(pName);
				
				
				if( !ListHelper.PAGE_PARAM_NAME.equals(pName)) {	
					if( paramBuf.length() > 0 )
						paramBuf.append("&amp;");
					paramBuf.append(pName + "=" + pValue);
				}
			}
			
			setUrlParam(paramBuf.toString());
		}catch(Exception e){
			
		}
	}


	@Override
	public String toString() {
		return "ListHelper [totalCount=" + totalCount + ", curPage=" + curPage + ", curUrl=" + curUrl + ", urlParam="
				+ urlParam + ", totalPage=" + totalPage + ", list=" + list + ", cntPerPage=" + cntPerPage
				+ ", startNum=" + startNum + ", endNum=" + endNum + ", paramMap=" + paramMap + "]";
	}
	
}
