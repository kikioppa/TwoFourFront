package culturelandFront.service;

import java.util.List;
import java.util.Map;

import culturelandFront.core.helper.ListHelper;

public interface PurchaseService {
	
	public List<Map> getSelectIndexPurchaseList(Map param);
	
	public ListHelper getSelectPurchaseList(ListHelper listHelper);
	
	public ListHelper getSelectLargePurchaseList(ListHelper listHelper);
	
	public ListHelper getSelectPurchaseDetailList(ListHelper listHelper);
	
	public ListHelper getSelectLargePurchaseDetailList(ListHelper listHelper);
	
	public Map getSelectPurchaseDetail(Map param);
	
	public Map getSelectLargePurchaseDetail(Map param);
	
	public List getSelectMainPurchaseList(Map param);
	
	/**
	 *  front 시작
	 * */
	public int insertTradeRequest(Map param);
	
	public int insertBuy(Map param);
	
	public int insertBuyDetail(Map param);
	
	public List getSelectPurchaseBuyList(Map param);
	
	public Map getSelectPurchaseBuyResult(Map param);
	
	public int updateCOBuy(Map param);
	
	public int insertBuyLargeDetail(Map param);
	
	public int updateDeposit(Map param);
	
	public String selectKsNetSeq();
	
	public int updateKsNetSeq();
	
	public Map selectTradeRequestTbl(Map param);
	
	public Map selectCoBuy(Map param);
	
	/**
	 *  front 끝
	 * */
//	public int updateAccountPassChange(Map param);
//	
//	public int deleteGrant(Map param);
}
