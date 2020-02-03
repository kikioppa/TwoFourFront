package culturelandFront.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import culturelandFront.core.abstr.NdnAbstractMapper;
import culturelandFront.core.helper.ListHelper;

@Repository("purchaseDAO")
public class PurchaseDAO extends NdnAbstractMapper{

	public List<Map> getSelectIndexPurchaseList(Map param){
		return list("purchase.selectIndexPurchaseList", param);
	}
	
	public ListHelper getSelectPurchaseList(ListHelper listHelper){
		return selectListHelper("purchase.selectPurchaseListCnt","purchase.selectPurchaseList", listHelper);
	}
	
	public ListHelper getSelectLargePurchaseList(ListHelper listHelper){
		return selectListHelper("purchase.selectLargePurchaseListCnt","purchase.selectLargePurchaseList", listHelper);
	}
	
	public ListHelper getSelectPurchaseDetailList(ListHelper listHelper){
		return selectListHelper("purchase.selectPurchaseDetailListCnt","purchase.selectPurchaseDetailList", listHelper);
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
	
	public List getSelectMainPurchaseList(Map param){
		return list("purchase.selectMainPurchaseList", param);
	}
	
	/**
	 *  front 시작
	 * */
	public int insertBuy(Map param){
		return insert("purchase.insertBuy", param);
	}
	
	public int insertBuyDetail(Map param){
		return insert("purchase.insertBuyDetail", param);
	}
	
	public List getSelectPurchaseBuyList(Map param){
		return list("purchase.selectPurchaseBuyList", param);
	}
	
	public Map getSelectPurchaseBuyResult(Map param){
		return (Map) selectOne("purchase.selectPurchaseBuyResult", param);
	}
	
	public int updateCOBuy(Map param){
		return update("purchase.updateCOBuy", param);
	}
	
	public int insertBuyLargeDetail(Map param){
		return insert("purchase.insertBuyLargeDetail", param);
	}
	
	/**
	 *  front 끝
	 * */
//	public int deleteGrant(Map param){
//		return delete("grant.deleteGrant", param);
//	}
}
