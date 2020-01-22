package culturelandFront.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import culturelandFront.core.abstr.NdnAbstractMapper;
import culturelandFront.core.helper.ListHelper;

@Repository("bannerDAO")
public class BannerDAO extends NdnAbstractMapper{

	public List<Map> getSelectBannerList(Map param){
		return (List<Map>)list("banner.selectBannerList", param);
	}

	public Map selectBanner(Map param){
		return (Map) selectOne("banner.selectBanner", param);
	}

	public int insertBanner(Map param){
		return insert("banner.insertBanner", param);
	}

	public int updateBanner(Map param){
		return update("banner.updateBanner", param);
	}

	public int deleteBanner(Map param){
		return delete("banner.deleteBanner", param);
	}
	
}
