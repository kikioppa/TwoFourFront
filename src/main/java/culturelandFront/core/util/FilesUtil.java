package culturelandFront.core.util;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

import javax.imageio.ImageIO;

import org.springframework.web.multipart.MultipartFile;

import culturelandFront.vo.FileVO;

public class FilesUtil {
	
    /**
     * 폴더 생성
     * @param path
     */
    public static void makeBasePath(String path) {
        File dir = new File(path);

        if (!dir.exists()) {
            dir.mkdirs();
        }
    }

    /**
     * 랜덤함수 가져오기
     * @param
     */
    public static String makeRandomNum() {
    	
    	String RandomNum = "";
		for (int i = 1; i <= 10; i++) {
			RandomNum += (int)(Math.random()*9)+1;
		}
		return RandomNum;
		
    }

    /**
     * 확장자 가져오기
     * @param string  업로드할 파일
     */
    public static String getExtension(String fileName) {
    	
        String extension = "";

        if(fileName==null || "".equals(fileName)) {
        	extension = "";
        } else {
            if(fileName.indexOf(".")>-1) {
            	extension = fileName.substring(fileName.lastIndexOf(".")+1, fileName.length());
            }
        }
		return extension;
		
    }   
    
    /**
     * 확장자를 제외한 파일 이름 가져오기
     * @param fileName
     * @return
     */
    public static String getFileName(String fileName) {
    	
        String name = "";

        if(fileName==null || "".equals(fileName)) {
        	name = "";
        } else {
            if(fileName.indexOf(".")>-1) {
            	name = fileName.substring(0, fileName.lastIndexOf(".") );
            }
        }
		return name;
		
    }   
    
    
    
    /**
     * 일자 가져오기
     * @param v1  첫째자리
     * @param v2  마지막자리 
     */
    public static String getCal(int v1, int v2) {
    	
		Calendar cal = Calendar.getInstance(java.util.Locale.KOREAN);			        
        SimpleDateFormat sfm = new SimpleDateFormat("yyyyMMddHHmmss", java.util.Locale.KOREAN);
        String StrCal = sfm.format(cal.getTime()).toString().substring(v1, v2);
    	
		return StrCal;
		
    }

	/**
	 * 파일 삭제
	 * @return deleteFullFile   지울 풀 경로와 파일명
	 * @throws IOException
	 */

	public static void delFile(String deleteFullFile) throws IOException {
	    try {
	    				File f = new File(deleteFullFile);
	    				if(f.isFile()){
			    					if(f.delete()){
			    					} else{
			    					}
	    					}

	    } catch(Exception e) {
	        System.out.println(e.toString());
	    }
	}
	
	/**
	 * 폴더 삭제
	 * @return deleteFullFolder   지울 풀 경로
	 * @throws IOException
	 */

	public static void delFolder(String deleteFullFolder) throws IOException {
	    try {
		    	File dir = new File(deleteFullFolder);
	
		        if (dir.exists()) {
		            dir.delete();
		        }

	    } catch(Exception e) {
	        System.out.println(e.toString());
	    }
	}

	/**
	 * 파일 copy
	 * @param source   source path
	 * @param dest   destnitation path
	 * @param dir   directory path
	 * @throws IOException
	 */

