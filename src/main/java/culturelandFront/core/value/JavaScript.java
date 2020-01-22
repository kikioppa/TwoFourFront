package culturelandFront.core.value;

import java.util.LinkedHashMap;
import java.util.Map;

public class JavaScript {

	private String message;
	private String location;
	private String src;
	private Map<Integer, String> methods = null;
	private int methodSeq = 0;
	
	public JavaScript() {
		this.src = "";
		this.message = "";
		this.location = "";
		
	}
	
	public JavaScript(String message) {
		this.src = "";
		this.message = message;
		this.location = "";
	}
	
	public JavaScript(String message, String location) {
		this.src = "";
		this.message = message;
		this.location = location;
		this.methods = null;
	}
	
	public void script(String method) {
		if( methods == null) {
			methods = new LinkedHashMap<Integer, String>();
			methodSeq = 0;
		}
		methods.put(methodSeq++, method);
	}
	
	public String getSrc() {
		return src;
	}
	
	public void setSrc(String src) {
		this.src = src;
	}
	
	public String getMessage() {
		return message;
	}

	public void message(String message) {
		this.message = message;
	}

	public String getLocation() {
		return location;
	}

	public void location(String location) {
		this.location = location;
	}
	
	public Map<Integer, String> getMethods() {
		return methods;
	}
}
