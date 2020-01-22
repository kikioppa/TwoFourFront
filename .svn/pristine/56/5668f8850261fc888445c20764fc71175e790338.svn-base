package culturelandFront.config;

import javax.annotation.Resource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.stereotype.Controller;

import culturelandFront.config.aop.DatabaseMessageSource;
import culturelandFront.service.ContentsService;

@Configuration
@ComponentScan(
		basePackages = "culturelandFront", 
		excludeFilters = { @ComponentScan.Filter(Controller.class) }
		)
@PropertySource(value={
									"classpath:/culturelandFront/properties/application.properties" ,
									"classpath:/culturelandFront/properties/config/app-${spring.profiles.active:default}.properties"
								})
public class CommonConfig {

	@Bean(name="messageSource")
	public ReloadableResourceBundleMessageSource resourceBundleMessageSource() {
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		messageSource.setBasenames("classpath:/culturelandFront/message/message-common_ko");
		messageSource.setCacheSeconds(60);
		messageSource.setDefaultEncoding("UTF-8");
		return messageSource;
	}
	
	
//	@Resource
//	private ContentsService contentsService;
//	
//	@Bean(name="messageSource")
//	public DatabaseMessageSource resourceBundleMessageSource() {
//		DatabaseMessageSource messageSource = new DatabaseMessageSource();
//		messageSource.DatabaseDrivenMessageSource(contentsService);
//		
//		return messageSource;
//	}

}