	public static void copyFile(String source, String dest, String dir) throws IOException {
	    try {
	    				File sochk = new File(source);
	    				makeBasePath(dir);
	    				byte buffer[] = new byte[1024];
	    				FileInputStream so = new FileInputStream(source);
	    				FileOutputStream de = new FileOutputStream(dest);
	    				int n=-1;
	    				
	    				if(sochk.isFile()){
	    							
			    					while((n = so.read(buffer)) != -1){
			    						de.write(buffer,0,n);
			    					}
			    					so.close();
			    					de.close();
	    					}
	    } catch(Exception e) {
	        System.out.println(e.toString());
	    }
	}	
	
	
	 /**
     * 첨부파일 단일 정보 취득
     */
    public static FileVO parseFileInf(MultipartFile file, String KeyStr, int fileKeyParam, String atchFileId, String storePath) throws Exception {
    	
    	FileVO fvo = null;
    	
    	int fileKey = fileKeyParam;

		String storePathString = "";


		String makeFolderName = getCal(0, 6);                //만들어질 경로(년월)					
		String nextPath       = storePath +"/" +  makeFolderName;      //최상경로 다음에 경로		//properties에 data를 포함시킨다.		
		
		String uploadDirectoryPath = "/" +nextPath+ "/";
		String img_path = PropUtil.get("image.web.upload.path");		
		storePathString = img_path + "" + uploadDirectoryPath;

    	
    	String filePath = "";    	
    	
	    String orginFileName = file.getOriginalFilename();

	  //--------------------------------------
		// 원 파일명이 없는 경우 처리
		// (첨부가 되지 않은 input file type)
		//--------------------------------------
		if ("".equals(orginFileName)) {
			return fvo;
		}
		////------------------------------------
		//int index = orginFileName.lastIndexOf(".");
		//String fileName = orginFileName.substring(0, index);
		//String fileExt = orginFileName.substring(index + 1);
		String fileExt = getExtension(orginFileName); // 파일 확장자
		
		//------------------------------------
		//확장자 체크
		//-------------------------------------
		if(badFileExtIsReturnBoolean(fileExt)){
			return fvo;
		}

		String newName = KeyStr + getTimeStamp() + fileKey + '.' +fileExt;
		
		long size = file.getSize();
		long sizeLimit = 30*1024*1024;    //30메가
		if(size > sizeLimit){
			return fvo;
		}
		if (!"".equals(orginFileName)) {
			//filePath = storePathString + File.separator + newName;
			//file.transferTo(new File(EgovWebUtil.filePathBlackList(filePath)));
			makeBasePath(storePathString);
			file.transferTo(new File(storePathString + "/",newName));				
		}
		fvo = new FileVO();
		fvo.setFileExtsn(fileExt);
		fvo.setFileStreCours(uploadDirectoryPath);
		fvo.setFileMg(Long.toString(size));
		fvo.setOrignlFileNm(orginFileName);
		fvo.setStreFileNm(newName);
		fvo.setAtchFileId(atchFileId);
		fvo.setFileSn(String.valueOf(fileKey));
    	
    	return fvo;
    }
    
    /**
     * 첨부파일 단일 정보 취득
     */
    public static FileVO parseFileInfOne(MultipartFile file, String KeyStr, int fileKeyParam, String atchFileId, String storePath) throws Exception {
    	
    	FileVO fvo = null;
    	
    	int fileKey = fileKeyParam;
    	
    	String storePathString = "";
    	
    	
    	String makeFolderName = getCal(0, 6);                //만들어질 경로(년월)					
    	String nextPath       = storePath +"/" +  makeFolderName;      //최상경로 다음에 경로		//properties에 data를 포함시킨다.		
    	
    	String uploadDirectoryPath = "/" +nextPath+ "/";
    	String img_path = PropUtil.get("image.web.upload.path");		
    	storePathString = img_path + "" + uploadDirectoryPath;
    	
    	
    	String filePath = "";    	
    	
    	String orginFileName = file.getOriginalFilename();
    	
    	//--------------------------------------
    	// 원 파일명이 없는 경우 처리
    	// (첨부가 되지 않은 input file type)
    	//--------------------------------------
    	if ("".equals(orginFileName)) {
    		return fvo;
    	}
    	////------------------------------------
    	//int index = orginFileName.lastIndexOf(".");
    	//String fileName = orginFileName.substring(0, index);
    	//String fileExt = orginFileName.substring(index + 1);
    	String fileExt = getExtension(orginFileName); // 파일 확장자
    	
    	//------------------------------------
    	//확장자 체크
    	//-------------------------------------
    	if(badFileExtIsReturnBoolean(fileExt)){
    		return fvo;
    	}
    	
    	String newName = KeyStr + getTimeStamp() + fileKey + '.' +fileExt;
    	
    	long size = file.getSize();
    	long sizeLimit = 30*1024*1024;    //30메가
    	if(size > sizeLimit){
    		return fvo;
    	}
    	if (!"".equals(orginFileName)) {
    		//filePath = storePathString + File.separator + newName;
    		//file.transferTo(new File(EgovWebUtil.filePathBlackList(filePath)));
    		makeBasePath(storePathString+newName);
			file.transferTo(new File(storePathString + "/",newName));		
//    		makeResize(file, storePathString, newName, fileExt);
    	}
    	fvo = new FileVO();
    	fvo.setFileExtsn(fileExt);
    	fvo.setFileStreCours(uploadDirectoryPath);
    	fvo.setFileMg(Long.toString(size));
    	fvo.setOrignlFileNm(orginFileName);
    	fvo.setStreFileNm(newName);
    	fvo.setAtchFileId(atchFileId);
    	fvo.setFileSn(String.valueOf(fileKey));
    	
    	return fvo;
    }
    
	
	/**
	 * 첨부파일에 대한 목록 정보를 취득한다.
	 *
	 * @param files
	 * @return
	 * @throws Exception
	 */
	public static List<FileVO> parseFileInf(Map<String, MultipartFile> files, String KeyStr, int fileKeyParam, String atchFileId, String storePath) throws Exception {
		int fileKey = fileKeyParam;

		String storePathString = "";


		String makeFolderName = getCal(0, 6);                //만들어질 경로(년월)					
		String nextPath       = storePath +"/" +  makeFolderName;      //최상경로 다음에 경로		//properties에 data를 포함시킨다.		
		
		String uploadDirectoryPath = "/" +nextPath+ "/";
		String img_path = PropUtil.get("image.web.upload.path");		
		storePathString = img_path + "" + uploadDirectoryPath;
		
		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		MultipartFile file;
		String filePath = "";
		List<FileVO> result = new ArrayList<FileVO>();
		FileVO fvo;
		while (itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			
			file = entry.getValue();
			//String orginFileName = new String(file.getOriginalFilename().getBytes("8859_1"),"utf-8");
			String orginFileName = file.getOriginalFilename();

			//--------------------------------------
			// 원 파일명이 없는 경우 처리
			// (첨부가 되지 않은 input file type)
			//--------------------------------------
			if ("".equals(orginFileName)) {
				continue;
			}
			////------------------------------------
			//int index = orginFileName.lastIndexOf(".");
			//String fileName = orginFileName.substring(0, index);
			//String fileExt = orginFileName.substring(index + 1);
			String fileExt = getExtension(orginFileName); // 파일 확장자
			
			//------------------------------------
			//확장자 체크
			//-------------------------------------
			if(badFileExtIsReturnBoolean(fileExt)){
				continue;
			}
			
			String newName = KeyStr + getTimeStamp() + fileKey + '.' +fileExt;
			
			long size = file.getSize();
			long sizeLimit = 30*1024*1024;    //30메가
			if(size > sizeLimit){
				continue;
			}
			if (!"".equals(orginFileName)) {
				//filePath = storePathString + File.separator + newName;
				//file.transferTo(new File(EgovWebUtil.filePathBlackList(filePath)));
				makeBasePath(storePathString);
				file.transferTo(new File(storePathString + "/",newName));				
			}
			fvo = new FileVO();
			fvo.setFileExtsn(fileExt);
			fvo.setFileStreCours(uploadDirectoryPath);
			fvo.setFileMg(Long.toString(size));
			fvo.setOrignlFileNm(orginFileName);
			fvo.setStreFileNm(newName);
			fvo.setAtchFileId(atchFileId);
			fvo.setFileSn(String.valueOf(fileKey));

			result.add(fvo);

			fileKey++;
		}

		return result;
	}	
	
