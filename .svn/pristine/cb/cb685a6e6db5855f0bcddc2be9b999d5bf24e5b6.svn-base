package culturelandFront.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import culturelandFront.core.helper.ListHelper;
import culturelandFront.dao.GrantDAO;
import culturelandFront.service.GrantService;

@Service("grantService")
public class GrantServiceImpl implements GrantService{

	@Resource(name="grantDAO")
	private GrantDAO grantDAO;
	
	
	public ListHelper getSelectGrantList(ListHelper listHelper){
		return grantDAO.getSelectGrantList(listHelper);
	}
	
//	public ListHelper getSelectAccountList(ListHelper listHelper){
//		return accountDAO.getSelectAccountList(listHelper);
//	}
//	
	public Map getSelectGrantDetail(Map param){
		return grantDAO.getSelectGrantDetail(param);
	}
	
	public int insertGrant(Map param){
		return grantDAO.insertGrant(param);
	}
	
	public int updateGrant(Map param){
		return grantDAO.updateGrant(param);
	}
//	
//	public int updateAccountPassChange(Map param){
//		return accountDAO.updateAccountPassChange(param);
//	}
	
	public int deleteGrant(Map param){
		return grantDAO.deleteGrant(param);
	}
	
}
