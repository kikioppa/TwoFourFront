package culturelandFront.core.util;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

@Component
public class StaticContextAccessor {

	private static StaticContextAccessor instance;

    @Autowired
    private ApplicationContext applicationContext;

    @PostConstruct
    public void registerInstance() {
        instance = this;
    }

    public static <T> T getBean(Class<T> clazz) {
        return instance.applicationContext.getBean(clazz);
    }
    
    /**
     *  profiles.active 가져오기
     */	
    public static String getProfiles() {
        String[] profiles = instance.applicationContext.getEnvironment().getActiveProfiles();
        
        if( profiles.length==0 ){
            profiles = instance.applicationContext.getEnvironment().getDefaultProfiles();
        }
         
        return profiles[0];
    }
    
}