	/**
	 * 첨부파일에 대한 목록 정보를 취득한다.(순서대로 저장하기 위한)
	 *
	 * @param files
	 * @return
	 * @throws Exception
	 */
	public static List<FileVO> parseFileSnInf(Map<String, MultipartFile> files, String KeyStr, int fileKeyParam, String atchFileId, String storePath) throws Exception {
		int fileKey = fileKeyParam;

		String storePathString = "";


		String makeFolderName = getCal(0, 6);                //만들어질 경로(년월)					
		String nextPath       = storePath +"/" +  makeFolderName;      //최상경로 다음에 경로		//properties에 data를 포함시킨다.		
		
		String uploadDirectoryPath = "/" +nextPath+ "/";
		String img_path = PropUtil.get("image.web.upload.path");		
		storePathString = img_path + "" + uploadDirectoryPath;
		
		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		MultipartFile file;
		String filePath = "";
		List<FileVO> result = new ArrayList<FileVO>();
		FileVO fvo;
		while (itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			
			file = entry.getValue();
			
			String[] strArr = file.getName().split("_");
					
			//String orginFileName = new String(file.getOriginalFilename().getBytes("8859_1"),"utf-8");
			String orginFileName = file.getOriginalFilename();

			//--------------------------------------
			// 원 파일명이 없는 경우 처리
			// (첨부가 되지 않은 input file type)
			//--------------------------------------
			if ("".equals(orginFileName)) {
				continue;
			}
			////------------------------------------
			//int index = orginFileName.lastIndexOf(".");
			//String fileName = orginFileName.substring(0, index);
			//String fileExt = orginFileName.substring(index + 1);
			String fileExt = getExtension(orginFileName); // 파일 확장자
			
			//------------------------------------
			//확장자 체크
			//-------------------------------------
			if(badFileExtIsReturnBoolean(fileExt)){
				continue;
			}
			
			String newName = KeyStr + getTimeStamp() + fileKey + '.' +fileExt;
			
			long size = file.getSize();
			long sizeLimit = 30*1024*1024;    //30메가
			if(size > sizeLimit){
				continue;
			}
			if (!"".equals(orginFileName)) {
				//filePath = storePathString + File.separator + newName;
				//file.transferTo(new File(EgovWebUtil.filePathBlackList(filePath)));
				makeBasePath(storePathString);
				file.transferTo(new File(storePathString + "/",newName));				
			}
			fvo = new FileVO();
			fvo.setFileExtsn(fileExt);
			fvo.setFileStreCours(uploadDirectoryPath);
			fvo.setFileMg(Long.toString(size));
			fvo.setOrignlFileNm(orginFileName);
			fvo.setStreFileNm(newName);
			fvo.setAtchFileId(atchFileId);
			fvo.setFileSn(strArr[1]);

			result.add(fvo);

			fileKey++;
		}

		return result;
	}
	
