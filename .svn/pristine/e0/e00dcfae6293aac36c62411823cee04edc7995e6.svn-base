package culturelandFront.core.util;

import java.io.StringReader;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.log4j.Logger;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

/**
 * XML 가져오기
 * 
 * @author jin
 *
 */
public class XmlUtil {
	
	private static final Logger logger = Logger.getLogger(XmlUtil.class);
	
	public static Element getResultXml(String strUrl) {
		
		Element doc = null;
		 
		doc = getResultXml(strUrl , "");
					
		return doc;
	}
	
	public static Element getResultXml(String strUrl , String paramStr) {
		Element doc = null;
		 
		String xmlStr = StreamReaderUtil.reader(strUrl, paramStr);
				
		// first of all we request out
		// DOM-implementation:
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		// then we have to create document-loader:
		DocumentBuilder loader;
		try {
			loader = factory.newDocumentBuilder();
	
			// loading a DOM-tree...
			Document document = loader.parse(new InputSource(new StringReader(xmlStr)));
			// at last, we get a root element:
			doc = document.getDocumentElement();
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
					
		return doc;
	}
	
	
	/**
	 *  string 형 value 파싱
	 */ 
	public static String xmlParsingStr(NodeList nodelist){
		String returnStr = "";
		
		try{			
			if(nodelist.getLength()>0){																							
				returnStr = nodelist.item(0).getFirstChild().getNodeValue();
			}
		}catch(Exception e){
			logger.error(e.toString());
		}
		return returnStr;
	}
	
	
	/**
	 *  string[] 형 value 파싱
	 */ 
	public static String xmlParsingArr(NodeList nodelist , int num){
		String returnStr = "";
		
		try{			
			if(nodelist.getLength()>0){		
				Element nameElmnt = (Element) nodelist.item(num);
				Node node = nameElmnt.getFirstChild();
				
				if(node != null){
					returnStr =  node.getNodeValue();
				}else{
					returnStr =  "";
				}
			}
		}catch(Exception e){
			logger.error(e.toString());
		}
		return returnStr;
	}
	
	
	
	
}
