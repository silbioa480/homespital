package mna.homespital.controller;

import mna.homespital.dto.User;
import mna.homespital.service.MemberService;
import mna.homespital.service.PaymentService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.net.HttpURLConnection;
import java.util.Map;

@Controller
public class BillingController {
    //    훈
    @Autowired
    HttpSession session;

    @Autowired
    MemberService memberService;

    @Autowired
    PaymentService paymentService;

//    @GetMapping("/billingkeyForm")
//    public String billkeyForm() {
//        return "/user/main/test_billingkeyapi";
//    }
//
//    @GetMapping("/payForm")
//    public String payForm() {
//        return "/user/main/test_payapi";
//    }

    @ResponseBody
    @PostMapping("/writeMyCard")
    public ResponseEntity<String> writeMyCard(@RequestParam Map<String, Object> params) {
        JSONObject authTokenResponseRAW = null;
        String authToken = "";
        JSONObject billingKeyResponseRAW = null;
        String billingKeyResponse = "";
        HttpURLConnection conn = null;

        try {
            User user = memberService.queryMember((String) session.getAttribute("email"));

            //여기에 대충 카드 정보를 담아주는 객체 생성
            JSONObject cardData = new JSONObject();
            cardData.put("card_number", params.get("card_number"));
            cardData.put("expiry", params.get("expiry"));
            cardData.put("birth", user.getUser_registration_number().substring(0, 6));
            cardData.put("pwd_2digit", params.get("pwd_2digit"));
            cardData.put("customer_email", user.getUser_email());
            cardData.put("customer_postCode", user.getZip_code());
            cardData.put("customer_addr", user.getStreet_address() + ", " + user.getDetail_address());
//            cardData.put("customer_uid", generateRandomString());
//                card_number, // 카드 번호
//                expiry, // 카드 유효기간
//                birth, // 생년월일
//                pwd_2digit, // 카드 비밀번호 앞 두자리
//                customer_uid}
            System.out.println(cardData.toString());
            // 인증 토큰 요청
            authTokenResponseRAW = paymentService.getAuthToken();
            authToken = authTokenResponseRAW.getString("access_token");

            // 빌링키 발급 요청
            JSONObject billingKey = paymentService.getBillingKey(authToken, cardData, user.getUser_number(), (String) params.get("card_name"));
            System.out.println(params.get("insertIntoMyData"));

            if (params.get("insertIntoMyData").equals("true"))
                paymentService.setMyMainCard(user.getUser_number(), billingKey.getString("customer_uid"));

            return new ResponseEntity<String>(billingKey.toString(), HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("ERROR", HttpStatus.BAD_REQUEST);
        }
    }


//    public String generateRandomString() {
//        int leftLimit = 48; // numeral '0'
//        int rightLimit = 122; // letter 'z'
//        int targetStringLength = 20;
//        Random random = new Random();
//
//        String generatedString = random.ints(leftLimit, rightLimit + 1)
//                .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
//                .limit(targetStringLength)
//                .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
//                .toString();
//        return generatedString;
//    }
}