	/**
	 * 공통 컴포넌트 utl.fcc 패키지와 Dependency제거를 위해 내부 메서드로 추가 정의함
	 * 응용어플리케이션에서 고유값을 사용하기 위해 시스템에서17자리의TIMESTAMP값을 구하는 기능
	 *
	 * @param
	 * @return Timestamp 값
	 * @see
	 */
	private static String getTimeStamp() {

		String rtnStr = null;

		// 문자열로 변환하기 위한 패턴 설정(년도-월-일 시:분:초:초(자정이후 초))
		String pattern = "yyyyMMddhhmmssSSS";

		SimpleDateFormat sdfCurrent = new SimpleDateFormat(pattern, Locale.KOREA);
		Timestamp ts = new Timestamp(System.currentTimeMillis());

		rtnStr = sdfCurrent.format(ts.getTime());

		return rtnStr;
	}	
	
	 /**
	 * 파일의 확장자를 체크하여 필터링된 확장자를 포함한 파일인 경우에 true를 리턴한다.
	 * @param file
	 * */
    public static boolean badFileExtIsReturnBoolean(String fileExt) {
        final String[] BAD_EXTENSION = { "jsp", "php", "asp", "html", "perl", "exe", "bat", "sh", "zip" };
 
        int len = BAD_EXTENSION.length;
        for (int i = 0; i < len; i++) {
            if (fileExt.equalsIgnoreCase(BAD_EXTENSION[i])) {
                return true; // 불량 확장자가 존재할때..
            }
        }
        return false;
    }	
    
    /**
     * 이미지 리사이징
     * storePathString : 서버경로
     * newName : 파일명
     * fileExt : 파일확장자
     * */
    public static String makeResize(MultipartFile file, String storePathString, String newName, String fileExt) throws IOException{
    	File imageFile = convert(file);
    	
    	BufferedImage originalImage = ImageIO.read(imageFile);
    	
    	int originWidth = originalImage.getWidth();
    	int originHeight = originalImage.getHeight();
    	double checkSize = 1200.0;
    	double divisionData = 0;
    	int newWidth = 0; 
    	int newHeight = 0;
    	
		if(originWidth > originHeight){
			if(originWidth > checkSize){
	    		divisionData = Math.round(checkSize/originWidth * 100d)/100d;
	    		newWidth = (int)(originWidth*divisionData);
	    		newHeight = (int)(originHeight*divisionData);
	    	}else{
	    		newWidth = originWidth;
	    		newHeight = originHeight;
	    	}
		}else{
			if(originHeight > checkSize){
	    		divisionData = Math.round(checkSize/originHeight * 100d)/100d;
	    		newWidth = (int)(originWidth*divisionData);
	    		newHeight = (int)(originHeight*divisionData);
	    	}else{
	    		newWidth = originWidth;
	    		newHeight = originHeight;
	    	}
		}
    	
    	int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
    	
    	BufferedImage resizeImage = resizeImageWithHint(originalImage, type, newWidth, newHeight);
    	 
        ImageIO.write(resizeImage, fileExt, new File(storePathString + "/" + newName));
        imageFile.delete();
    	return "";
    }
    
    private static BufferedImage resizeImageWithHint(BufferedImage originalImage, int type, int newWidth, int newHeight) {
    	 
        BufferedImage resizedImage = new BufferedImage(newWidth, newHeight, type);
        Graphics2D g = resizedImage.createGraphics();
        g.drawImage(originalImage, 0, 0, newWidth, newHeight, null);
        g.dispose();
        g.setComposite(AlphaComposite.Src);
     
        g.setRenderingHint(RenderingHints.KEY_INTERPOLATION,
            RenderingHints.VALUE_INTERPOLATION_BILINEAR);
        g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
        g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
     
        return resizedImage;
      }

    public static File convert(MultipartFile file) throws IOException
    {    
        File convFile = new File(file.getOriginalFilename());
        convFile.createNewFile(); 
        FileOutputStream fos = new FileOutputStream(convFile); 
        fos.write(file.getBytes());
        fos.close(); 
        return convFile;
    }
}
