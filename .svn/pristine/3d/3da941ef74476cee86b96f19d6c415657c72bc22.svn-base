package culturelandFront.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import culturelandFront.core.abstr.NdnAbstractMapper;
import culturelandFront.core.helper.ListHelper;

@Repository("purchaseDAO")
public class PurchaseDAO extends NdnAbstractMapper{

	
	
	public ListHelper getSelectPurchaseList(ListHelper listHelper){
		return selectListHelper("purchase.selectPurchaseListCnt","purchase.selectPurchaseList", listHelper);
	}
	
	public ListHelper getSelectLargePurchaseDetailList(ListHelper listHelper){
		return selectListHelper("purchase.selectLargePurchaseDetailListCnt","purchase.selectLargePurchaseDetailList", listHelper);
	}
	
	public Map getSelectPurchaseDetail(Map param){
		return (Map) selectOne("purchase.selectPurchaseDetail", param);
	}
	
	public Map getSelectLargePurchaseDetail(Map param){
		return (Map) selectOne("purchase.selectLargePurchaseDetail", param);
	}
	
	public List getSelectPurchaseDetailList(Map param){
		return list("purchase.selectPurchaseDetailList", param);
	}
	
	public List getSelectMainPurchaseList(Map param){
		return list("purchase.selectMainPurchaseList", param);
	}
	
//	public int insertGrant(Map param){
//		return insert("grant.insertGrant", param);
//	}
	
	public int updateLargePurchase(Map param){
		return update("purchase.updateLargePurchase", param);
	}
	
//	public int deleteGrant(Map param){
//		return delete("grant.deleteGrant", param);
//	}
}
