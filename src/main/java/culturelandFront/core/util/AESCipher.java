package culturelandFront.core.util;

import java.io.UnsupportedEncodingException;
import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

//import org.apache.ws.commons.util.Base64;


/**
 * AES128  16비트 공개키로 암호화 및 복호화
 * 
 * @author jin
 *
 */
public class AESCipher{
	

    private String iv;
    private Key keySpec;
 
    public AESCipher(String key) throws UnsupportedEncodingException {
        this.iv = key.substring(0, 16);
 
        byte[] keyBytes = new byte[16];
        byte[] b = key.getBytes("UTF-8");
        int len = b.length;
        
        if(len > keyBytes.length){
            len = keyBytes.length;
        }
        
        System.arraycopy(b, 0, keyBytes, 0, len);
        SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");
 
        this.keySpec = keySpec;
    }
 
    // 암호화
//    public String aesEncode(String str) throws Exception{
//    	
//        Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
//        c.init(Cipher.ENCRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes()));
// 
//        byte[] encrypted = c.doFinal(str.getBytes("UTF-8"));
//        String enStr = new String(Base64.encode(encrypted));
// 
//        return enStr;
//    }
 
    //복호화
//    public String aesDecode(String str) throws Exception {
//    	
//        Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
//        c.init(Cipher.DECRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes("UTF-8")));
// 
//        byte[] byteStr =Base64.decode(str);
// 
//        return new String(c.doFinal(byteStr),"UTF-8");
//    }
	
	
	
}