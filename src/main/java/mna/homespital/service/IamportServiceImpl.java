package mna.homespital.service;

import org.json.JSONObject;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

@Service
public class IamportServiceImpl implements IamportService {

//    @Autowired


    HttpURLConnection conn = null;
    final String imp_key = "1205515243185179";
    final String imp_secret = "76b56c6a7987b195fd8d6ad27a7ca825a452753f94920947d4a9169106e698ff41561dfc05479bd7";

    public JSONObject getAuthToken() {
        JSONObject body = null;
        try {
            URL url = new URL("https://api.iamport.kr/users/getToken");
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setUseCaches(false);
            conn.setDoInput(true);
            conn.setDoOutput(true); //OutputStream을 사용해서 인증키 데이터 전송
            JSONObject authInfo = new JSONObject();
            authInfo.put("imp_key", imp_key);
            authInfo.put("imp_secret", imp_secret);
            System.out.println(authInfo.toString());
            try (OutputStream os = conn.getOutputStream()) {
                byte request_data[] = authInfo.toString().getBytes();
                os.write(request_data);
                os.flush();
                os.close();
            } catch (Exception e) {
                throw new Exception();
            }
            conn.connect();

            int authTokenCode = conn.getResponseCode(); // 인증 토큰을 이렇게 요청함
            if (authTokenCode == 401) throw new Exception("AUTH INFO  NOT VALID");

            try { // 인증 토큰을 받아옴
                StringBuilder sb = new StringBuilder();
                BufferedReader br = new BufferedReader(
                        new InputStreamReader(
                                conn.getInputStream(), "utf-8"));
                String s = null;
                while ((s = br.readLine()) != null) {
//                    authTokenResponse = authTokenResponse + s;
                    sb.append(s);
                }
                br.close();
                body = new JSONObject(sb.toString());
                if (body.getInt("code") != 0)
                    throw new Exception("code " + body.getInt("code") + ": " + body.getString("message"));
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                conn.disconnect();
                conn = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return body.getJSONObject("response");
    } // https://docs.iamport.kr/tech/access-token?lang=ko
    // response는 "access_token", "now(아임포트 REST API 서버의 현재시간)", "expired_at(토큰의 만료시간(KST))"

    public JSONObject getBillingKey(String authToken, JSONObject cardData) {
        JSONObject result = null;

        try {
            URL billingkeyUrl = new URL("https://api.iamport.kr/subscribe/customers/" + cardData.getString("customer_uid"));
            conn = (HttpURLConnection) billingkeyUrl.openConnection();
            conn.setRequestMethod("POST");
//            conn.setRequestProperty("Accept", "application/json");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Authorization", authToken);
            conn.setDoInput(true);
            conn.setDoOutput(true); //OutputStream을 사용해서 카드정보 데이터 전송
            try (OutputStream os = conn.getOutputStream()) {
                byte request_data[] = cardData.toString().getBytes("utf-8");
                os.write(request_data);
            } catch (Exception e) {
                throw new Exception();
            }

            int billingkeyCode = conn.getResponseCode();
            System.out.println(billingkeyCode);
            if (billingkeyCode == 401) throw new Exception("BILLING KEY NOT VALID");

            try { // 빌링키 응답을 받아옴
                StringBuilder sb = new StringBuilder();
                BufferedReader br = new BufferedReader(
                        new InputStreamReader(
                                conn.getInputStream(), "utf-8"));
                String s = null;
                while ((s = br.readLine()) != null) {
                    sb.append(s);
                }
                br.close();
                result = new JSONObject(sb.toString());
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (result.getInt("code") != 0)
                throw new Exception("code " + result.getInt("code") + ": " + result.getString("message"));
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.disconnect();
            conn = null;
        }
        return result.getJSONObject("response");
    }

    public JSONObject pay(String authToken, String customer_uid, String merchant_uid, int amount, String name) {
        // merchant_uid = 사실상 영수증 번호같은 개념인듯
        // name = 상대방 카드기록에 보이는 결제내역 스트링
        System.out.println("START");
        JSONObject result = null;
        try {
            URL url = new URL("https://api.iamport.kr/subscribe/payments/again");
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
//            conn.setRequestProperty("Accept", "application/json");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Authorization", authToken);
            conn.setDoInput(true);
            conn.setDoOutput(true); //OutputStream을 사용해서 카드정보 데이터 전송
            JSONObject data = new JSONObject();
            data.put("customer_uid", customer_uid);
            data.put("merchant_uid", merchant_uid);
            data.put("amount", amount);
            data.put("name", name);
            System.out.println("PREPARED");
            try (OutputStream os = conn.getOutputStream()) {
                byte request_data[] = data.toString().getBytes("utf-8");
                os.write(request_data);
            } catch (Exception e) {
                throw new Exception();
            }

            int code = conn.getResponseCode();
            System.out.println(code);
            if (code == 401) throw new Exception("REQUEST TOKEN NOT VALID");

            try { // 결제 요청 데이터를 받아옴
                StringBuilder sb = new StringBuilder();
                BufferedReader br = new BufferedReader(
                        new InputStreamReader(
                                conn.getInputStream(), "utf-8"));
                String s = null;
                while ((s = br.readLine()) != null) {
                    sb.append(s);
                }
                br.close();
                result = new JSONObject(sb.toString());
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (result.getInt("code") != 0)
                throw new Exception("code " + result.getInt("code") + ": " + result.getString("message"));

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.disconnect();
            conn = null;
        }
        return result.getJSONObject("response");
    }

    public String[] test() {
        int start = 9;
        int end = 18;
        ArrayList<Integer> arr = new ArrayList<>();
        for (int i = start; i < end; i++)
            arr.add(i);
        System.out.println(arr.toString());

        return null;
    }
}
