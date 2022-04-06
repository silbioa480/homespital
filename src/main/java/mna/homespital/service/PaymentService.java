package mna.homespital.service;

import mna.homespital.dto.Card_Information;
import org.json.JSONObject;

import java.util.List;

public interface PaymentService {

    public JSONObject getAuthToken();

    public JSONObject getBillingKey(String authToken, JSONObject cardData);

    public JSONObject pay(String authToken, String customer_uid, String merchant_uid, int amount, String name);

    public List<Card_Information> getPayments(String email);
}
