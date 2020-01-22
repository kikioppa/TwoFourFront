package culturelandFront.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import culturelandFront.core.abstr.NdnAbstractMapper;
import culturelandFront.core.helper.ListHelper;

@Repository("grantDAO")
public class GrantDAO extends NdnAbstractMapper{

	
	
	public ListHelper getSelectGrantList(ListHelper listHelper){
		return selectListHelper("grant.selectGrantListCnt","grant.selectGrantList", listHelper);
	}
	
//	public ListHelper getSelectAccountList(ListHelper listHelper){
//		return selectListHelper("account.selectAccountListCnt","account.selectAccountList", listHelper);
//	}
	
	public Map getSelectGrantDetail(Map param){
		return (Map) selectOne("grant.selectGrantDetail", param);
	}

	public int insertGrant(Map param){
		return insert("grant.insertGrant", param);
	}
	
	public int updateGrant(Map param){
		return update("grant.updateGrant", param);
	}
	
	public int deleteGrant(Map param){
		return delete("grant.deleteGrant", param);
	}
}
