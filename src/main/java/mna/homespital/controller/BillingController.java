package mna.homespital.controller;

import mna.homespital.service.PaymentServiceImpl;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.net.HttpURLConnection;
import java.util.Map;

@Controller
public class BillingController {
    @Autowired
    PaymentServiceImpl iamportService;

    @GetMapping("/billingkeyForm")
    public String billkeyForm() {
        return "/user/main/test_billingkeyapi";
    }

    @GetMapping("/payForm")
    public String payForm() {
        return "/user/main/test_payapi";
    }

    @ResponseBody
    @PostMapping("/test-billingkey")
    public ResponseEntity<String> testbkey(@RequestParam Map<String, String> params) {
        JSONObject authTokenResponseRAW = null;
        String authToken = "";
        JSONObject billingKeyResponseRAW = null;
        String billingKeyResponse = "";
        HttpURLConnection conn = null;

        //여기에 대충 카드 정보를 담아주는 객체 생성
        //
        JSONObject cardData = new JSONObject();
        cardData.put("card_number", params.get("card_number"));
        cardData.put("expiry", params.get("expiry"));
        cardData.put("birth", params.get("birth"));
        cardData.put("pwd_2digit", params.get("pwd_2digit"));
        cardData.put("customer_uid", Integer.toString(9));

//                card_number, // 카드 번호
//                expiry, // 카드 유효기간
//                birth, // 생년월일
//                pwd_2digit, // 카드 비밀번호 앞 두자리
//                customer_uid}

        try {
            // 인증 토큰 요청
            authTokenResponseRAW = iamportService.getAuthToken();
            authToken = authTokenResponseRAW.getString("access_token");

            // 빌링키 발급 요청
            JSONObject billingKey = iamportService.getBillingKey(authToken, cardData);
            return new ResponseEntity<String>(billingKey.toString(), HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("ERROR", HttpStatus.BAD_REQUEST);
        }
    }

//    @ResponseBody
//    @PostMapping("/test-billingkey2")
//    public ResponseEntity<String> testbkey2() {
//        try {
//            IamportClient client = new IamportClient("1205515243185179", "76b56c6a7987b195fd8d6ad27a7ca825a452753f94920947d4a9169106e698ff41561dfc05479bd7");
//
//            return new ResponseEntity<String>("OK", HttpStatus.OK);
//        } catch (Exception e) {
//            return new ResponseEntity<String>("ERROR", HttpStatus.BAD_REQUEST);
//        }
//    }

    @ResponseBody
    @PostMapping("/test-pay")
    public ResponseEntity<String> testpay1(@RequestParam Map<String, String> params) {
        JSONObject r = null;
        try {
//            String authToken = params.get("authToken");
            String customer_uid = params.get("customer_uid");
            String merchant_uid = params.get("merchant_uid");
            int amount = Integer.parseInt(params.get("amount"));
            String name = params.get("name");
            System.out.println(1);
            JSONObject at = iamportService.getAuthToken();
            System.out.println(at.getString("access_token"));
            r = iamportService.pay(at.getString("access_token"), customer_uid, merchant_uid, amount, name);
            System.out.println(3);
            return new ResponseEntity<String>(r.toString(), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("[ERROR]" + r.toString(), HttpStatus.BAD_REQUEST);
        }
    }
}

