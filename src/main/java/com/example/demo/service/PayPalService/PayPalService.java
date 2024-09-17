package com.example.demo.service.PayPalService;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;

import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Base64;
import java.util.Map;

@Service
public class PayPalService {

    @Autowired
    private CloseableHttpClient httpClient;

    private final String clientId = "Af6Npuwe7XWQae1F2Z-d3Cpv182tycmxPbGhFSiP0PWtVQt8HEAEyZNm9GR9noxyVZHk9OelUYONUj8E";
    private final String clientSecret = "EDRwn6KXSC5RLI555mE5IiOnzNAc73kY4yCuNyXBs49ySk-P7SjabjpGY2I2i70_tbYylEoFanc6j1kq";
    private final String apiUrl = "https://api-m.sandbox.paypal.com"; // Use https://api-m.paypal.com for live

    public String createOrder(String amount) throws IOException {
        String accessToken = getAccessToken();
        HttpPost post = new HttpPost(apiUrl + "/v2/checkout/orders");
        post.setHeader("Authorization", "Bearer " + accessToken);
        post.setHeader("Content-Type", "application/json");

        JSONObject orderJson = new JSONObject();
        orderJson.put("intent", "CAPTURE");
        orderJson.put("purchase_units", new JSONArray()
            .put(new JSONObject()
                .put("amount", new JSONObject()
                    .put("currency_code", "USD")
                    .put("value", amount))));
        orderJson.put("application_context", new JSONObject()
            .put("return_url", "http://yourdomain.com/return")
            .put("cancel_url", "http://yourdomain.com/cancel"));

        post.setEntity(new StringEntity(orderJson.toString()));

        HttpResponse response = httpClient.execute(post);
        String responseBody = EntityUtils.toString(response.getEntity());

        // Log the full response body for debugging
        System.out.println("PayPal Order Creation Response: " + responseBody);

        JSONObject responseJson = new JSONObject(responseBody);

        // Check for error response
        if (responseJson.has("name")) {
            throw new IOException("PayPal Error: " + responseJson.getString("message"));
        }

        return responseJson.getString("id"); // Order ID for approval
    }


    public Map<String, Object> executeOrder(String orderId) throws IOException {
        String accessToken = getAccessToken();
        HttpPost post = new HttpPost(apiUrl + "/v2/checkout/orders/" + orderId + "/capture");
        post.setHeader("Authorization", "Bearer " + accessToken);
        post.setHeader("Content-Type", "application/json");

        HttpResponse response = httpClient.execute(post);
        String responseBody = EntityUtils.toString(response.getEntity());
        return new JSONObject(responseBody).toMap();
    }

    private String getAccessToken() throws IOException {
        HttpPost post = new HttpPost(apiUrl + "/v1/oauth2/token");
        post.setHeader("Authorization", "Basic " + Base64.getEncoder().encodeToString((clientId + ":" + clientSecret).getBytes()));
        post.setHeader("Content-Type", "application/x-www-form-urlencoded");
        post.setEntity(new StringEntity("grant_type=client_credentials"));

        HttpResponse response = httpClient.execute(post);
        String responseBody = EntityUtils.toString(response.getEntity());
        JSONObject responseJson = new JSONObject(responseBody);
        return responseJson.getString("access_token");
    }
}
