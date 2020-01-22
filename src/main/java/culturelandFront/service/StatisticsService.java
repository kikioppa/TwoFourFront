package culturelandFront.service;

import java.util.List;
import java.util.Map;

import culturelandFront.core.helper.ListHelper;

public interface StatisticsService {
	
	public List selectJoinList(Map param);
	
	public List selectPurchaseList(Map param);
	
	public List selectMainJoinList(Map param);
}
