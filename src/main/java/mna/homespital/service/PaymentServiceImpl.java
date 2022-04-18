package mna.homespital.service;

import mna.homespital.dao.CardInformationDAO;
import mna.homespital.dao.MemberDAO;
import mna.homespital.dto.Card_Information;
import mna.homespital.dto.Payment;
import mna.homespital.dto.User;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Service
public class PaymentServiceImpl implements PaymentService {
    //    훈 - 결제 서비스
    @Autowired
    CardInformationDAO cardDAO;
    @Autowired
    MemberDAO memberDAO;

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

    public JSONObject getBillingKey(String authToken, JSONObject cardData, int user_number, String card_nickname) {
        JSONObject result = null;

        //customer_uid 설정
        int leftLimit = 48; // numeral '0'
        int rightLimit = 122; // letter 'z'
        int targetStringLength = 80;
        Random random = new Random();
        String generatedString = random.ints(leftLimit, rightLimit + 1)
                .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
                .limit(targetStringLength)
                .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
                .toString();
        cardData.remove("customer_uid"); // test_billingkeyapi.jsp에서는 customer_uid를 임의로 정의함. 그거 빼주는 코드
        cardData.put("customer_uid", generatedString);


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


        try {
            Card_Information cardInfo = new Card_Information(
                    cardData.getString("customer_uid"),
                    user_number,
                    new SimpleDateFormat("yyyy-MM").parse(cardData.getString("expiry")),
                    card_nickname,
                    cardData.getString("card_number")
            );
            Map<String, Object> param = new HashMap<>();
            param.put("customer_uid", cardData.getString("customer_uid"));
            param.put("card_owner_number", user_number);
            cardDAO.insertMyCard(cardInfo);
            JSONObject r = result.getJSONObject("response");
            Card_Information cardInform = cardDAO.queryMyCard(param);
            r.put("card_nickname", cardInform.getCard_nickname());
            r.put("card_number", cardInform.getCard_number().substring(cardInform.getCard_number().length() - 4, cardInform.getCard_number().length()));
            r.put("customer_uid", cardInform.getCustomer_uid());
            return r;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public JSONObject pay(String authToken, int diagnosis_number, String customer_uid, int user_number, int amount, String name) {
        // merchant_uid = 사실상 영수증 번호같은 개념인듯
        // name = 상대방 카드기록에 보이는 결제내역 스트링
        System.out.println("START");
        JSONObject result = null;
        Integer merchant_uid_int = null;
        try {
            if (amount > 0) {
                merchant_uid_int = cardDAO.getLastPaymentReceiptNo();
                if (merchant_uid_int == null) merchant_uid_int = 0;
                merchant_uid_int += 1;
                String merchant_uid = "RECEIPT" + String.format("%08d", merchant_uid_int);
                System.out.println(merchant_uid);

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
                    JSONObject resp = result.getJSONObject("response");
                    Payment receipt = new Payment(merchant_uid_int, customer_uid, user_number, amount, resp.getString("status"));
                    cardDAO.issueReceipt(receipt);
                    if (resp.getString("status").equals("paid"))
                        cardDAO.changeDiagBKUsed(diagnosis_number);
                    else throw new Exception("결제 실패: " + resp.toString());

                } catch (Exception e) {
                    e.printStackTrace();
                }
                if (result.getInt("code") != 0)
                    throw new Exception("code " + result.getInt("code") + ": " + result.getString("message"));
            } else cardDAO.changeDiagBKUsed(diagnosis_number);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.disconnect();
            conn = null;
        }

        return result.getJSONObject("response");
    }

    @Override
    public List<Card_Information> getPayments(String email) {
        try {
            User user = memberDAO.queryMember(email);
            return cardDAO.queryMyCards(user.getUser_number());
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Card_Information getPaymentInfo(int user_number, String card_number) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("user_number", user_number);
            params.put("card_number", card_number);
            return cardDAO.queryMyCardWithCardNumber(params);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Card_Information getPayment(int user_number, String customer_uid) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("card_owner_number", user_number);
            params.put("customer_uid", customer_uid);
//            System.out.println("queryMyCard Start");
//            System.out.println("user_number = " + user_number + ", customer_uid = " + customer_uid);
            Card_Information card = cardDAO.queryMyCard(params);
            System.out.println(card.getCard_nickname());
            return card;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public void setMyMainCard(int user_number, String customer_uid) throws Exception {
        Map<String, Object> param = new HashMap<>();
        param.put("card_owner_number", user_number);
        param.put("customer_uid", customer_uid);
        cardDAO.setThisCardMain(param);
    }
}

