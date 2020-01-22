package culturelandFront.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import culturelandFront.core.helper.ListHelper;
import culturelandFront.dao.ContentsDAO;
import culturelandFront.service.ContentsService;

@Service("contentsService")
public class ContentsServiceImpl implements ContentsService{

	@Resource(name="contentsDAO")
	private ContentsDAO contentsDAO;
	

	
	public List selectMessageList(){
		return contentsDAO.selectMessageList();
	}
	
	public ListHelper selectContentsListHelper(ListHelper listHelper){
		return contentsDAO.selectContentsListHelper(listHelper);
	}
	
	public List selectContentsList(Map param){
		return contentsDAO.selectContentsList(param);
	}
	
	public ListHelper selectPlaceListHelper(ListHelper listHelper){
		return contentsDAO.selectPlaceListHelper(listHelper);
	}
	
	public List selectPlaceList(Map param){
		return contentsDAO.selectPlaceList(param);
	}
	
	public ListHelper selectQuizListHelper(ListHelper listHelper){
		return contentsDAO.selectQuizListHelper(listHelper);
	}
	
	public List selectQuizList(Map param){
		return contentsDAO.selectQuizList(param);
	}
	
	public int selectContentsCount(Map param){
		return contentsDAO.selectContentsCount(param);
	}
	
	public Map<String, Object> selectContentsDetail(Map param){
		return contentsDAO.selectContentsDetail(param);
	}
	
	public Map<String, Object> selectPlaceDetail(Map param){
		return contentsDAO.selectPlaceDetail(param);
	}
	
	public Map<String, Object> selectQuizDetail(Map param){
		return contentsDAO.selectQuizDetail(param);
	}
	
	public int insertContents(Map param){
		return contentsDAO.insertContents(param);
	}
	
	public int updateContents(Map param){
		return contentsDAO.updateContents(param);
	}
	
	public int deleteContents(Map param){
		return contentsDAO.deleteContents(param);
	}
	
	public int insertPlace(Map param){
		return contentsDAO.insertPlace(param);
	}
	
	public int updatePlace(Map param){
		return contentsDAO.updatePlace(param);
	}
	
	public int deletePlace(Map param){
		return contentsDAO.deletePlace(param);
	}
	
	public int insertQuiz(Map param){
		return contentsDAO.insertQuiz(param);
	}
	
	public int updateQuiz(Map param){
		return contentsDAO.updateQuiz(param);
	}
	
	public int deleteQuiz(Map param){
		return contentsDAO.deleteQuiz(param);
	}
	
	
}
