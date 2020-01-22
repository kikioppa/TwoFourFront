package culturelandFront.dao;

import java.util.List;


import java.util.Map;

import org.springframework.stereotype.Repository;

import culturelandFront.core.abstr.NdnAbstractMapper;
import culturelandFront.core.helper.ListHelper;

@Repository("accountDAO")
public class AccountDAO extends NdnAbstractMapper{

	
	
	public ListHelper getSelectAccountList(ListHelper listHelper){
		return selectListHelper("account.selectAccountListCnt","account.selectAccountList", listHelper);
	}
	
	public ListHelper getSelectInquiryBoardListDetail(ListHelper listHelper){
		return selectListHelper("account.selectAccountListCnt","account.selectInquiryBoardListDetail", listHelper);
	}
	
	public Map getSelectAccountDetail(Map param){
		return (Map) selectOne("account.selectAccountDetail", param);
	}
	
	public List getSelectAccountPurchaseList(Map param){
		return list("account.selectAccountPurchaseList", param);
	}
	
	public int insertAccount(Map param){
		return insert("account.insertAccount", param);
	}
	
	public int updateAccount(Map param){
		return update("account.updateAccount", param);
	}
	
	public int updateAccountStatus(Map param){
		return update("account.updateAccountStatus", param);
	}
	
	public int updateAccountPassChange(Map param){
		return update("account.updateAccountPassChange", param);
	}
	
	public int deleteAccount(Map param){
		return delete("account.deleteAccount", param);
	}
	public int resetPassword(Map param){
		return update("account.resetPassword", param);
	}
	
	public int idCheck(Map param){
		return selectInt("account.idCheck", param);
	}
}
