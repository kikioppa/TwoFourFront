package culturelandFront.controller.front.myPage;
import java.text.SimpleDateFormat;


import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import culturelandFront.core.abstr.NdnAbstractController;
import culturelandFront.core.security.seed.SeedED;
import culturelandFront.core.util.NdnUtil;
import culturelandFront.core.util.PropUtil;
import culturelandFront.service.AccountService;
import culturelandFront.vo.UserVO;
/**
 * 계정 관리
 * 
 * */
@Controller
@RequestMapping("/front/openbank")
public class OpenBankController extends NdnAbstractController{

	private final Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private AccountService accountService;
	
	private static final String oauthTokenURI = "/oauth/2.0/token";
	private static final String inquiryRealNameURI = "/v2.0/inquiry/real_name";
	
	
    /**
     * openbank 계좌인증
     * @param session
     * @param param
     * @param model
     * @return
     * @throws Exception
     */
	@RequestMapping("/getAccountCert.json")
	@ResponseBody
	public String getAccountCert( 
			HttpSession session,
			@RequestParam Map param ,
			Model model
			) throws Exception{
		
		UserVO user = (UserVO)session.getAttribute(PropUtil.get("session.user"));
		JSONObject obj = new JSONObject();			// 리턴 obj
		RestTemplate rest = new RestTemplate();		// RestTemplate 선언
		HttpHeaders headers = new HttpHeaders();	// http 헤더 선언

		String url = PropUtil.get("openbank.url")+ oauthTokenURI; // 토큰인증 url
		
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		
		MultiValueMap<String, String> map= new LinkedMultiValueMap<String, String>();
		
		map.add("client_id", PropUtil.get("openbank.client_id"));
		map.add("client_secret", PropUtil.get("openbank.client_secret"));
		map.add("scope", "oob");
		map.add("gwGubun", "");
		map.add("envGubun", "test");
		map.add("grant_type", PropUtil.get("openbank.grant_type"));
		
		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);

		ResponseEntity<String> response = rest.postForEntity( url, request , String.class );

		logger.debug("response:"+response);
        JSONObject tokenResult = responseJsonParser(response.getBody());
        
		logger.debug("response:"+tokenResult.get("access_token"));
		String jwtToken = tokenResult.get("access_token").toString();
		if("".equals(NdnUtil.nvl(jwtToken, ""))){
			obj.put("success", false);
			return obj.toString();
		}
        
        SimpleDateFormat hourDate = new SimpleDateFormat("ddhhmmss");
        SimpleDateFormat yearDate = new SimpleDateFormat("yyyyMMddhhmmss");
		Map<String, String> inputMap = new HashMap();
		inputMap.put("bank_tran_id", tokenResult.get("client_use_code").toString() +"U0" + hourDate.format(new Date()));
//		inputMap.put("bank_code_std", "097"); //은행코드
		inputMap.put("bank_code_std", (String) param.get("bank_code")); //은행코드
//		inputMap.put("account_num", "1234567890123456"); //계좌번호
		inputMap.put("account_num", (String) param.get("acnt_number")); //계좌번호
//		inputMap.put("account_holder_info", "880101");
		inputMap.put("account_holder_info", user.getBirthday());
		inputMap.put("account_holder_info_type", " ");
		inputMap.put("tran_dtime", yearDate.format(new Date()));
		inputMap.put("gwGubun", "");
		inputMap.put("envGubun", "test");
		headers.add("Authorization", "Bearer " + jwtToken);
		headers.setContentType(MediaType.APPLICATION_JSON);
        JSONObject jsonObject = new JSONObject();
        
        for( Map.Entry<String, String> entry : inputMap.entrySet() ) {
            String key = entry.getKey();
            Object value = entry.getValue();
            jsonObject.put(key, value);
        }		
		String requestJson = jsonObject.toJSONString();
        HttpEntity<String> entity = new HttpEntity<String>(requestJson,headers);
        
        url = PropUtil.get("openbank.url")+inquiryRealNameURI; // 계좌실명조회
        
        response = rest.postForEntity( url, entity , String.class );
		//"rsp_code":"A0000"
		JSONObject realNameResult = responseJsonParser(response.getBody());
		logger.debug("rsp_code:"+realNameResult.get("rsp_code").toString());
		logger.debug("account_holder_name:"+realNameResult.get("account_holder_name").toString());
		if(realNameResult.get("rsp_code").toString().equals("A0000")){
			// DB insert 계좌번호 암호화 CONFIRM_YN='Y'로
			if(realNameResult.get("account_holder_name").equals(param.get("member_name"))){
				param.put("confirmYn","Y");
				param.put("memberNo", user.getMemberNo());
				param.put("acntNumber", SeedED.encoding((String) param.get("acnt_number")));
				param.put("bankCode", (String) param.get("bank_code"));
				if("".equals(NdnUtil.nvl(param.get("seq"),""))){
					accountService.insertAccount(param);
				}else{
					accountService.updateAccount(param);
				}
				obj.put("success", true);
			}else{
				obj.put("success", false);
			}
		}else{
			obj.put("success", false);
		}
		return obj.toString();
	}
	
	public JSONObject responseJsonParser(String input) throws ParseException{
		
		JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj = (JSONObject) jsonParser.parse(input);	
        
		return jsonObj;
		
	}
	
}
