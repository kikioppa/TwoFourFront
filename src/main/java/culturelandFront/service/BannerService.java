package culturelandFront.service;

import java.util.List;
import java.util.Map;

public interface BannerService {
	
	public List<Map> getSelectBannerList(Map param);
	
	public Map selectBanner(Map param);
	
	public int insertBanner(Map param);
	
	public int updateBanner(Map param);
	
	public int deleteBanner(Map param);
	
}
