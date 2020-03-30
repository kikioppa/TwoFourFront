package culturelandFront.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import culturelandFront.core.helper.ListHelper;
import culturelandFront.dao.PurchaseDAO;
import culturelandFront.service.PurchaseService;

@Service("purchaseService")
public class PurchaseServiceImpl implements PurchaseService{

	@Resource(name="purchaseDAO")
	private PurchaseDAO purchaseDAO;
	
	public List<Map> getSelectIndexPurchaseList(Map param){
		return purchaseDAO.getSelectIndexPurchaseList(param);
	}
	
	public ListHelper getSelectPurchaseList(ListHelper listHelper){
		return purchaseDAO.getSelectPurchaseList(listHelper);
	}
	
	public ListHelper getSelectLargePurchaseList(ListHelper listHelper){
		return purchaseDAO.getSelectLargePurchaseList(listHelper);
	}
	
	public ListHelper getSelectPurchaseDetailList(ListHelper listHelper){
		return purchaseDAO.getSelectPurchaseDetailList(listHelper);
	}
	
	public ListHelper getSelectLargePurchaseDetailList(ListHelper listHelper){
		return purchaseDAO.getSelectLargePurchaseDetailList(listHelper);
	}
	
	public Map getSelectPurchaseDetail(Map param){
		return purchaseDAO.getSelectPurchaseDetail(param);
	}
	
	public Map getSelectLargePurchaseDetail(Map param){
		return purchaseDAO.getSelectLargePurchaseDetail(param);
	}
	
	public List getSelectMainPurchaseList(Map param){
		return purchaseDAO.getSelectMainPurchaseList(param);
	}
	
	/**
	 *  front 시작
	 * */
	
	public int insertTradeRequest(Map param){
		return purchaseDAO.insertTradeRequest(param);
	}
	
	public int insertBuy(Map param){
		return purchaseDAO.insertBuy(param);
	}
	
	public int insertBuyDetail(Map param){
		return purchaseDAO.insertBuyDetail(param);
	}
	
	public List getSelectPurchaseBuyList(Map param){
		return purchaseDAO.getSelectPurchaseBuyList(param);
	}
	
	public Map getSelectPurchaseBuyResult(Map param){
		return purchaseDAO.getSelectPurchaseBuyResult(param);
	}
	
	public int updateCOBuy(Map param){
		return purchaseDAO.updateCOBuy(param);
	}
	
	public int insertBuyLargeDetail(Map param){
		return purchaseDAO.insertBuyLargeDetail(param);
	}

	public int updateDeposit(Map param){
		return purchaseDAO.updateDeposit(param);
	}
	
	public String selectKsNetSeq(){
		return purchaseDAO.selectKsNetSeq();
	}
	
	public int updateKsNetSeq(){
		return purchaseDAO.updateKsNetSeq();
	}
	
	public Map selectTradeRequestTbl(Map param){
		return purchaseDAO.selectTradeRequestTbl(param);
	}
	
	public Map selectCoBuy(Map param){
		return purchaseDAO.selectCoBuy(param);
	}
	/**
	 *  front 끝
	 * */
	
//	public int updateAccountPassChange(Map param){
//		return accountDAO.updateAccountPassChange(param);
//	}
	
//	public int deleteGrant(Map param){
//		return purchaseDAO.deleteGrant(param);
//	}
	
}
