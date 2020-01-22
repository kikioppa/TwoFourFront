package culturelandFront.core.util;

import org.springframework.core.env.Environment;

public class PropUtil {

	public static String get(String value) {
		Environment env = StaticContextAccessor.getBean(Environment.class);
		return env.getProperty(value);
	}
	
}
