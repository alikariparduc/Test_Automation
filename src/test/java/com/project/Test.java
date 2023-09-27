package com.project;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class Test {
    public static void main(String [] args){

    }
    public static void POSTRequest() throws IOException {



        final String POST_PARAMS = "{\n" +
                "\"lastUpdatedDateTime\": null,\n" +
                "\"createdDateTime\": null,\n" +
                "\"supplierCode\": \"bstar\",\n" +
                "\"receiptNo\": \"stest_test50\",\n" +
                "\"storeCode\": \"W000800\",\n" +
                "\"versionNumber\": \"1\",\n" +
                "\"note\": \"askdhgasd\",\n" +
                "\"customerInfo\": {\n" +
                "\"lastUpdatedDateTime\": null,\n" +
                "\"createdDateTime\": null,\n" +
                "\"name\": \"name\",\n" +
                "\"storeCode\": \"W000800\",\n" +
                "\"taxNumber\": \"asd\",\n" +
                "\"address\": \"adres\",\n" +
                "\"district\": \"distict\",\n" +
                "\"city\": \"city\",\n" +
                "\"phone\": \"1234\"\n" +
                "},\n" +
                "\"totalPriceInfo\": {\n" +
                "\"lastUpdatedDateTime\": null,\n" +
                "\"createdDateTime\": null,\n" +
                "\"vat\": 2,\n" +
                "\"price\": 10,\n" +
                "\"vatInclusivePrice\": 8,\n" +
                "\"discount\": 3,\n" +
                "\"discountRatio\": 1,\n" +
                "\"currency\": null\n" +
                "},\n" +
                "\"skuInfoList\": [\n" +
                "{\n" +
                "\"lastUpdatedDateTime\": null,\n" +
                "\"createdDateTime\": null,\n" +
                "\"sku\": \"SON0122D\",\n" +
                "\"quantity\": 2,\n" +
                "\"skuPriceInfo\": {\n" +
                "\"lastUpdatedDateTime\": null,\n" +
                "\"createdDateTime\": null,\n" +
                "\"vat\": 2,\n" +
                "\"price\": 10,\n" +
                "\"vatInclusivePrice\": 8,\n" +
                "\"discount\": 3,\n" +
                "\"discountRatio\": 1,\n" +
                "\"currency\": null\n" +
                "},\n" +
                "\"recommendedPriceInfo\": {\n" +
                "\"vat\": \"10.0\",\n" +
                "\"price\": \"120.0\",\n" +
                "\"vatInclusivePrice\": \"120.0\",\n" +
                "\"discount\": \"10.0\",\n" +
                "\"discountRatio\": \"10.0\",\n" +
                "\"currency\": \"TRY\"\n" +
                "},\n" +
                "\"description\": \"descr\",\n" +
                "\"barcode\": \"7311271555650D\",\n" +
                "\"unitType\": \"NIU\",\n" +
                "\"campaignCode\": \"3\",\n" +
                "\"offerType\": \"TEMLIK\",\n" +
                "\"imeiInfoList\": [\n" +
                "{\n" +
                "\"lastUpdatedDateTime\": null,\n" +
                "\"createdDateTime\": null,\n" +
                "\"imeiNo\": \"468564585216030\",\n" +
                "\"dateExpired\": \"date\"\n" +
                "},\n" +
                "{\n" +
                "\"lastUpdatedDateTime\": null,\n" +
                "\"createdDateTime\": null,\n" +
                "\"imeiNo\": \"468564585216031\",\n" +
                "\"dateExpired\": \"date\"\n" +
                "}\n" +
                "]\n" +
                "}\n" +
                "]\n" +
                "}";
        System.out.println(POST_PARAMS);
        URL obj = new URL("http://cloud-gateway-rsmnsadsat.apps.mbt.vodafone.local/services/supplier/delivery/create-delivery-order");
        HttpURLConnection postConnection = (HttpURLConnection) obj.openConnection();
        postConnection.setRequestMethod("POST");
        postConnection.setRequestProperty("userId", "a1bcdefgh");
        postConnection.setRequestProperty("Content-Type", "application/json");


        postConnection.setDoOutput(true);
        OutputStream os = postConnection.getOutputStream();
        os.write(POST_PARAMS.getBytes());
        os.flush();
        os.close();


        int responseCode = postConnection.getResponseCode();
        System.out.println("POST Response Code :  " + responseCode);
        System.out.println("POST Response Message : " + postConnection.getResponseMessage());

        if (responseCode == HttpURLConnection.HTTP_CREATED) { //success
            BufferedReader in = new BufferedReader(new InputStreamReader(
                    postConnection.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in .readLine()) != null) {
                response.append(inputLine);
            } in .close();

            // print result
            System.out.println(response.toString());
        } else {
            System.out.println("POST NOT WORKED");
        }
    }
}
