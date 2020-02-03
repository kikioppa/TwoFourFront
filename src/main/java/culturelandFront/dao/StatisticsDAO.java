package culturelandFront.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import culturelandFront.core.abstr.NdnAbstractMapper;
import culturelandFront.core.helper.ListHelper;

@Repository("statisticsDAO")
public class StatisticsDAO extends NdnAbstractMapper{

	
	
	
	public List selectJoinList(Map param){
		return list("statistic.selectJoinList", param);
	}
	
	public List selectPurchaseList(Map param){
		return list("statistic.selectPurchaseList", param);
	}
	
	public List selectMainJoinList(Map param){
		return list("statistic.selectMainJoinList", param);
	}
	
	public List<Map<?, ?>> selectCodeList(Map param) {
		return list("statistic.selectCodeList", param);
	}	
}
