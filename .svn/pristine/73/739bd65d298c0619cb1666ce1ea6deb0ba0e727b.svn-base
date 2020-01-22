package culturelandFront.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import culturelandFront.core.abstr.NdnAbstractMapper;

@Repository("categoryDAO")
public class CategoryDAO extends NdnAbstractMapper{

	
	
	public List<Map<String, Object>> getSelectCategoryList(Map param){
		return list("category.selectCategoryList", param);
	}
	

}
