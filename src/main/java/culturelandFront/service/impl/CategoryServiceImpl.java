package culturelandFront.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import culturelandFront.dao.CategoryDAO;
import culturelandFront.service.CategoryService;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService{

	@Resource(name="categoryDAO")
	private CategoryDAO categoryDAO;
	
	@Override
	public List<Map<String, Object>> getSelectCategoryList(Map param){
		return categoryDAO.getSelectCategoryList(param);
	}
	

}
