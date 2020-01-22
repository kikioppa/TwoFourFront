package culturelandFront.dao;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import culturelandFront.core.abstr.NdnAbstractMapper;
import culturelandFront.core.util.ImgUtil;
import culturelandFront.vo.FileVO;

/**
 * @Class Name : FileManageDAO.java
 * @Description : 파일정보 관리를 위한 데이터 처리 클래스
 */
@Repository("fileManageDAO") 
public class FileManageDAO extends NdnAbstractMapper {

	/**
     * 파일 생성 최대 구분자를 가져온다.
     *
     * @param fvo
     * @return
     * @throws Exception
     */
    public int getNextStringId(Map param) throws Exception{
    	
    	//update("file.getAddId", param);
		return (Integer) selectOne("file.getNextStringId", param);		
    }	
	
	/**
	 * 여러 개의 파일에 대한 정보(속성 및 상세)를 등록한다.
	 *
	 * @param fileList
	 * @return
	 * @throws Exception
	 */
	public String insertFileInfs(List<?> fileList) throws Exception {
		FileVO vo = (FileVO) fileList.get(0);
		String atchFileId = vo.getAtchFileId();

		insert("file.insertFileMaster", vo);

		Iterator<?> iter = fileList.iterator();
		while (iter.hasNext()) {
			vo = (FileVO) iter.next();

			insert("file.insertFileDetail", vo);
		}

		return atchFileId;
	}

	/**
	 * 하나의 파일에 대한 정보(속성 및 상세)를 등록한다.
	 *
	 * @param vo
	 * @throws Exception
	 */
	public void insertFileInf(FileVO vo) throws Exception {
		insert("file.insertFileMaster", vo);
		insert("file.insertFileDetail", vo);
	}

	/**
	 * 여러 개의 파일에 대한 정보(속성 및 상세)를 수정한다.
	 *
	 * @param fileList
	 * @throws Exception
	 */
	public void updateFileInfs(List<?> fileList) throws Exception {
		FileVO vo;
		Iterator<?> iter = fileList.iterator();
		while (iter.hasNext()) {
			vo = (FileVO) iter.next();

			delete("file.deleteFileDetail", vo);
			
			insert("file.insertFileDetail", vo);
		}
	}
	
	/**
	 * 썸네일용 
	 * 
	 * @param fileList
	 * @return
	 * @throws IOException 
	 */
	public int updateThumb(List<FileVO> fileList) throws IOException {
		int result = 0;
		FileVO vo;
		FileVO voTmp;
		Iterator<?> iter = fileList.iterator();
		while (iter.hasNext()) {
			vo = (FileVO) iter.next();
			voTmp = vo;
			
			// 기존 DB 가져와서 파일 삭제
			List tmpList = (List<FileVO>) list("file.selectFileList", vo);
			Iterator<?> iterTmp = tmpList.iterator();
			while (iterTmp.hasNext()) {
				try {
					 FileVO listVoTmp = (FileVO) iterTmp.next();
					 String fileName =  listVoTmp.getFileStreCours()+listVoTmp.getStreFileNm();
//					 fileName = fileName.split("upload")[1];
			 		 
					 ImgUtil.delImg(fileName);
					 
				 } catch (Exception e) {
					e.printStackTrace();
				 }	
				 
			}
			
			
			// 기존 썸네일 DB 삭제 후
	    	delete("file.deleteFileDetail", voTmp);
	    	
			// 저장
			result = insert("file.insertFileDetail", vo);
		}
		
		return result;
	}
	
	
	

