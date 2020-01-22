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
	
	
	public ListHelper getSelectPurchaseList(ListHelper listHelper){
		return purchaseDAO.getSelectPurchaseList(listHelper);
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
	
	public List getSelectPurchaseDetailList(Map param){
		return purchaseDAO.getSelectPurchaseDetailList(param);
	}
	
	public List getSelectMainPurchaseList(Map param){
		return purchaseDAO.getSelectMainPurchaseList(param);
	}
	
//	public int insertGrant(Map param){
//		return purchaseDAO.insertGrant(param);
//	}
	
	public int updateLargePurchase(Map param){
		return purchaseDAO.updateLargePurchase(param);
	}
	
//	public int updateAccountPassChange(Map param){
//		return accountDAO.updateAccountPassChange(param);
//	}
	
//	public int deleteGrant(Map param){
//		return purchaseDAO.deleteGrant(param);
//	}
	
}
