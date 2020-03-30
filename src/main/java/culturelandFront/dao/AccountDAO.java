package culturelandFront.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import culturelandFront.core.abstr.NdnAbstractMapper;

@Repository("accountDAO")
public class AccountDAO extends NdnAbstractMapper{

	public Map getSelectAccountDetail(Map param){
		return (Map) selectOne("account.selectAccountDetail", param);
	}
	
	public int insertAccount(Map param){
		return insert("account.insertAccount", param);
	}
	
	public int updateAccount(Map param){
		return update("account.updateAccount", param);
	}

	public int updateAccountConfirm(Map param) {
	    return update("account.updateAccountConfirm", param);
	}

	public int insertAccountConfirm(Map param) {
		return insert("account.insertAccountConfirm", param);
	}
	
}

