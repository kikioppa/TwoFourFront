package culturelandFront.config;

import java.io.IOException;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
//@EnableCaching
public class DataConfig {

	@Autowired
	ApplicationContext applicationContext;
	
	@Resource
	private Environment env;    
	
	 /*
     * 웹사이트 데이터소스
     */
	
	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl(env.getRequiredProperty("db.url"));
		dataSource.setUsername(env.getRequiredProperty("db.id"));
		dataSource.setPassword(env.getRequiredProperty("db.pwd"));			
//		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
//		dataSource.setUrl(PropUtil.get("db.url")+"/"+PropUtil.get("db.id")+"?useUnicode=true&amp;characterEncoding=utf8&amp;zeroDateTimeBehavior=convertToNull&amp;autoReconnect=true");
//		dataSource.setUsername(PropUtil.get("db.id"));
//		dataSource.setPassword(PropUtil.get("db.pwd"));
//			
//		
//		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
//		dataSource.setUrl(
//				"jdbc:mysql://14.63.226.111:3306/finance?useUnicode=true&amp;characterEncoding=utf8&amp;zeroDateTimeBehavior=convertToNull&amp;autoReconnect=true");
//		dataSource.setUsername("finance");
//		dataSource.setPassword("finance123qwer");	
		
		
		return dataSource;
		  
	}
	
	@Bean(name = "sqlSessionFactory")
	public SqlSessionFactoryBean sqlSessionFactoryBean(DataSource dataSource, ApplicationContext applicationContext)
			throws IOException {

		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();

		factoryBean.setDataSource(dataSource);
		factoryBean.setConfigLocation(applicationContext.getResource("classpath:/culturelandFront/sql/sql-map-config.xml"));
		factoryBean.setMapperLocations(applicationContext.getResources("classpath:/culturelandFront/sql/mapper/*.xml"));

		return factoryBean;
	}

    @Bean(name = "sqlSessionTemplate")
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
    	return new SqlSessionTemplate(sqlSessionFactory);
    }
    
    @Bean(name = "transactionManager")
    public PlatformTransactionManager transactionManager() throws Exception{
        return new DataSourceTransactionManager(dataSource());
    }
}
