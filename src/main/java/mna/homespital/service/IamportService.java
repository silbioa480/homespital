package mna.homespital.service;

import org.json.JSONObject;

public interface IamportService {

    public JSONObject getAuthToken();

    public JSONObject getBillingKey(String authToken, JSONObject cardData);

    public JSONObject pay(String authToken, String customer_uid, String merchant_uid, int amount, String name);
}
