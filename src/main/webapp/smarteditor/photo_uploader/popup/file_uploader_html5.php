<?php
function uploadSmartEditorImage($uploadPath, $fileName){
	$arrFileName = explode('.', $fileName);
	$ext = $arrFileName[count($arrFileName)-1]; 
	
	if(!file_exists($uploadPath)) {
		mkdir($uploadPath, 0777);
	}
	
	$fileName = (isset($option['fileName']))?$option['fileName']:date('Ymdhis');
	$saveFileName = $fileName;
	$cnt = 1;
	while(file_exists("$uploadPath/$saveFileName.$ext")) {
		$saveFileName = $fileName.'_'.$cnt++;
	}
	
	$saveFileName .= ".$ext";
	
	return $saveFileName;
}?>
<?php
 	$sFileInfo = '';
	$headers = array();
	 
	foreach($_SERVER as $k => $v) {
		if(substr($k, 0, 9) == "HTTP_FILE") {
			$k = substr(strtolower($k), 5);
			$headers[$k] = $v;
		} 
	}
	
	$file = new stdClass;
	$file->name = uploadSmartEditorImage("{$_SERVER['DOCUMENT_ROOT']}/upload/smartEditor/", rawurldecode($headers['file_name']));
	
	//$file->name = rawurldecode($headers['file_name']);
	$file->size = $headers['file_size'];
	$file->content = file_get_contents("php://input");
	
	$filename_ext = strtolower(array_pop(explode('.',$file->name)));
	$allow_file = array("jpg", "png", "bmp", "gif"); 
	
	if(!in_array($filename_ext, $allow_file)) {
		
		echo "NOTALLOW_".$file->name;
		
	} else {
		$uploadDir = "{$_SERVER['DOCUMENT_ROOT']}/upload/smartEditor/";
		if(!is_dir($uploadDir)){
			mkdir($uploadDir, 0777);
		}
		
		$newPath = $uploadDir.iconv("utf-8", "cp949", $file->name);
		
		if(file_put_contents($newPath, $file->content)) {
			$sFileInfo .= "&bNewLine=true";
			$sFileInfo .= "&sFileName=".$file->name;
			$sFileInfo .= "&sFileURL=/upload/smartEditor/".$file->name;
		}
		
		echo $sFileInfo;
	}
?>