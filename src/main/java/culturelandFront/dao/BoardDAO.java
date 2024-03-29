package culturelandFront.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import culturelandFront.core.abstr.NdnAbstractMapper;
import culturelandFront.core.helper.ListHelper;

@Repository("boardDAO")
public class BoardDAO extends NdnAbstractMapper{


	
	public ListHelper getSelectNoticeBoardList(ListHelper listHelper){
		return selectListHelper("board.selectNoticeBoardListCnt","board.selectNoticeBoardList", listHelper);
	}
	
	public ListHelper getSelectInquiryBoardList(ListHelper listHelper){
		return selectListHelper("board.selectInquiryBoardListCnt","board.selectInquiryBoardList", listHelper);
	}
	
	public ListHelper getSelectFaqBoardList(ListHelper listHelper){
		return selectListHelper("board.selectFaqBoardListCnt","board.selectFaqBoardList", listHelper);
	}
	
	public List<Map> getSelectCategoryList(Map param){
		return (List<Map>)list("board.selectCategoryList", param);
	}
	
	public List<Map> getSelectIndexNoticeBoardList(Map param){
		return (List<Map>)list("board.selectIndexNoticeBoardList", param);
	}
	
	public List<Map> getSelectIndexFaqBoardList(Map param){
		return (List<Map>)list("board.selectIndexFaqBoardList", param);
	}
	
	public Map getSelectNoticeBoardDetail(Map param){
		return (Map) selectOne("board.selectNoticeBoardDetail", param);
	}
	
	public Map getSelectBoardNext(Map param){
		return (Map) selectOne("board.selectBoardNext", param);
	}
	
	public Map getSelectBoardPrev(Map param){
		return (Map) selectOne("board.selectBoardPrev", param);
	}
	
	public Map getSelectInquiryBoardDetail(Map param){
		return (Map) selectOne("board.selectInquiryBoardDetail", param);
	}

	public Map getSelectBoardFrontDetail(Map param){
		return selectDetailHelper("board.selectBoardFrontListCnt","board.selectBoardDetail","board.selectBoardPrev","board.selectBoardNext","board.updateBoardClickHit",param);
	}
	
	public int insertNoticeBoard(Map param){
		return insert("board.insertNoticeBoard", param);
	}
	
	public int insertInquiryBoard(Map param){
		return insert("board.insertInquiryBoard", param);
	}
	
	public int insertCategoryBoard(Map param){
		return insert("board.insertCategoryBoard", param);
	}
	
	public int insertFaqBoard(Map param){
		return insert("board.insertFaqBoard", param);
	}
	
	public int updateNoticeBoard(Map param){
		return update("board.updateNoticeBoard", param);
	}
	
	public int updateInquiryBoardYn(Map param){
		return update("board.updateInquiryBoardYn", param);
	}
	
	public int deleteNoticeBoard(Map param){
		return delete("board.deleteNoticeBoard", param);
	}
	
	public int deleteCategoryBoard(Map param){
		return delete("board.deleteCategoryBoard", param);
	}
	
	public int deleteFaqBoard(Map param){
		return delete("board.deleteFaqBoard", param);
	}
	
	public ListHelper getSelectPushList(ListHelper listHelper){
		//return selectListHelper("board.selectPushListCnt","board.selectPushList", listHelper);
		return null;
	}
	
	public Map getSelectPushDetail(Map param){
//		return (Map) selectOne("board.selectPushDetail", param);
		return null;
	}
	
	public int insertPush(Map param){
		return insert("board.insertPush", param);
	}
	
	public int updatePush(Map param){
		return update("board.updatePush", param);
	}
	
	public int deletePush(Map param){
		return delete("board.deletePush", param);
	}
	
	public Map selectPushMsg(Map param){
		return (Map) selectOne("board.selectPushMsg", param);
	}
	
	public List selectPushDevice(Map param){
		return list("board.selectPushDevice", param);
	}
	
	public double selectCharge(Map param){
		return (double) selectOne("board.selectCharge", param);
	}
}
