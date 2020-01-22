package culturelandFront.config.aop;

import java.text.MessageFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceResolvable;
import org.springframework.context.NoSuchMessageException;

import culturelandFront.service.ContentsService;


public class DatabaseMessageSource implements MessageSource {

	private final Logger logger = Logger.getLogger(this.getClass());	

	
	@Autowired
	private ContentsService contentsService;

	 public void DatabaseDrivenMessageSource(ContentsService contentsService) {
			this.contentsService = contentsService;		
	 }
	 

    private final Map<String, Map<String, String>> properties = new HashMap();

    
    
    @PostConstruct
    public void init() {
        reload();
    }

    
    public void reload() {
        properties.clear();
        properties.putAll(loadTexts());
    }
    
    
    protected Map loadTexts() {
    	
    	logger.info("DatabaseMessageSource Load Texts !!");
    	
    	Map<String, String> m = new HashMap();
    	
//    	List<Map<String,  Object>>  messages = contentsService.selectMessageList();
//    	
//    	for(Map message : messages) {
//            m=new HashMap();
//            if(properties.get(message.get("label").toString())!=null) {
//               m=properties.get(message.get("label").toString());
//            }  
//           
//	       m.put(message.get("lang").toString(),message.get("code").toString());
//	       properties.put(message.get("label").toString(),m);
//            
//        }

    	
    	
		return m;
    }
    
    @Override
    public String getMessage(String code, Object[] args, String defaultMessage, Locale locale) {
        return resolveMessage(code, args, locale);
    }

    @Override
    public String getMessage(String code, Object[] args, Locale locale) throws NoSuchMessageException {
        return resolveMessage(code, args, locale);
    }

    @Override
    public String getMessage(MessageSourceResolvable resolvable, Locale locale) throws NoSuchMessageException {
        for (String code : resolvable.getCodes()) {
            String message = resolveMessage(code, resolvable.getArguments(), locale);
            if (message != null) {
                return message;
            }
        }
        return null;
    }

    private String resolveMessage(String code, Object[] args, Locale locale) {
    	
    	Map<String, String> localized = properties.get(code);

    	String textForCurrentLanguage = null;
        if (localized != null) {
            textForCurrentLanguage = localized.get(locale.getLanguage());
            if (textForCurrentLanguage == null) {
                textForCurrentLanguage = localized.get(new Locale("ko"));
            }
        }
        
        
        if ( textForCurrentLanguage == null ){
        	return code;
        }
    	
        MessageFormat messageFormat = new MessageFormat(textForCurrentLanguage, locale);
        return messageFormat.format(args);
    }

	
}