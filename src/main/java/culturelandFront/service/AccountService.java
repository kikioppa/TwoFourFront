package culturelandFront.service;

import java.util.List;
import java.util.Map;

import culturelandFront.core.helper.ListHelper;

public interface AccountService {
	
	public ListHelper getSelectAccountList(ListHelper listHelper);

	public List getSelectAccountPurchaseList(Map param);
	
	
	public Map getSelectAccountDetail(Map param);
	
	public int insertAccount(Map param);
	
	public int updateAccount(Map param);
	
	public int updateAccountStatus(Map param);
	
	public int updateAccountPassChange(Map param);
	
	public int deleteAccount(Map param);

	public int resetPassword(Map param);
	
	public int idCheck(Map param);
}
