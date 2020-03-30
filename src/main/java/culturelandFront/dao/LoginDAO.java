package culturelandFront.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import culturelandFront.core.abstr.NdnAbstractMapper;
import culturelandFront.vo.UserVO;

@Repository("loginDAO")
public class LoginDAO extends NdnAbstractMapper {

	
	public UserVO getUserLogin(UserVO userVO) {
		return (UserVO)selectOne("login.selectUserLogin", userVO);
	}
	
	public Map getUserInfo(Map param) {
		return (Map)selectOne("login.selectUserInfo", param);
	}
	
	public int insertUserPageHis(Map param) {
		return insert("login.insertUserPageHis", param);
	}
	
}
