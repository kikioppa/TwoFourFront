package culturelandFront.controller.common;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.mobile.device.Device;
//import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import culturelandFront.core.util.NdnUtil;
import culturelandFront.core.util.PropUtil;
import culturelandFront.service.FileMngService;
import culturelandFront.vo.FileVO;

/**
 * 파일 조회, 삭제, 다운로드 처리를 위한 컨트롤러 클래스
 * @author
 */
@Controller
public class FileMngController {
	
	 
	 

	@Resource
	private FileMngService fileService;

    private static final Logger LOGGER = Logger.getLogger(FileMngController.class.getName());

    /**
     * 첨부파일에 대한 목록을 조회한다.
     * 
     * @param fileVO
     * @param atchFileId
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmm/selectFileInfs.do")
    public String selectFileInfs( 
    		@RequestParam Map<String, Object> param,
    		ModelMap model) throws Exception {
    	
    	String atchFileId = NdnUtil.checkNull(param.get("param_atchFileId"));
    	String fileSn = NdnUtil.checkNull(param.get("fileSn"));
    	
    	
    	if ( !"".equals(atchFileId)){
    		
	    	FileVO fileVO = new FileVO();
	    	
	    	if ( !"".equals(fileSn)){
	    		fileVO.setFileSn(fileSn);
	    	}
			fileVO.setAtchFileId(atchFileId);
			List<FileVO> result = fileService.selectFileInfs(fileVO);
			
	    	
		
			model.addAttribute("fileList", result);
			model.addAttribute("fileListCnt", result.size());
			model.addAttribute("atchFileId", atchFileId);
		
    	}
    	
    	model.addAttribute("updateFlag", "N");
		model.addAttribute("param", param);
		return "common/fileList";
    }
    
    
    /**
     * 첨부파일에 대한 목록을 조회한다.
     * 
     * @param fileVO
     * @param atchFileId
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping({"/cmm/selectFileInfs2.do","/m/cmm/selectFileInfs2.do"})
    public String selectFileInfs2( 
    		Device device,
    		@RequestParam Map<String, Object> param,
    		ModelMap model) throws Exception {
    	
    	String atchFileId = NdnUtil.checkNull(param.get("param_atchFileId"));
    	String fileSn = NdnUtil.checkNull(param.get("fileSn"));
    	String beginIndex = NdnUtil.checkNull(param.get("param_beginIndex"));
    	
    	
    	if ( !"".equals(atchFileId)){
    		
	    	FileVO fileVO = new FileVO();
	    	
	    	if ( !"".equals(fileSn)){
	    		fileVO.setFileSn(fileSn);
	    	}
			fileVO.setAtchFileId(atchFileId);
			List<FileVO> result = fileService.selectFileInfs(fileVO);
			
	    	
		
			model.addAttribute("fileList", result);
			model.addAttribute("fileListCnt", result.size());
			model.addAttribute("atchFileId", atchFileId);
			model.addAttribute("beginIndex", beginIndex);
		
    	}
    	
    	model.addAttribute("updateFlag", "N");
		model.addAttribute("param", param);
		model.addAttribute("mobile", device.isMobile()?"Y":"N");
		return "common/fileList2";
    }

    
    /**
     *  모바일 첨부파일에 대한 목록을 조회한다.
     * 
     * @param fileVO
     * @param atchFileId
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/m/cmm/selectFileInfs.do")
    public String mobileSelectFileInfs( 
    		@RequestParam Map<String, Object> param,
    		ModelMap model) throws Exception {

    	String atchFileId = NdnUtil.checkNull(param.get("param_atchFileId"));
    	String fileSn = NdnUtil.checkNull(param.get("fileSn"));
    	
    	if ( !"".equals(atchFileId)){
    		
	    	FileVO fileVO = new FileVO();
	    	
	    	if ( !"".equals(fileSn)){
	    		fileVO.setFileSn(fileSn);
	    	}
			fileVO.setAtchFileId(atchFileId);
			List<FileVO> result = fileService.selectFileInfs(fileVO);
			
	    	
		
			model.addAttribute("fileList", result);
			model.addAttribute("fileListCnt", result.size());
			model.addAttribute("atchFileId", atchFileId);
		
    	}
    	
    	model.addAttribute("updateFlag", "N");
		model.addAttribute("param", param);

		return "common/mobile_fileList";
    }    
    
    /**
     * 첨부파일 변경을 위한 수정페이지로 이동한다.
     * 
     * @param fileVO
     * @param atchFileId
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmm/selectFileInfsForUpdate.do")
    public String selectFileInfsForUpdate(
    			@RequestParam Map<String, Object> param,
    			ModelMap model) throws Exception {
    	
    	
    	String atchFileId = NdnUtil.checkNull(param.get("param_atchFileId"));
    	String fileSn = NdnUtil.checkNull(param.get("fileSn"));
    	String thumbnail = NdnUtil.checkNull(param.get("thumbnail"));

    	if ( !"".equals(atchFileId)){
    		
	    	FileVO fileVO = new FileVO();
	    	
	    	if ( fileSn!= null && !"".equals(fileSn)){
	    		fileVO.setFileSn(fileSn);
	    	}
			fileVO.setAtchFileId(atchFileId);
		
			List<FileVO> result = fileService.selectFileInfs(fileVO);
			
			model.addAttribute("fileList", result);
			model.addAttribute("fileListCnt", result.size());
			model.addAttribute("atchFileId", atchFileId);			
			
    	}
    	
    	model.addAttribute("updateFlag", "Y");
    	model.addAttribute("thumbnail", thumbnail);
		model.addAttribute("fileSn", fileSn);
		model.addAttribute("param", param);
		
		return "common/fileList";
    }
    
    /**
     * 첨부파일 변경을 위한 수정페이지로 이동한다.(제품전용)
     * 
     * @param fileVO
     * @param atchFileId
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmm/selectCodeFileInfsForUpdate.do")
    public String selectCodeFileInfsForUpdate(
    			@RequestParam Map<String, Object> param,
    			ModelMap model) throws Exception {
    	
    	
    	String atchFileId = NdnUtil.checkNull(param.get("param_atchFileId"));
    	String fileSn = NdnUtil.checkNull(param.get("fileSn"));
    	String thumbnail = NdnUtil.checkNull(param.get("thumbnail"));
//    	System.out.println("fileSn : " + fileSn + "   file param : " + param.toString());
    	if ( !"".equals(atchFileId)){
	    	
	    	FileVO fileVO = new FileVO();
	    	
	    	if ( fileSn!= null && !"".equals(fileSn)){
	    		fileVO.setFileSn(fileSn);
	    	}
			fileVO.setAtchFileId(atchFileId);
		
			List<FileVO> result = fileService.selectFileInfs(fileVO);
			
			model.addAttribute("fileList", result);
			model.addAttribute("fileListCnt", result.size());
			model.addAttribute("atchFileId", atchFileId);			
			
    	}
    	
    	model.addAttribute("updateFlag", "Y");
    	model.addAttribute("thumbnail", thumbnail);
		model.addAttribute("fileSn", fileSn);
		model.addAttribute("param", param);
		
		return "common/fileCodeList";
    }
    
    /**
     * 첨부파일 변경을 위한 수정페이지로 이동한다.
     * 
     * @param fileVO
     * @param atchFileId
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/m/cmm/selectFileInfsForUpdate.do")
    public String mobileSelectFileInfsForUpdate(
    			@RequestParam Map<String, Object> param,
    			ModelMap model) throws Exception {
    	
    	
    	String atchFileId = NdnUtil.checkNull(param.get("param_atchFileId"));
    	String fileSn = NdnUtil.checkNull(param.get("fileSn"));
    	String thumbnail = NdnUtil.checkNull(param.get("thumbnail"));

    	if ( !"".equals(atchFileId)){
	    	
	    	FileVO fileVO = new FileVO();
	    	
	    	if ( fileSn!= null && !"".equals(fileSn)){
	    		fileVO.setFileSn(fileSn);
	    	}
			fileVO.setAtchFileId(atchFileId);
		
			List<FileVO> result = fileService.selectFileInfs(fileVO);
			
			model.addAttribute("fileList", result);
			model.addAttribute("fileListCnt", result.size());
			model.addAttribute("atchFileId", atchFileId);			
			
    	}
    	
    	model.addAttribute("updateFlag", "Y");
    	model.addAttribute("thumbnail", thumbnail);
		model.addAttribute("fileSn", fileSn);
		model.addAttribute("param", param);
		
		return "common/mobile_fileList";
    }    

    /**
     * 첨부파일에 대한 삭제를 처리한다.
     * 
     * @param fileVO
     * @param returnUrl
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmm/deleteFileInfs.do")
    public String deleteFileInf(
    		@RequestParam Map<String, Object> param,
    		@RequestParam("returnUrl") String returnUrl,
		    HttpServletRequest request,
		    RedirectAttributes redirectAttr,
		    ModelMap model) throws Exception {
    	
    	String atchFileId = NdnUtil.checkNull(param.get("atchFileId"));
    	String fileSn = NdnUtil.checkNull(param.get("fileSn"));
    	
    	String fileStreCours = NdnUtil.checkNull(param.get("fileStreCours"));
    	String streFileNm = NdnUtil.checkNull(param.get("streFileNm"));
    	
    	FileVO fileVO = new FileVO();
    	if ( !"".equals(fileSn)){
    		fileVO.setFileSn(fileSn);
    	}
    	
		fileVO.setAtchFileId(atchFileId);
//		fileVO.setFileStreCours(PropUtil.get("image.web.upload.path")+""+fileStreCours);
		fileVO.setFileStreCours(fileStreCours);
		fileVO.setStreFileNm(streFileNm);

		fileService.deleteFileInf(fileVO);
		//--------------------------------------------
		// contextRoot가 있는 경우 제외 시켜야 함
		//--------------------------------------------
		////return "forward:/cmm/fms/selectFileInfs.do";
		//return "forward:" + returnUrl;
    	Map<String, Object> map = new HashMap<String,Object>();
    	map.put("title", request.getParameter("title"));
    	map.put("divide", request.getParameter("divide"));
    	map.put("contents", request.getParameter("contents"));
    	redirectAttr.addFlashAttribute("param", map);
    	

		String gubun = (String) param.get("gubun");
		if(gubun != null && !"".equals(gubun)) {
			gubun = "&gubun="+request.getParameter("gubun");
		} else {
			gubun = "";
		}
		
		
		if ("".equals(request.getContextPath()) || "/".equals(request.getContextPath())) {
		    return "redirect:" + returnUrl+"?seq="+request.getParameter("seq") + gubun;
		}
		
		
		if (returnUrl.startsWith(request.getContextPath())) {
		    return "redirect:" + returnUrl.substring(returnUrl.indexOf("/", 1))+"?seq="+request.getParameter("seq") + gubun;
		} else {
		    return "redirect:" + returnUrl +"?seq="+request.getParameter("seq") + gubun;
		}
		////------------------------------------------
    }

    /**
     * 첨부파일에 대한 삭제를 처리한다.(추가)
     * 
     * @param fileVO
     * @param returnUrl
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmm/deleteCodeFileInfs.do")
    public String deleteCodeFileInfs(
    		@RequestParam Map<String, Object> param,
    		@RequestParam("returnUrl") String returnUrl,
		    HttpServletRequest request,
		    RedirectAttributes redirectAttr,
		    ModelMap model) throws Exception {
    	
    	String atchFileId = NdnUtil.checkNull(param.get("atchFileId"));
    	String fileSn = NdnUtil.checkNull(param.get("fileSn"));
    	
    	String fileStreCours = NdnUtil.checkNull(param.get("fileStreCours"));
    	String streFileNm = NdnUtil.checkNull(param.get("streFileNm"));
    	
    	FileVO fileVO = new FileVO();
    	if ( !"".equals(fileSn)){
    		fileVO.setFileSn(fileSn);
    	}
    	
		fileVO.setAtchFileId(atchFileId);
		fileVO.setFileStreCours(PropUtil.get("image.web.upload.path")+""+fileStreCours);
		fileVO.setStreFileNm(streFileNm);

		fileService.deleteFileInf(fileVO);
		//--------------------------------------------
		// contextRoot가 있는 경우 제외 시켜야 함
		//--------------------------------------------
		////return "forward:/cmm/fms/selectFileInfs.do";
		//return "forward:" + returnUrl;
    	Map<String, Object> map = new HashMap<String,Object>();
    	map.put("title", request.getParameter("title"));
    	map.put("divide", request.getParameter("divide"));
    	map.put("contents", request.getParameter("contents"));
    	redirectAttr.addFlashAttribute("param", map);
		if ("".equals(request.getContextPath()) || "/".equals(request.getContextPath())) {
		    return "redirect:" + returnUrl;
		}
		
		if (returnUrl.startsWith(request.getContextPath())) {
		    return "redirect:" + returnUrl.substring(returnUrl.indexOf("/", 1));
		} else {
		    return "redirect:" + returnUrl;
		}
		////------------------------------------------
    }
    
    /**
     * 이미지 첨부파일에 대한 목록을 조회한다.
     * 
     * @param fileVO
     * @param atchFileId
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmm/selectImageFileInfs.do")
    public String selectImageFileInfs(
    			@RequestParam Map<String, Object> param,
    			ModelMap model) throws Exception {
    	
    	String atchFileId = NdnUtil.checkNull(param.get("param_atchFileId"));
    	String fileSn = NdnUtil.checkNull(param.get("fileSn"));

    	
    	if ( !"".equals(atchFileId)){
	    	
	    	FileVO fileVO = new FileVO();
	    	if ( !"".equals(fileSn)){
	    		fileVO.setFileSn(fileSn);
	    	}
	    	
			fileVO.setAtchFileId(atchFileId);
			
			List<FileVO> result = fileService.selectImageFileList(fileVO);
			
			model.addAttribute("fileList", result);
			model.addAttribute("atchFileId", atchFileId);
			
    	}
		
    	model.addAttribute("fileSn", fileSn);
		model.addAttribute("param", param);
	
		return "common/imgFileList";
    }
    
    
    
    
    /**
	 * 첨부된 이미지에 대한 미리보기 기능을 제공한다.
	 *
	 * @param atchFileId
	 * @param fileSn
	 * @param sessionVO
	 * @param model
	 * @param response
	 * @throws Exception
	 */
	
