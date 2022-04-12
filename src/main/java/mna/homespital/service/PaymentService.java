package mna.homespital.service;

import mna.homespital.dto.Card_Information;
import org.json.JSONObject;

import java.util.List;

public interface PaymentService {

    public JSONObject getAuthToken();

    public JSONObject getBillingKey(String authToken, JSONObject cardData, int user_number, String card_nickname);

    public JSONObject pay(String authToken, int diagnosis_number, String customer_uid, int user_number, int amount, String name);

    public List<Card_Information> getPayments(String email);

    public Card_Information getPaymentInfo(int user_number, String card_number);

    public Card_Information getPayment(int user_number, String customer_uid);

    void setMyMainCard(int user_number, String customer_uid) throws Exception;
}
