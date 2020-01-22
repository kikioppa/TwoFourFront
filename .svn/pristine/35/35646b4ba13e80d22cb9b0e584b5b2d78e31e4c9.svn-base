package culturelandFront.core.security.seed;

public class SeedED {

	// User secret key
	private static byte pbUserKey[]  = {(byte)0x00, (byte)0x00, (byte)0x00, (byte)0x00, (byte)0x00, (byte)0x00, (byte)0x00, (byte)0x00,
						 (byte)0x00, (byte)0x00, (byte)0x00, (byte)0x00, (byte)0x00, (byte)0x00, (byte)0x00, (byte)0x00};
	// Round keys for encryption or decryption
	private static int pdwRoundKey[] = new int[32];

	public static String encoding(String txt){
		try{
			//System.out.println("[��]\n"+ txt);
			String strenc = Base64.encodeBytes(txt.getBytes());		
			
			//System.out.println("\n[base64 encode]\n"+strenc);		
			
			//byte �� ä���
			int max = 0;
			if(strenc.getBytes().length % 16 != 0){
				max = 16-(strenc.getBytes().length % 16);	
			}
			for(int i=0; i<max ; i++){
				strenc += " ";
			}	
			
			int size = strenc.getBytes().length;

			
			
			// input plaintext to be encrypted
			byte pbData[]     = strenc.getBytes();

			byte pbCipher[]   = new byte[ 16 ];
			byte reData[][]   = new byte[ size/16 ][16];
			byte reCipher[]   = new byte[ size ];		

			// Derive roundkeys from user secret key
			seedx.SeedRoundKey(pdwRoundKey, pbUserKey);		

			// Encryption			
			// Encryption
			int b1=0, b2=0;	
			for(int i=0; i < size; i++){
				b1 = (i / 16);
				b2 = (i % 16);					
				reData[ b1 ][ b2 ] = pbData[i];				
			}
			int rf = 0;
			//System.out.println("\n[seed encoding]");
			for(int i=0; i<reData.length; i++){
				seedx.SeedEncrypt(reData[i], pdwRoundKey, pbCipher);				
				for(int j=0; j<pbCipher.length; j++){
					//System.out.print(pbCipher[j]);
					reCipher[rf++] = pbCipher[j];
				}
			}
			strenc = Base64.encodeBytes(reCipher);		//seed�� byte���� string���� ��ȯ�ϱ� ���� base64�� �ѹ�� ���ڵ�(�̷��� string���� db�� �����Ҽ� �ִ� java�� ��ȯ�ÿ��� �ȵ�)
			return strenc;
		}catch(Exception e){
			System.out.println(e);
		}
		return null;
	}
	public static String decoding(byte[] reCipher){
		String result = "";
		try{
			int size = reCipher.length;
			
			byte pbPlain[]    = new byte[ 16 ];
			byte reData[][]   = new byte[ size/16 ][16];			
			byte rePlain[]    = new byte[ size ];

			// Decryption		
			int b1=0, b2=0;	
			for(int i=0; i<size; i++){
				b1 = (i / 16);
				b2 = (i % 16);							
				reData[ b1 ][ b2 ] = reCipher[i];				
			}		
			int rf = 0;	
			//System.out.println("\n\n[seed decoding]");
			for(int i=0; i<reData.length; i++){
				seedx.SeedDecrypt(reData[i], pdwRoundKey, pbPlain);	
				for(int j=0; j<pbPlain.length; j++){
					//System.out.print( pbPlain[j] );
					rePlain[rf++] = pbPlain[j];
				}
			}
			String strdec = new String(rePlain);
			//System.out.println("\n\n[base64 decode]\n"+strdec);

			byte[] basedec = Base64.decode(strdec);
			String strresult = new String(basedec);			
			//System.out.println("\n[���]\n"+strresult);
			result = strresult;
			return result;

		}catch(Exception e){
			System.out.println(e);
		}
		return null;
	}
}
