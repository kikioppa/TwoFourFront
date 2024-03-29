package culturelandFront.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import culturelandFront.dao.AccountDAO;
import culturelandFront.service.AccountService;

@Service("accountService")
public class AccountServiceImpl implements AccountService{

	@Resource(name="accountDAO")
	private AccountDAO accountDAO;
	
	
	public Map getSelectAccountDetail(Map param){
		return accountDAO.getSelectAccountDetail(param);
	}
	
	public int insertAccount(Map param){
		return accountDAO.insertAccount(param);
	}
	
	public int insertAccountConfirm(Map param){
		return accountDAO.insertAccountConfirm(param);
	}
	
	public int updateAccount(Map param){
		return accountDAO.updateAccount(param);
	}
	
	public int updateAccountConfirm(Map param) {
		return accountDAO.updateAccountConfirm(param);
	}
}