	@RequestMapping("/cmm/getImage.do")
	public void getImageInf( ModelMap model, @RequestParam Map<String, Object> commandMap, HttpServletResponse response) throws Exception {

			String atchFileId = NdnUtil.checkNull(commandMap.get("atchFileId") , "");
			String fileSn =NdnUtil.checkNull(commandMap.get("fileSn")  , "");
			String defaultPath = NdnUtil.checkNull(commandMap.get("default") , "no-image.jpg" );
			
					
			FileVO fvo = new FileVO();
		
		    try{
		    	  
						
					FileVO vo = new FileVO();
					vo.setAtchFileId(atchFileId);
					vo.setFileSn(fileSn);
			
					fvo = fileService.selectFileInf(vo);
					
		    }catch(Exception e){
		    	
		    }
		    
		    
		    if ( "".equals(atchFileId) || fvo == null ||  "".equals(fvo.getFileStreCours())){
		    	fvo = new FileVO();
		    	fvo.setFileStreCours("default");
		    	fvo.setStreFileNm(defaultPath);
		    }
					
					
			File file = new File(PropUtil.get("image.web.upload.path")+"/"+fvo.getFileStreCours(), fvo.getStreFileNm());
			
			FileInputStream fis = null;
			new FileInputStream(file);
	
			BufferedInputStream in = null;
			ByteArrayOutputStream bStream = null;
			try {
				fis = new FileInputStream(file);
				in = new BufferedInputStream(fis);
				bStream = new ByteArrayOutputStream();
				int imgByte;
				while ((imgByte = in.read()) != -1) {
					bStream.write(imgByte);
				}
	
				String type = "";
	
				if (fvo.getFileExtsn() != null && !"".equals(fvo.getFileExtsn())) {
					
					if ("jpg".equals(fvo.getFileExtsn().toLowerCase()) ||  "jpeg".equals(fvo.getFileExtsn().toLowerCase())) {
						type = "image/jpeg";
						
					}else if ("bmp".equals(fvo.getFileExtsn().toLowerCase()) ||  "gif".equals(fvo.getFileExtsn().toLowerCase())   ||  "png".equals(fvo.getFileExtsn().toLowerCase())  ) {
						type = "image/" + fvo.getFileExtsn().toLowerCase();
						
						
					}else if("pdf".equals(fvo.getFileExtsn().toLowerCase())){	// pdf는 pdf로 보기
						type="application/pdf";
						response.setHeader("Cache-Control", "cache, must-revalidate");
				        response.setHeader("Pragma", "public");
				    
					}else{ //기타의 경우는 파일 다운으로
						response.sendRedirect("/cmm/FileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn);
					}

	
				} else {
					LOGGER.debug("Image fileType is null.");
				}
	
				response.setHeader("Content-Type", type);
				response.setContentLength(bStream.size());
				bStream.writeTo(response.getOutputStream());
				response.getOutputStream().flush();
				response.getOutputStream().close();
	
			} catch (Exception e) {
				LOGGER.debug("{}", e);
			} finally {
				if (bStream != null) {
					try {
						bStream.close();
					} catch (Exception est) {
						LOGGER.debug("IGNORED: {}", est);
					}
				}
				if (in != null) {
					try {
						in.close();
					} catch (Exception ei) {
						LOGGER.debug("IGNORED: {}", ei);
					}
				}
				if (fis != null) {
					try {
						fis.close();
					} catch (Exception efis) {
						LOGGER.debug("IGNORED: {}", efis);
					}
				}
			}
	


		
		
	}
		
		
}
