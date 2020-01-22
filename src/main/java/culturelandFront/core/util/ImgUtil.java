package culturelandFront.core.util;


import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import javax.imageio.ImageIO;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

import culturelandFront.vo.ImgVO;



public class ImgUtil {
	
	private static final Logger logger = Logger.getLogger(ImgUtil.class);
	
	
	public static final int SAME = -1;
	public static final int RATIO = 0;
	
	
	
	public static void resize(File src, File dest, int width, int height ) throws IOException {
		FileInputStream srcls = null;
		try{
			srcls = new FileInputStream(src);
			ImgUtil.resize(srcls,dest,width, height);
		}
		finally{
			if(srcls != null) try{
				srcls.close();
			}
			catch(IOException ex){}
			
		}
	}

	
	public static void resize(InputStream src, File dest, int width, int height) throws IOException {
		BufferedImage srcImg = ImageIO.read(src);
		int srcWidth = srcImg.getWidth();
		int srcHeight = srcImg.getHeight();
		int destWidth = -1, destHeight = -1;
		
		if(width ==SAME){
			destWidth = srcWidth;
		}
		else if(width > 0){
			destWidth = width;
		}
		if(height ==SAME){
			destHeight = srcHeight;
		}
		else if(height > 0){
			destHeight = height;
		}
		
		if(width ==RATIO && height ==RATIO){
			destWidth = srcWidth;
			destHeight = srcHeight;
		} else if(width ==RATIO){
			double ratio = ((double)destHeight) / ((double)srcHeight);
			destWidth = (int)((double)srcWidth * ratio);
		} else if(height ==RATIO){
			double ratio = ((double)destWidth) / ((double)srcWidth);
			destHeight = (int)((double)srcHeight * ratio);
		}

		BufferedImage destImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g = destImg.createGraphics();
		Image scaled = srcImg.getScaledInstance((int)destWidth, (int)destHeight, Image.SCALE_SMOOTH);
		g.setBackground(Color.white);
		
		g.drawImage(scaled,  0,0,destWidth, destHeight, null);
		ImageIO.write(destImg,  "jpg",dest);
	}
	
	
	
	
	

	

	/**
	 * upload
	 * @param root_dir: 			/usedcar
	 * @param editor_seper: fcategory, option
	 * car and board is different to return info
	 */
	public static ImgVO car_uploadFile(String root_dir
													,String editor_seper
													,MultipartFile upfile
														
						) throws Exception {
	
		ImgVO imgvo = new ImgVO();
		String originfileName = upfile.getOriginalFilename();
		
		String makeFolderName = FilesUtil.getCal(0, 6);                //만들어질 경로(년월)					
		String nextPath       = editor_seper +"/" +  makeFolderName;      //최상경로 다음에 경로		//properties에 data를 포함시킨다.
		String extension      = FilesUtil.getExtension(originfileName);
		String fileName	= FilesUtil.getCal(0, 14) + "_" + FilesUtil.makeRandomNum();
		String RandomFileName = fileName + '.' + extension; // 변경된 파일 이름
		
		
		String uploadDirectoryPath = nextPath;
		String img_path = PropUtil.get("image.web.upload.path");
		
		imgvo.setMakefoler(makeFolderName);
		imgvo.setImg_name(fileName);
		imgvo.setImg_ext(extension);
		imgvo.setImg_path(img_path + "/" + uploadDirectoryPath);
		imgvo.setImg_url(PropUtil.get("image.web.upload.url") + "/"+uploadDirectoryPath+"/"+RandomFileName);
		imgvo.setImg_folder(uploadDirectoryPath);
		
		try{
			FilesUtil.makeBasePath(img_path + "/" + uploadDirectoryPath + "/"+RandomFileName);
			upfile.transferTo(new File(img_path + "/" + uploadDirectoryPath + "/",RandomFileName));

		} catch(Exception e){
			logger.error(" >>>>>> err:" + e.toString());
		}
		
		
		try{
			String imgPath = imgvo.getImg_path() + "/"  + imgvo.getImg_name() + "." + imgvo.getImg_ext();
			BufferedImage img = ImageIO.read(new File(imgPath));
		 	int imgW  = img.getWidth();
			imgvo.setImg_width(String.valueOf(imgW));
		}catch(Exception e){
			System.out.println(e);
		}
		
		
		return imgvo;
	}
	
