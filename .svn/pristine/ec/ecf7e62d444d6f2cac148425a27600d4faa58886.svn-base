package culturelandFront.core.security.sha256;
import java.security.*;

public class sha256 {

    public static String createHash(String data) throws Exception {
        if(data == null) {
            throw new NullPointerException();
        }
 
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] raw = md.digest(data.getBytes("EUC-KR"));
       
        StringBuffer result = new StringBuffer();
        for(int i=0; i<raw.length; i++) {
            result.append(Integer.toHexString(raw[i] & 0xff));
        }
        return result.toString();
    }
}
