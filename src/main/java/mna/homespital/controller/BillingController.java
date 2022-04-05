package mna.homespital.controller;

import org.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

@Controller
public class BillingController {
    @GetMapping("/billingkeyForm")
    public String billkeyForm() {
        return "/user/main/test_billingkeyapi";
    }

    @ResponseBody
    @PostMapping("/test-billingkey")
    public ResponseEntity<String> testbkey(@RequestParam Map<String, String> params) {
        String authTokenResponse = "";
        String billingKeyResponse = "";
        HttpURLConnection conn = null;

        //여기에 대충 카드 정보를 담아주는 객체 생성
        //
        JSONObject cardData = new JSONObject();
        cardData.append("card_number", params.get("card_number"));
        cardData.append("expiry", params.get("expiry"));
        cardData.append("birth", params.get("birth"));
        cardData.append("pwd_2digit", params.get("pwd_2digit"));
        cardData.append("customer_uid", 9);

//                card_number, // 카드 번호
//                expiry, // 카드 유효기간
//                birth, // 생년월일
//                pwd_2digit, // 카드 비밀번호 앞 두자리
//                customer_uid}

        try {
            URL url = new URL("https://api.iamport.kr/users/getToken");
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setUseCaches(false);
            conn.setDoInput(true);
            conn.setDoOutput(true); //OutputStream을 사용해서 인증키 데이터 전송
            JSONObject authInfo = new JSONObject();
            authInfo.append("imp_api", "1205515243185179");
            authInfo.append("imp_secret", "76b56c6a7987b195fd8d6ad27a7ca825a452753f94920947d4a9169106e698ff41561dfc05479bd7");
            try (OutputStream os = conn.getOutputStream()) {
                byte request_data[] = authInfo.toString().getBytes();
                os.write(request_data);
            } catch (Exception e) {
                throw new Exception();
            }
            conn.connect();

            int authTokenCode = conn.getResponseCode(); // 인증 토큰을 이렇게 요청함
//            if(authTokenCode != 200) throw new Exception("RESPONSE NOT 200");
            System.out.println(authTokenCode);
            try { // 인증 토큰을 받아옴
                BufferedReader br = new BufferedReader(
                        new InputStreamReader(
                                conn.getInputStream(), "utf-8"));
                String s = null;
                while ((s = br.readLine()) != null) {
                    authTokenResponse = authTokenResponse + s;
                }
                br.close();
            } catch (Exception e) {
                throw new Exception();
            }
            conn.disconnect();
            conn = null;


            // 빌링키 발급 요청

            URL billingkeyUrl = new URL("https://api.iamport.kr/subscribe/customers/" + cardData.getString("customer_uid"));
            conn = (HttpURLConnection) billingkeyUrl.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Accept", "application/json");
            conn.setRequestProperty("Authorization", authTokenResponse);
            conn.setDoInput(true);
            conn.setDoOutput(true); //OutputStream을 사용해서 카드정보 데이터 전송
            try (OutputStream os = conn.getOutputStream()) {
                byte request_data[] = cardData.toString().getBytes("utf-8");
                os.write(request_data);
            } catch (Exception e) {
                throw new Exception();
            }

            int billingkeyCode = conn.getResponseCode();
            if (billingkeyCode != 200) throw new Exception("BILLING KEY RESPONSE NOT 200");

            try { // 인증 토큰을 받아옴
                BufferedReader br = new BufferedReader(
                        new InputStreamReader(
                                conn.getInputStream(), "utf-8"));
                String s = null;
                while ((s = br.readLine()) != null) {
                    billingKeyResponse = billingKeyResponse + s;
                }
                br.close();
            } catch (Exception e) {
                throw new Exception();
            }

//        const { code, message } = issueBilling.data;
//            if (code === 0) { // 빌링키 발급 성공
//                res.send({ status: "success", message: "Billing has successfully issued" });
//            } else { // 빌링키 발급 실패
//                res.send({ status: "failed", message });
//            }
            return new ResponseEntity<String>(billingKeyResponse, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("ERROR", HttpStatus.BAD_REQUEST);
        }
    }
}
