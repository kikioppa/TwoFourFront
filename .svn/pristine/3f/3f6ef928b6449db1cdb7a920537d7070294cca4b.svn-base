package culturelandFront.core.abstr;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.exceptions.ExceptionFactory;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import culturelandFront.core.helper.ListHelper;
import culturelandFront.core.util.NdnUtil;

@Transactional
public abstract class NdnAbstractMapper extends SqlSessionDaoSupport {

	

	private static final Logger logger = Logger.getLogger(NdnAbstractMapper.class);
	
	@Resource(name="sqlSessionTemplate")
    public void setSqlSessionFactory(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
    }

	@Transactional(readOnly = true)
	protected int selectInt(String query, Object object) {	
		
		Object obj = getSqlSession().selectOne(query, object);
		return Integer.parseInt(obj.toString());
	}

	@Transactional(readOnly = true)
	@SuppressWarnings("rawtypes")
	protected List list(String query, Object object) {
		return getSqlSession().selectList(query, object);
	}
	
	@Transactional(readOnly = true)
	protected Object selectOne(String query, Object object ) {
		return getSqlSession().selectOne(query, object);
	}
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	protected int insert(String query, Object object) {		
		return getSqlSession().insert(query, object);
	}
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	protected int update(String query, Object object) {	
		return getSqlSession().update(query, object);
	}
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	protected int delete(String query, Object object) {		
		return getSqlSession().delete(query, object);
	}	
	
	@Transactional(readOnly = true)
	@SuppressWarnings("rawtypes")
	protected Map selectListConvMap(String query, Object object, String keyColumn, String valueColumn) {
		List<Map> list = getSqlSession().selectList(query, object);
		Map resultMap = new LinkedHashMap();
		for(Map map : list) {
			resultMap.put(map.get(keyColumn), map.get(valueColumn));
		}
		return resultMap;
	}
	

	/**
	 * 리스트 쿼리
	 * 
	 */	
	@SuppressWarnings("rawtypes")
	protected ListHelper selectListHelper(String countQuery, String listQuery,
			ListHelper listHelper) {

		int totalCount = 0;
		int totalPage = 0;

		Object rtnObject = selectInt(countQuery, listHelper.getParamMap());
		try {
			totalCount = Integer.parseInt(rtnObject.toString());
		} catch (Exception e) {
			throw ExceptionFactory.wrapException("Error querying " + countQuery
					+ ".  Cause: " + e, e);
		}

		listHelper.setTotalCount(totalCount);
		List listObject = list(listQuery, listHelper.getParamMap());
		
		List tmpList = new ArrayList<>();
		try{
				// 리스트에 로우넘 추가
				for(int i=0;i<listObject.size();i++){
					Map board = (HashMap)listObject.get(i);
					int rownum =  (listHelper.getTotalCount()+1) -( (listHelper.getCurPage() -1 )  * listHelper.getCntPerPage() ) - (i+1);
					board.put("rownum", rownum);
					
					try{
						board = optList_init(board);
					}catch(Exception e){ }
					
					tmpList.add(board);
				}		
				listHelper.setList(tmpList);
				
		}catch(Exception e){
				listHelper.setList(listObject);
		}

		// 전체 페이지 구하기
		if (totalCount > 0) {
			if (totalCount % listHelper.getCntPerPage() == 0) {
				totalPage = (int) (totalCount / listHelper.getCntPerPage());
			} else {
				totalPage = (int) (totalCount / listHelper.getCntPerPage()) + 1;
			}
		}
		listHelper.setTotalPage(totalPage);

		return listHelper;
	}
	
	
	
	/**
	 * 상세 쿼리
	 */	
	@SuppressWarnings("rawtypes")
	protected Map selectDetailHelper(String countQuery, String detailQuery,  String prevQuery,   String nextQuery, String clickhitQuery,
			Map param) {

		ListHelper listHelper = new ListHelper(param);
		
		// 리스트 사이즈
		int listSize = NdnUtil.convertInt(param.get("listSize"),  listHelper.getCntPerPage() );	
		
		int totalCount = 0;
		int totalPage = 0;
		Map view = new HashMap();

		if ( !"".equals(countQuery)){
			Object rtnObject = selectInt(countQuery,  param);
			try {
				totalCount = Integer.parseInt(rtnObject.toString());
			} catch (Exception e) {
				throw ExceptionFactory.wrapException("Error querying " + countQuery
						+ ".  Cause: " + e, e);
			}
		}
		

		// 조회수 증가
		int result = update(clickhitQuery , param);
		
		Map detail = (Map)selectOne(detailQuery, param);		
		Map listPrev = null;
		Map listNext = null;
		
		if ( !"".equals(prevQuery)){
			listPrev = (Map)selectOne(prevQuery, param);
		}
		
		if ( !"".equals(nextQuery)){
			listNext = (Map)selectOne(nextQuery, param);
		}
		
		
		// 전체 페이지 구하기		
		if (totalCount > 0) {
			if (totalCount % listSize == 0) {
				totalPage = (int) (totalCount / listSize);
			} else {
				totalPage = (int) (totalCount / listSize) + 1;
			}
		}	
		int thisPage = 0;
		

		
		if ( listPrev != null ){
			thisPage = (int)Math.ceil(( totalPage -  ( (double)listPrev.get("ROWNUM"))  )  / listSize )  +1;
			listPrev.put("curPage", thisPage);
		}
		
		if ( listNext != null ){
			thisPage = (int)Math.ceil(( totalPage -  ( (double)listNext.get("ROWNUM")) )  /  listSize )  +1;
			listNext.put("curPage", thisPage);
		}
		
						
		
		view.put("detail", detail);
		view.put("listPrev", listPrev);
		view.put("listNext", listNext);

		return view;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 상품 상세 쿼리
	 */	
	@SuppressWarnings("rawtypes")
	protected Map selectProductDetailHelper(String countQuery, String detailQuery,  String prevQuery,   String nextQuery, String clickhitQuery,
			Map param) {
		
		Map view = new HashMap();
				
		// 상세 정보 가져오기
		view.putAll(  selectDetailHelper(countQuery, detailQuery,  prevQuery,   nextQuery, clickhitQuery,param) );
		
		
		Map detail = new HashMap();
		detail = (Map) view.get("detail");
		detail = optList_init(detail);
		
		view.put("detail", detail);
		
		
		return view;
	}
	
	
	@SuppressWarnings("rawtypes")
	protected Map selectProductDetailHelper(String detailQuery, Map param) {
		
		Map view = new HashMap();
		
		view = (Map)selectOne(detailQuery, param);
		
		view = optList_init(view);
		
		return view;
	}
	
	
	/**
	 * 옵션 데이타 가공
	 */
	public Map optList_init(Map view){
		
		return NdnUtil.optList_init(view);
	}
	
	
}
