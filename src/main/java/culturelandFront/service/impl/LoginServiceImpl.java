package culturelandFront.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import culturelandFront.dao.LoginDAO;
import culturelandFront.service.LoginService;
import culturelandFront.vo.UserVO;

@Service("loginService")
public class LoginServiceImpl implements LoginService{

	@Resource(name="loginDAO")
	private LoginDAO loginDAO;
	
	@Override
	public UserVO getUserLogin(UserVO userVO){
		return loginDAO.getUserLogin(userVO);
	}
	
	public Map selectUserInfo(Map param){
		return loginDAO.getUserInfo(param);
	}
	
	public int insertUserPageHis(Map param) {
		return loginDAO.insertUserPageHis(param); 
	}
	
}