	/**
	 * upload
	 * @param root_dir:
	 */
	public static ImgVO editor_uploadFile(String root_dir
													,String editor_seper
													,MultipartFile upfile
														
						) throws Exception {
	
		ImgVO imgvo = new ImgVO();
		String originfileName = upfile.getOriginalFilename();
		
		String makeFolderName = FilesUtil.getCal(0, 6);                //만들어질 경로(년월)					
		String nextPath       = editor_seper +"/" +  makeFolderName;      //최상경로 다음에 경로		//properties에 data를 포함시킨다.
		String extension      = FilesUtil.getExtension(originfileName);
		String fileName	= FilesUtil.getCal(0, 14) + "_" + FilesUtil.makeRandomNum();
		String RandomFileName = fileName + '.' + extension; // 변경된 파일 이름
		
		
		String uploadDirectoryPath = nextPath;
		String img_path = PropUtil.get("image.web.upload.path");
		
		imgvo.setMakefoler(makeFolderName);
		imgvo.setImg_name(fileName);
		imgvo.setImg_ext(extension);
		imgvo.setImg_path(img_path + "/" + uploadDirectoryPath);
		imgvo.setImg_url(PropUtil.get("image.web.upload.url") + "/"+uploadDirectoryPath+"/"+RandomFileName);
		imgvo.setImg_folder(uploadDirectoryPath);
		
		try{
			FilesUtil.makeBasePath(img_path + "/" + uploadDirectoryPath + "/"+RandomFileName);
			upfile.transferTo(new File(img_path + "/" + uploadDirectoryPath + "/",RandomFileName));

		} catch(Exception e){
			logger.error(" >>>>>> err:" + e.toString());
		}
		
		
		try{
			String imgPath = imgvo.getImg_path() + "/"  + imgvo.getImg_name() + "." + imgvo.getImg_ext();
			BufferedImage img = ImageIO.read(new File(imgPath));
		 	int imgW  = img.getWidth();
			imgvo.setImg_width(String.valueOf(imgW));
		}catch(Exception e){
			System.out.println(e);
		}
		
		
		return imgvo;
	}
	
	/**
	 * delete car image
	 * @param	filename: file path
	 */
	public static void delCarImg(String filename) throws Exception {
					try{
						String img_path = PropUtil.get("image.web.upload.path");
						//삭제
						FilesUtil.delFile(img_path + "/car/"+ filename + "_1" + ".jpg");			//large img
						FilesUtil.delFile(img_path + "/car/"+ filename + "_2" + ".jpg");			//상세페이지 큰이미지
						FilesUtil.delFile(img_path + "/car/"+ filename + "_3" + ".jpg");			//서브메인
						FilesUtil.delFile(img_path + "/car/"+ filename + "_4" + ".jpg");			//thumb, 서브리스트(144, 96)
						FilesUtil.delFile(img_path + "/car/"+ filename + "_5" + ".jpg");			//thumb, 서브리스트(144, 96)
						
						//replication1 delete
						img_path = img_path.replace("upload", "upload2");
						FilesUtil.delFile(img_path + "/car/"+ filename + "_1" + ".jpg");		//large img
						FilesUtil.delFile(img_path + "/car/"+ filename + "_2" + ".jpg");		//large img
						FilesUtil.delFile(img_path + "/car/"+ filename + "_3" + ".jpg");		//large img
						FilesUtil.delFile(img_path + "/car/"+ filename + "_4" + ".jpg");		//large img
						FilesUtil.delFile(img_path + "/car/"+ filename + "_5" + ".jpg");		//large img
						
						logger.debug(">>>>>>>>>>>>>>>>>>>>>>>>>> " + img_path + "/car/"  +filename + "_1" + ".jpg");
						
				}catch(Exception e)
				{
					logger.error(e.toString());
				}
	}
	
