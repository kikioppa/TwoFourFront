package culturelandFront.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import culturelandFront.dao.StatisticsDAO;
import culturelandFront.service.StatisticsService;

@Service("statisticsService")
public class StatisticsServiceImpl implements StatisticsService{

	@Resource(name="statisticsDAO")
	private StatisticsDAO statisticsDAO;
	
	
	public List selectJoinList(Map param){
		return statisticsDAO.selectJoinList(param);
	}
	
	public List selectPurchaseList(Map param){
		return statisticsDAO.selectPurchaseList(param);
	}
	
	public List selectMainJoinList(Map param){
		return statisticsDAO.selectMainJoinList(param);
	}
	
	
}
