package culturelandFront.service.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import culturelandFront.core.helper.ListHelper;
import culturelandFront.dao.AccountDAO;
import culturelandFront.service.AccountService;
import culturelandFront.vo.AdminUserVO;

@Service("accountService")
public class AccountServiceImpl implements AccountService{

	@Resource(name="accountDAO")
	private AccountDAO accountDAO;
	
	
	public ListHelper getSelectAccountList(ListHelper listHelper){
		return accountDAO.getSelectAccountList(listHelper);
	}
	
	public ListHelper getSelectInquiryBoardListDetail(ListHelper listHelper){
		return accountDAO.getSelectInquiryBoardListDetail(listHelper);
	}
	
	public List getSelectAccountPurchaseList(Map param){
		return accountDAO.getSelectAccountPurchaseList(param);
	}
	
	public Map getSelectAccountDetail(Map param){
		return accountDAO.getSelectAccountDetail(param);
	}
	
	public int insertAccount(Map param){
		return accountDAO.insertAccount(param);
	}
	
	public int updateAccount(Map param){
		return accountDAO.updateAccount(param);
	}
	
	public int updateAccountStatus(Map param){
		return accountDAO.updateAccountStatus(param);
	}
	
	public int updateAccountPassChange(Map param){
		return accountDAO.updateAccountPassChange(param);
	}
	
	public int deleteAccount(Map param){
		return accountDAO.deleteAccount(param);
	}
	
	public int resetPassword(Map param){
		return accountDAO.resetPassword(param);	
	}
	public int idCheck(Map param){
		return accountDAO.idCheck(param);
			
				
	}


}