	/**
	 * 딜러 이미지 업로드 
	 * @param root_dir
	 * @param editor_seper
	 * @param upfile
	 * @return
	 */
	public static String deler_uploadFile(String root_dir
							,String editor_seper
							,MultipartFile upfile) throws Exception {	
		//int isSuccess = 0;
		logger.debug(" >>>>>> in upload()");
		String originfileName = upfile.getOriginalFilename();
		
		String makeFolderName = FilesUtil.getCal(0, 6);                //만들어질 경로(년월)					
		String nextPath       = root_dir +"/" +  makeFolderName;      //최상경로 다음에 경로		//properties에 data를 포함시킨다.
		String extension      = FilesUtil.getExtension(originfileName);
		
		String RandomFileName = FilesUtil.getCal(0, 14) + "_" + FilesUtil.makeRandomNum() + '.' + extension; // 변경된 파일 이름
		
		
		String uploadDirectoryPath = nextPath;
		String img_url = PropUtil.get("image.web.upload.url") + "/" + uploadDirectoryPath + "/"+RandomFileName;
		String img_path = PropUtil.get("image.web.upload.path");
		try{
			FilesUtil.makeBasePath(img_path + "/" + uploadDirectoryPath + "/"+RandomFileName);
			upfile.transferTo(new File(img_path + "/" + uploadDirectoryPath + "/",RandomFileName));
		} catch(Exception e){
			logger.error(" >>>>>> err:" + e.toString());
		}
		return img_url;
	}
	
	
	/**
	 * 딜러 이미지 업로드 삭제
	 * @param	filename: file명
	 */
	public static void delDelerImg(String filename) throws Exception {
			try{
				String img_path = PropUtil.get("image.web.upload.path");
				filename = filename.replace("/upload", "");
				//삭제
				FilesUtil.delFile(img_path+""+filename );			//large img
				
				logger.debug(">>>>>>>>>>>>>>>>>>>>>>>>>> " + img_path +""+filename);
				
		}catch(Exception e)
		{
			logger.error(e.toString());
		}
	}	
	
	/**
	 * 차량 옵션 이미지
	 * @param root_dir
	 * @param editor_seper
	 * @param upfile
	 * @param on_off
	 * @return
	 */
	public static String uploadFile(String root_dir
															,String editor_seper
															,MultipartFile upfile
															,String on_off){
		//FilesUtil filesUtil = new FilesUtil();
		logger.debug(" >>>>>> in upload()");
		String originfileName = upfile.getOriginalFilename();
		
		String makeFolderName = FilesUtil.getCal(0, 6);                //만들어질 경로(년월)					
		String nextPath       = root_dir + "/" + editor_seper +"/" +  makeFolderName;      //최상경로 다음에 경로		//properties에 data를 포함시킨다.
		String extension      = FilesUtil.getExtension(originfileName);
		
		String RandomFileName = FilesUtil.getCal(0, 14) + "_" + FilesUtil.makeRandomNum() + on_off + '.' + extension; // 변경된 파일 이름
		
		
		String uploadDirectoryPath = nextPath;
		String img_url = PropUtil.get("image.web.upload.url") + "/" + uploadDirectoryPath + "/"+RandomFileName;
		String img_path = PropUtil.get("image.web.upload.path");
		
		try{
			FilesUtil.makeBasePath(img_path + "/" + uploadDirectoryPath + "/"+RandomFileName);
			upfile.transferTo(new File(img_path + "/" + uploadDirectoryPath + "/",RandomFileName));
		} catch(Exception e){
			logger.error(" >>>>>> err:" + e.toString());
		}
		return img_url;
	}	
	
	/**
	 *  이미지 업로드 삭제
	 * @param	filename: file명
	 */
	public static void delImg(String filename) throws Exception {
			try{
				String img_path = PropUtil.get("image.web.upload.path");
//				filename = filename.replace("/upload", "");
				//삭제
				FilesUtil.delFile(img_path+""+filename );			//large img
				
				logger.debug(">>>>>>> in delete()  " + img_path +""+filename);
				
				
		}catch(Exception e)
		{
			logger.error(e.toString());
		}
	}

}
