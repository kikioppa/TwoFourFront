package culturelandFront.controller.common;

import java.net.URLDecoder;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import culturelandFront.core.abstr.NdnAbstractController;
import culturelandFront.core.util.ImgUtil;
import culturelandFront.core.util.PropUtil;
import culturelandFront.vo.ImgVO;

/**
 * 게시판 공통 컨트롤러
 * 
 *
 */
@Controller
public class BoardController extends NdnAbstractController {

	private final Logger logger = Logger.getLogger(this.getClass());	
	/**
	 * 에디터 파일 업로드
	 *  
	 */
	@RequestMapping(value="/editor/uploadImg.do")
	public String uploadImg( 
						ModelMap model,  
						HttpSession session, 
						HttpServletRequest request,
			 			@RequestParam Map param,
			 			@RequestParam(value = "editor_seper", defaultValue = "" ) String editor_seper	
					) throws Exception{
		
		
			
		MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest)request;
		Iterator fileNameIt = mpRequest.getFileNames();
		ImgVO imgvo = new ImgVO();
		
		if ( !"".equals(editor_seper)){
			editor_seper = "/"+editor_seper;
		}
		logger.debug(" <!--------   editor fileupload process start!!! ------- " );
		while(fileNameIt.hasNext()) {		
			imgvo = new ImgVO();
			MultipartFile mfile = mpRequest.getFile((String)fileNameIt.next());
			
			if(mfile.getSize()>0) {

				// 이미지 업로드
				imgvo = ImgUtil.editor_uploadFile(PropUtil.get("image.web.upload.path"), "editor"+editor_seper, mfile );
				
				logger.debug(imgvo.getImg_url());
			}
		}
		
		logger.debug("-------- editor fileupload process end  ------------->" );
		
		model.addAttribute("imgvo" ,imgvo );
		
		return "/common/editor/imageuploaded";		
	}
	
	/**
	 * 에디터 파일 업로드
	 *  
	 */
	@RequestMapping(value="/editor/smartUploadImg.do")
	public void smartUploadImg( 
						ModelMap model,  
						HttpSession session, 
						HttpServletRequest request,
			 			@RequestParam Map param,
			 			HttpServletResponse response,
			 			@RequestParam("callback_func") String callbackFunc,
						@RequestParam("callback") String callback,
			 			@RequestParam(value = "editor_seper", defaultValue = "" ) String editor_seper	
					) throws Exception{
		
		
			
		MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest)request;
		Iterator fileNameIt = mpRequest.getFileNames();
		ImgVO imgvo = new ImgVO();
		
		if ( !"".equals(editor_seper)){
			editor_seper = "/"+editor_seper;
		}
		logger.debug(" <!--------   editor fileupload process start!!! ------- " );
		while(fileNameIt.hasNext()) {		
			imgvo = new ImgVO();
			MultipartFile mfile = mpRequest.getFile((String)fileNameIt.next());
			
			if(mfile.getSize()>0) {

				// 이미지 업로드
				imgvo = ImgUtil.editor_uploadFile(PropUtil.get("image.web.upload.path"), "editor"+editor_seper, mfile );
				
				logger.debug(imgvo.getImg_url());
			}
		}
		
		logger.debug("-------- editor fileupload process end  ------------->" );
		
		model.addAttribute("imgvo" ,imgvo );
		System.out.println("PropUtil : " + imgvo.getImg_url());
		response.sendRedirect("/smarteditor/photo_uploader/popup/callback.html?bNewLine=true&sFileName="+ URLDecoder.decode(imgvo.getImg_name())
				+"&sFileURL="+ URLDecoder.decode(imgvo.getImg_url())+"&callback_func="+callbackFunc);
		
//		return "/common/editor/imageuploaded";		
	}
}
