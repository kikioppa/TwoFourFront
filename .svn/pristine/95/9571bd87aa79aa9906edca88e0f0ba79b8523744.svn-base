package culturelandFront.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import culturelandFront.core.abstr.NdnAbstractMapper;
import culturelandFront.core.helper.ListHelper;

@Repository("contentsDAO")
public class ContentsDAO extends NdnAbstractMapper {

	
	public List selectMessageList() {
		return list("contents.selectMessageList" , null);
	}
	
	
	public ListHelper selectContentsListHelper(ListHelper listHelper){
		return selectListHelper("contents.selectContentsCount", "contents.selectContentsList", listHelper);
	}
	
	public List selectContentsList(Map param){
		return list("contents.selectContentsList", param);
	}
	
	public ListHelper selectPlaceListHelper(ListHelper listHelper){
		return selectListHelper("contents.selectPlaceCount", "contents.selectPlaceList", listHelper);
	}
	
	public List selectPlaceList(Map param){
		return list("contents.selectPlaceList", param);
	}
	
	public ListHelper selectQuizListHelper(ListHelper listHelper){
		return selectListHelper("contents.selectQuizCount", "contents.selectQuizList", listHelper);
	}
	
	public List selectQuizList(Map param){
		return list("contents.selectQuizList", param);
	}
	
	public int selectContentsCount(Map param){
		return selectInt("contents.selectContentsCount", param);
	}
	
	public Map<String, Object> selectContentsDetail(Map param){
		return (Map)selectOne("contents.selectContentsDetail", param);
	}
	
	public Map<String, Object> selectPlaceDetail(Map param){
		return (Map)selectOne("contents.selectPlaceDetail", param);
	}
	
	public Map<String, Object> selectQuizDetail(Map param){
		return (Map)selectOne("contents.selectQuizDetail", param);
	}
	
	public int insertContents(Map param){
		return insert("contents.insertContents", param);
	}
	
	public int updateContents(Map param){
		return update("contents.updateContents", param);
	}
	
	public int deleteContents(Map param){
		return delete("contents.deleteContents", param);
	}
	
	public int insertPlace(Map param){
		return insert("contents.insertPlace", param);
	}
	
	public int updatePlace(Map param){
		return update("contents.updatePlace", param);
	}
	
	public int deletePlace(Map param){
		return delete("contents.deletePlace", param);
	}
	
	public int insertQuiz(Map param){
		return insert("contents.insertQuiz", param);
	}
	
	public int updateQuiz(Map param){
		return update("contents.updateQuiz", param);
	}
	
	public int deleteQuiz(Map param){
		return delete("contents.deleteQuiz", param);
	}
	
	
}
