package culturelandFront.controller.front.myPage;

import java.net.URI;
import java.net.URISyntaxException;

import culturelandFront.core.security.seed.SeedED;
import culturelandFront.core.util.NdnUtil;
import culturelandFront.service.AccountService;
import culturelandFront.vo.UserVO;

import org.apache.log4j.Logger;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
 
@Service

@ResponseBody
public class PgAPI {
 
    private static final String HOST = "https://cmsapitest.ksnet.co.kr/";
    
    private final Logger logger = Logger.getLogger(this.getClass());
    private UserVO userVO;
    
    public String pgReady(UserVO vo) {
    	
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("ekey","9489-------------42C65AC3");
        headers.add("msalt","MA01");
        headers.add("kscode","3235");
        headers.add("reqdata","inPrintContent : 라이프ＰＬ보험");
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("compCode", "00041287");
        params.add("bankCode", "004");
        params.add("seqNo", "990000");
        params.add("accountPasswd", "패키지 1개 :5게임");
        params.add("amount","120");
        params.add("inBankCode","004");
        params.add("inAccount", "20600104048258");
        params.add("inPrintContent", "100");
       /* params.add("approval_url", "http://localhost:8080/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:8080/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8080/kakaoPaySuccessFail");*/
        System.out.println("음음음음으므음음ㅇㅁㅇ???"+params);
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
       System.out.println("음음음음으므음음ㅇㅁㅇ???"+params);
       
        
        return "/confirm.do";
        
    }
    
}