package culturelandFront.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import culturelandFront.core.abstr.NdnAbstractMapper;
import culturelandFront.core.helper.ListHelper;

@Repository("memberDAO")
public class MemberDAO extends NdnAbstractMapper{

	
	
	public ListHelper getSelectMemberList(ListHelper listHelper){
		return selectListHelper("member.selectMemberListCnt","member.selectMemberList", listHelper);
	}
	
	public ListHelper getSelectInquiryBoardListDetail(ListHelper listHelper){
		return selectListHelper("member.selectMemberListCnt","member.selectInquiryBoardListDetail", listHelper);
	}
	
	public Map getSelectMemberDetail(Map param){
		return (Map) selectOne("member.selectMemberDetail", param);
	}
	
	public List getSelectMemberPurchaseList(Map param){
		return list("member.selectMemberPurchaseList", param);
	}
	
	public int insertMember(Map param){
		return insert("member.insertMember", param);
	}
	
	public int updateMember(Map param){
		return update("member.updateMember", param);
	}
	
	public int updateMemberStatus(Map param){
		return update("member.updateMemberStatus", param);
	}
	
	public int updateMemberPassChange(Map param){
		return update("member.updateMemberPassChange", param);
	}
	
	public int deleteMember(Map param){
		return delete("member.deleteMember", param);
	}
	public int resetPassword(Map param){
		return update("member.resetPassword", param);
	}
	
	public int idCheck(Map param){
		return selectInt("member.idCheck", param);
	}
	
	public int acCheck(Map param){
		return selectInt("member.acCheck", param);
	}
	
	public int findIdCount(Map param){
		return selectInt("member.findIdCount", param);
	}
	
	public int findIdTrueCount(Map param){
		return selectInt("member.findIdTrueCount", param);
	}
	public Map findId(Map param){
		return (Map) selectOne("member.findId", param);
	}
	public Map selectParam(Map param){
		return (Map) selectOne("member.selectParam", param);
	}

	public Map selectMemberInfo(Map param) {
		return (Map) selectOne("member.selectMemberInfo", param);
	}

	public int updateMemberPhone(Map param) {
		return update("member.updateMemberPhone", param);
	}

	public int updateMemberInfo(Map param) {
		return update("member.updateMemberInfo", param);
	}
	

}

