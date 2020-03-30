package culturelandFront.core.security.sha256;
import java.security.*;

public class sha256 {

    public static String createHash(String data) throws Exception {
        if(data == null) {
            throw new NullPointerException();
        }
 
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] raw = md.digest(data.getBytes("UTF-8"));

        StringBuffer result = new StringBuffer();
        for(int i=0; i<raw.length; i++) {
            result.append(Integer.toString((raw[i] & 0xFF) + 256, 16).substring(1));
        }
        return result.toString();
    }
    
    public static String pwEncode(String id, String pw) throws Exception {
    	String pwEncodeStr = id + "!!sa@" + pw;
    	
    	return pwEncodeStr;
    }
}