	/**
	 * 여러 개의 파일을 삭제한다.
	 *
	 * @param fileList
	 * @throws Exception
	 */
	public void deleteFileInfs(List<?> fileList) throws Exception {
		Iterator<?> iter = fileList.iterator();
		FileVO vo;
		while (iter.hasNext()) {
			vo = (FileVO) iter.next();
			
			// 기존 DB 가져와서 파일 삭제
			List tmpList = (List<FileVO>) list("file.selectFileList", vo);
			Iterator<?> iterTmp = tmpList.iterator();
			while (iterTmp.hasNext()) {
				try {
					 FileVO listVoTmp = (FileVO) iterTmp.next();
					 String fileName =  listVoTmp.getFileStreCours()+listVoTmp.getStreFileNm();
//					 fileName = fileName.split("upload")[1];
			 
					 ImgUtil.delImg(fileName);
					 
				 } catch (Exception e) {
					e.printStackTrace();
				 }	
				 
			}

			delete("file.deleteFileDetail", vo);
		}
	}

	/**
	 * 하나의 파일을 삭제한다.
	 *
	 * @param fvo
	 * @throws Exception
	 */
	public void deleteFileInf(FileVO fvo) throws Exception {
		
		// 기존 DB 가져와서 파일 삭제
		try{	 
			 String fileName =  fvo.getFileStreCours()+fvo.getStreFileNm();
//			 fileName = fileName.split("upload")[1];
	 
			 ImgUtil.delImg(fileName);
			 
		 } catch (Exception e) {
			e.printStackTrace();
		 }	
				
					
		delete("file.deleteFileDetail", fvo);
	}

	/**
	 * 파일에 대한 목록을 조회한다.
	 *
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<FileVO> selectFileInfs(FileVO vo) throws Exception {
		return (List<FileVO>) list("file.selectFileList", vo);
	}

	/**
	 * 파일 구분자에 대한 최대값을 구한다.
	 *
	 * @param fvo
	 * @return
	 * @throws Exception
	 */
	public int getMaxFileSN(FileVO fvo) throws Exception {
		return (Integer) selectOne("file.getMaxFileSN", fvo);
	}

	/**
	 * 파일에 대한 상세정보를 조회한다.
	 *
	 * @param fvo
	 * @return
	 * @throws Exception
	 */
	public FileVO selectFileInf(FileVO fvo) throws Exception {
		return (FileVO) selectOne("file.selectFileInf", fvo);
	}

	/**
	 * 전체 파일을 삭제한다.
	 *
	 * @param fvo
	 * @throws Exception
	 */
	public void deleteAllFileInf(FileVO fvo) throws Exception {
		
		// 기존 DB 가져와서 파일 삭제
		List tmpList = (List<FileVO>) list("file.selectFileList", fvo);
		Iterator<?> iterTmp = tmpList.iterator();
		while (iterTmp.hasNext()) {
			try {
				 FileVO listVoTmp = (FileVO) iterTmp.next();
				 String fileName =  listVoTmp.getFileStreCours()+listVoTmp.getStreFileNm();
//				 fileName = fileName.split("upload")[1];
		 
				 ImgUtil.delImg(fileName);
				 
			 } catch (Exception e) {
				e.printStackTrace();
			 }	
			 
		}
				
		update("file.deleteCOMTNFILE", fvo);
	}

	/**
	 * 파일명 검색에 대한 목록을 조회한다.
	 *
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<FileVO> selectFileListByFileNm(FileVO fvo) throws Exception {
		return (List<FileVO>) list("file.selectFileListByFileNm", fvo);
	}

	/**
	 * 파일명 검색에 대한 목록 전체 건수를 조회한다.
	 *
	 * @param fvo
	 * @return
	 * @throws Exception
	 */
	public int selectFileListCntByFileNm(FileVO fvo) throws Exception {
		return (Integer) selectOne("file.selectFileListCntByFileNm", fvo);
	}

	/**
	 * 이미지 파일에 대한 목록을 조회한다.
	 *
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<FileVO> selectImageFileList(FileVO vo) throws Exception {
		return (List<FileVO>) list("file.selectImageFileList", vo);
	}

	public int downCountAddCOMTNFILE(FileVO fvot) {
		return update("file.downCountAddCOMTNFILE", fvot);
	}
}
