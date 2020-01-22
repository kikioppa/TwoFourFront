package culturelandFront.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService;
import egovframework.rte.fdl.idgnr.impl.strategy.EgovIdGnrStrategyImpl;

//import egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService;
//import egovframework.rte.fdl.idgnr.impl.strategy.EgovIdGnrStrategyImpl;
 
@Configuration
public class ContextIdgen {
	/*
    @Bean(destroyMethod="destroy")
    public EgovTableIdGnrService userIdGnrService(DataSource dataSource, EgovIdGnrStrategyImpl mixPrefixUser){
    	EgovTableIdGnrService EgovTableIdGnrService = new EgovTableIdGnrService();
    	EgovTableIdGnrService.setDataSource(dataSource);
    	EgovTableIdGnrService.setStrategy(mixPrefixUser);
    	EgovTableIdGnrService.setBlockSize(1);
    	EgovTableIdGnrService.setTable("t_comseq");
    	EgovTableIdGnrService.setTableName("USRCNFRM_ID");
        return EgovTableIdGnrService;
    }
     
    @Bean
    public EgovIdGnrStrategyImpl mixPrefixUser(){
    	EgovIdGnrStrategyImpl egovIdGnrStrategyImpl = new EgovIdGnrStrategyImpl();
        egovIdGnrStrategyImpl.setPrefix("USRCNFRM_");
        egovIdGnrStrategyImpl.setCipers(11);
        egovIdGnrStrategyImpl.setFillChar('0');
        return egovIdGnrStrategyImpl;
    }
    */
    
    @Bean(destroyMethod="destroy")
    public EgovTableIdGnrService fileGnrService(DataSource dataSource, EgovIdGnrStrategyImpl mixPrefixFile){
    	EgovTableIdGnrService EgovTableIdGnrService = new EgovTableIdGnrService();
    	EgovTableIdGnrService.setDataSource(dataSource);
    	EgovTableIdGnrService.setStrategy(mixPrefixFile);
    	EgovTableIdGnrService.setBlockSize(1);
//    	EgovTableIdGnrService.setTable("TB_COMSEQ");
    	EgovTableIdGnrService.setTable("CC_COMCODE");
    	EgovTableIdGnrService.setTableName("FILE_ID");
        return EgovTableIdGnrService;
    }
     
    @Bean
    public EgovIdGnrStrategyImpl mixPrefixFile(){
        EgovIdGnrStrategyImpl egovIdGnrStrategyImpl = new EgovIdGnrStrategyImpl();
        egovIdGnrStrategyImpl.setPrefix("FILE_");
        egovIdGnrStrategyImpl.setCipers(15);
        egovIdGnrStrategyImpl.setFillChar('0');
        return egovIdGnrStrategyImpl;
    }    
    
    
 
    
    
}