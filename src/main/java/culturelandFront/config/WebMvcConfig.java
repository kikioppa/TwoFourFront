package culturelandFront.config;

import java.util.List;
import java.util.Locale;

import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.cache.interceptor.SimpleKeyGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.mobile.device.DeviceHandlerMethodArgumentResolver;
import org.springframework.mobile.device.DeviceResolverHandlerInterceptor;
import org.springframework.mobile.device.switcher.SiteSwitcherHandlerInterceptor;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import culturelandFront.config.interceptor.AdminInterceptor;
import culturelandFront.config.interceptor.UserInterceptor;
import culturelandFront.core.abstr.NdnAbstractController;
import culturelandFront.service.LoginService;

@Aspect
@Configuration
@EnableAspectJAutoProxy
@EnableWebMvc
@ComponentScan(
		basePackages="culturelandFront",
		includeFilters={ @ComponentScan.Filter(Controller.class) },
		excludeFilters={
				@ComponentScan.Filter(Service.class),
				@ComponentScan.Filter(Repository.class)
				}
)

public class WebMvcConfig extends WebMvcConfigurerAdapter {
	
	@Autowired
	private LoginService loginService;
	
	@Bean
	public UrlBasedViewResolver setupViewResolver() {
		
		UrlBasedViewResolver resolver = new UrlBasedViewResolver();
		resolver.setPrefix("/WEB-INF/jsp/");
		resolver.setSuffix(".jsp");
		resolver.setViewClass(JstlView.class);
		resolver.setOrder(1);
		
		return resolver;
	}

	@Bean
	public InternalResourceViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setViewClass(JstlView.class);
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		resolver.setOrder(2);
		return resolver;
	}
	/* java mobile
	public LiteDeviceDelegatingViewResolver liteDeviceAwareViewResolver() {
	    InternalResourceViewResolver delegate = 
	            new InternalResourceViewResolver();
	    delegate.setPrefix("/WEB-INF/jsp/");
	    delegate.setSuffix(".jsp");
	    LiteDeviceDelegatingViewResolver resolver = 
	            new LiteDeviceDelegatingViewResolver(delegate);
	    resolver.setMobilePrefix("m/");
	    return resolver;
	}	
	 */
	@Bean
	public MultipartResolver multipartResolver() {
	  CommonsMultipartResolver resolver = new CommonsMultipartResolver();
	  //resolver.setMaxUploadSize(1048576 *20);	//20MB
	  resolver.setMaxUploadSize(1048576 *30 * 3);	//30MB * 3 ( 첨부파일 3개 )
	  return resolver;
	}
	
	
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		/** 관리자 Interceptor **/
		registry.addInterceptor(new AdminInterceptor())
			.addPathPatterns( NdnAbstractController.ADMIN_URI + "/**/*" )
			.addPathPatterns( NdnAbstractController.ADMIN_URI )
			.excludePathPatterns( NdnAbstractController.ADMIN_URI + "/login*" )
			.excludePathPatterns( NdnAbstractController.ADMIN_URI + "/logout*" );
			
		
		/** 사용자 Interceptor **/
		registry.addInterceptor(new UserInterceptor(loginService))
			.addPathPatterns("/**")
			.excludePathPatterns( "/front/member/login*" )
			.excludePathPatterns( "/front/member/logout*" );		
		
		/*java mobile*/
		registry.addInterceptor(deviceResolverHandlerInterceptor());
		registry.addInterceptor(siteSwitcherHandlerInterceptor())
				.excludePathPatterns("/cmm/*.do" )
				.excludePathPatterns("/m/cmm/*.do" )
			    .excludePathPatterns("/error.do" );
		
		
		registry.addInterceptor(localeChangeInterceptor());
	}
	
	
	/**
	 * 언어 변경을 위한 인터셉터를 생성한다.
	 */
	@Bean
	public LocaleChangeInterceptor localeChangeInterceptor() {

	    LocaleChangeInterceptor interceptor = new LocaleChangeInterceptor();
	    interceptor.setParamName("lang");
	    return interceptor;

	}

	@Bean
	public LocaleResolver localeResolver(){
	    final SessionLocaleResolver localeResolver = new SessionLocaleResolver();
	    localeResolver.setDefaultLocale(new Locale("ko"));
	    return localeResolver;
	}

		
	/**
	 *  ehCache 셋팅
	 * 
	 */
	/*
	@Bean(destroyMethod="shutdown")
    public net.sf.ehcache.CacheManager ehCacheManager() {
	    
        net.sf.ehcache.config.Configuration config = new net.sf.ehcache.config.Configuration();
        config.setMonitoring("autodetect");
        config.setDynamicConfig(true);
        config.setUpdateCheck(false);
        
        DiskStoreConfiguration  diskStoreConfigurationParameter = new DiskStoreConfiguration();
        diskStoreConfigurationParameter.setPath("java.io.tmpdir");
        config.diskStore(diskStoreConfigurationParameter);
        
        
        String[] cacheNames = {"getCodeList" , "getHeadMenu" , "getLeftMenu" , "getTabMenu" };	// 캐시 이름
        for (int i=0;i<cacheNames.length;i++){
        	
        	CacheConfiguration staticConfig = new CacheConfiguration();
            staticConfig.setName(cacheNames[i]);  // 캐시 이름
            staticConfig.setMemoryStoreEvictionPolicy("LRU");  // 메모리에 저장되는 방식을 결정
            staticConfig.setMaxEntriesLocalHeap(1000);  // 최대로 캐싱할 수 있는 Entries의 수
            staticConfig.setTimeToIdleSeconds(3600);   
            staticConfig.setTimeToLiveSeconds(3600);
            staticConfig.transactionalMode("off");
            staticConfig.eternal(false);
            
            PersistenceConfiguration persistenceConfiguration = new PersistenceConfiguration() ;
            persistenceConfiguration.setStrategy("localTempSwap");
			staticConfig.persistence(persistenceConfiguration);
            
            config.addCache(staticConfig);            
        }

        return net.sf.ehcache.CacheManager.newInstance(config);
    }
    
    @Bean
    public CacheManager cacheManager() {
        return new EhCacheCacheManager(ehCacheManager());
    }
	*/
	
    @Bean
    public KeyGenerator keyGenerator() {        
        return new SimpleKeyGenerator();
    }

    /*java mobile*/
    @Bean
    public DeviceResolverHandlerInterceptor 
            deviceResolverHandlerInterceptor() {
        return new DeviceResolverHandlerInterceptor();
    }

    @Bean
    public DeviceHandlerMethodArgumentResolver 
            deviceHandlerMethodArgumentResolver() {
        return new DeviceHandlerMethodArgumentResolver();
    }

    @Bean
    public SiteSwitcherHandlerInterceptor siteSwitcherHandlerInterceptor() {
        return SiteSwitcherHandlerInterceptor.urlPath("/m");
    }    

    @Override
    public void addArgumentResolvers(
            List<HandlerMethodArgumentResolver> argumentResolvers) {
        argumentResolvers.add(deviceHandlerMethodArgumentResolver());
    }
	
	
	

}
