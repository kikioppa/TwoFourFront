package culturelandFront.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import culturelandFront.dao.BannerDAO;
import culturelandFront.service.BannerService;
import culturelandFront.service.BoardService;

@Service("bannerService")
public class BannerServiceImpl implements BannerService{

	@Resource(name="bannerDAO")	
	private BannerDAO bannerDAO;

	public List<Map> getSelectBannerList(Map param){
		return bannerDAO.getSelectBannerList(param);
	}
	
	public Map selectBanner(Map param){
		return bannerDAO.selectBanner(param);
	}
	
	public int insertBanner(Map param){
		return bannerDAO.insertBanner(param);
	}
	
	public int updateBanner(Map param){
		return bannerDAO.updateBanner(param);
	}
	
	public int deleteBanner(Map param){
		return bannerDAO.deleteBanner(param);
	}
	
}
