package culturelandFront.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import culturelandFront.core.helper.ListHelper;
import culturelandFront.dao.BoardDAO;
import culturelandFront.service.BoardService;

@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Resource(name="boardDAO")
	private BoardDAO boardDAO;


	public ListHelper getSelectNoticeBoardList(ListHelper listHelper){
		return boardDAO.getSelectNoticeBoardList(listHelper);
	}
	
	public ListHelper getSelectInquiryBoardList(ListHelper listHelper){
		return boardDAO.getSelectInquiryBoardList(listHelper);
	}
	
	public ListHelper getSelectFaqBoardList(ListHelper listHelper){
		return boardDAO.getSelectFaqBoardList(listHelper);
	}
	
	public List<Map> getSelectCategoryList(Map param){
		return boardDAO.getSelectCategoryList(param);
	}
	
	public List<Map> getSelectIndexNoticeBoardList(Map param){
		return boardDAO.getSelectIndexNoticeBoardList(param);
	}
	
	public List<Map> getSelectIndexFaqBoardList(Map param){
		return boardDAO.getSelectIndexFaqBoardList(param);
	}
	
	public Map getSelectNoticeBoardDetail(Map param){
		return boardDAO.getSelectNoticeBoardDetail(param);
	}
	
	public Map getSelectBoardNext(Map param){
		return boardDAO.getSelectBoardNext(param);
	}
	
	public Map getSelectBoardPrev(Map param){
		return boardDAO.getSelectBoardPrev(param);
	}
	
	public Map getSelectInquiryBoardDetail(Map param){
		return boardDAO.getSelectInquiryBoardDetail(param);
	}
	
	public Map getSelectBoardFrontDetail(Map param){
		return boardDAO.getSelectBoardFrontDetail(param);
	}
	
	public int insertNoticeBoard(Map param){
		return boardDAO.insertNoticeBoard(param);
	}
	
	public int insertInquiryBoard(Map param){
		return boardDAO.insertInquiryBoard(param);
	}
	
	public int insertCategoryBoard(Map param){
		return boardDAO.insertCategoryBoard(param);
	}
	
	public int insertFaqBoard(Map param){
		return boardDAO.insertFaqBoard(param);
	}
	
	public int updateNoticeBoard(Map param){
		return boardDAO.updateNoticeBoard(param);
	}
	
	public int updateInquiryBoardYn(Map param){
		return boardDAO.updateInquiryBoardYn(param);
	}
	
	public int deleteNoticeBoard(Map param){
		return boardDAO.deleteNoticeBoard(param);
	}
	
	public int deleteCategoryBoard(Map param){
		return boardDAO.deleteCategoryBoard(param);
	}
	
	public int deleteFaqBoard(Map param){
		return boardDAO.deleteFaqBoard(param);
	}
	
	public ListHelper getSelectPushList(ListHelper listHelper){
		return boardDAO.getSelectPushList(listHelper);
	}
	
	public Map getSelectPushDetail(Map param){
		return boardDAO.getSelectPushDetail(param);
	}
	
	public int insertPush(Map param){
		return boardDAO.insertPush(param);
	}
	
	public int updatePush(Map param){
		return boardDAO.updatePush(param);
	}
	
	public int deletePush(Map param){
		return boardDAO.deletePush(param);
	}
	
	public Map selectPushMsg(Map param){
		return boardDAO.selectPushMsg(param);
	}
	
	public List selectPushDevice(Map param){
		return boardDAO.selectPushDevice(param);
	}
	
	public double selectCharge(Map param){
		return boardDAO.selectCharge(param);
	}
}
