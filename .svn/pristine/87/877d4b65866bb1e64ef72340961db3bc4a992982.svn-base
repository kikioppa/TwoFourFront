package culturelandFront.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import culturelandFront.core.helper.ListHelper;
import culturelandFront.dao.MemberDAO;
import culturelandFront.service.MemberService;
import culturelandFront.vo.AdminUserVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	
	
	public ListHelper getSelectMemberList(ListHelper listHelper){
		return memberDAO.getSelectMemberList(listHelper);
	}
	
	public ListHelper getSelectInquiryBoardListDetail(ListHelper listHelper){
		return memberDAO.getSelectInquiryBoardListDetail(listHelper);
	}
	
	public List getSelectMemberPurchaseList(Map param){
		return memberDAO.getSelectMemberPurchaseList(param);
	}
	
	public Map findId(Map param){
		return memberDAO.findId(param);
	}
	/**
	 * 아이디 찾기 parameter
	 * */
	public Map selectParam(Map param){
		return memberDAO.selectParam(param);
	}
	/**
	 * 회원정보수정 session 대용 쿼리
	 * */
	public Map selectMemberInfo(Map param){
		return memberDAO.selectMemberInfo(param);
	}
	
	public Map getSelectMemberDetail(Map param){
		return memberDAO.getSelectMemberDetail(param);
	}
	
	public int insertMember(Map param){
		return memberDAO.insertMember(param);
	}
	
	public int updateMember(Map param){
		return memberDAO.updateMember(param);
	}
	
	public int updateMemberStatus(Map param){
		return memberDAO.updateMemberStatus(param);
	}
	
	public int updateMemberPassChange(Map param){
		return memberDAO.updateMemberPassChange(param);
	}
	
	public int deleteMember(Map param){
		return memberDAO.deleteMember(param);
	}
	
	public int resetPassword(Map param){
		return memberDAO.resetPassword(param);	
	}
	public int idCheck(Map param){
		return memberDAO.idCheck(param);
	}
	public int acCheck(Map param){
		return memberDAO.acCheck(param);
	}
	public int findIdCount(Map param){
		return memberDAO.findIdCount(param);
					
	}
	
	public int updateMemberPhone(Map param){
		return memberDAO.updateMemberPhone(param);
	}
	
	public int updateMemberInfo(Map param){
		return memberDAO.updateMemberInfo(param);
	}
	
	public int findIdTrueCount(Map param){
		return memberDAO.findIdTrueCount(param);
	}

	
	
	
}
