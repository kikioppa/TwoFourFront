package culturelandFront.config;

import javax.servlet.annotation.WebFilter;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

import culturelandFront.core.abstr.NdnAbstractController;

@WebFilter(urlPatterns = "/*")
public class SiteMeshFilter extends ConfigurableSiteMeshFilter {

	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		
		builder
			
			// 웹
			.addDecoratorPath("/*.do", "/WEB-INF/layout/front/page.jsp")
//			.addDecoratorPath("/index.do", "/WEB-INF/layout/front/index.jsp")
//			.addDecoratorPath("/index.do", "/WEB-INF/layout/popup.jsp")
			
			// 모바일
			.addDecoratorPath("/m/*.do", "/WEB-INF/layout/mobile/m_page.jsp")
			.addDecoratorPath("/m/index.do", "/WEB-INF/layout/mobile/m_index.jsp")
//			.addDecoratorPath("/m/*/index.do", "/WEB-INF/layout/mobile/m_index.jsp")
			
			// 별도 페이지 
			.addDecoratorPath("/popup/**", "/WEB-INF/layout/popup.jsp")
			.addDecoratorPath("/*/popup/**", "/WEB-INF/layout/popup.jsp")
			.addDecoratorPath("/*/*/popup/**", "/WEB-INF/layout/popup.jsp")
			.addDecoratorPath("/editor/uploadImg.do", "/WEB-INF/layout/popup.jsp")	
						
			
			// 제외
			.addExcludedPath("/**Template**" )
			.addExcludedPath("/cmm/**" )

			.addExcludedPath("/smarteditor/photo_uploader/popup/**" )
			
			
			// 관리자
			.addDecoratorPath( NdnAbstractController.ADMIN_URI + "/**", "/WEB-INF/layout/admin/admin.jsp")
//			.addDecoratorPath( NdnAbstractController.ADMIN_URI + "/popup/**", "/WEB-INF/layout/admin/admin.jsp")
			.addExcludedPath( NdnAbstractController.ADMIN_URI + "/login*.do" );
			
		
	}
}
