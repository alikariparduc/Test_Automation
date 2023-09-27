package API.METOD;

import API.BODY.RequestBody;
import API.BODY.responseBody;
import API.config.ProxySystemPropertyManager;
import com.saf.framework.AutomationConstants;
import com.saf.framework.CommonLib;
import com.saf.framework.StepResultType;
import io.restassured.http.ContentType;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.http.HttpStatus;

import java.util.Objects;

import static io.restassured.RestAssured.given;
import static io.restassured.http.ContentType.JSON;

public class BaseMethods {

    public boolean createTokenRequest(String desiredAPIPath, String username, String password) {
        ProxySystemPropertyManager.clearProxySystemProperties();

        boolean status = false;

        String environment = "";
        String urlCreateToken = "";

        environment = System.getProperty("ENVIRONMENT");
        if(environment == null || environment.equals("release")) {
            urlCreateToken = AutomationConstants.release_urlCreateToken;
        }
        else if(environment.equals("test")) {
            urlCreateToken = AutomationConstants.test_urlCreateToken;
        }

        System.out.println(RequestBody.createTokenRequest(username, password));
        //Response response = responseBody.getResponse(desiredAPIPath, RequestBody.createTokenRequest(username, password), "", AutomationConstants.urlCreateToken);
        Response response = given()
                //.config(config)
                .header("Content-Type","application/json")
                .contentType(ContentType.JSON)
                .body(RequestBody.createTokenRequest(username, password))
                .post(urlCreateToken);

        System.out.println(response.getHeaders());

        JsonPath js = new JsonPath(Objects.requireNonNull(response).asPrettyString());

        AutomationConstants.token = js.getString("data.accessToken");

        System.out.println("Token is: " + AutomationConstants.token);

        if (response.getStatusCode() == HttpStatus.SC_OK) {
            status = true;
            CommonLib.allureReport(StepResultType.PASS, "success", false);
        } else {
            CommonLib.allureReport(StepResultType.FAIL, "Error getting token. Check it.", false);
        }

        ProxySystemPropertyManager.setProxySystemProperties();

        return status;
    }

    public boolean createTokenRequestWithUserGroup(String desiredAPIPath, String username, String usergroup, String password) {
        ProxySystemPropertyManager.clearProxySystemProperties();

        boolean status = false;

        String environment = "";
        String urlCreateToken = "";

        environment = System.getProperty("ENVIRONMENT");
        if(environment == null || environment.equals("release")) {
            urlCreateToken = AutomationConstants.release_urlCreateToken;
        }
        else if(environment.equals("test")) {
            urlCreateToken = AutomationConstants.test_urlCreateToken;
        }

        System.out.println(RequestBody.createTokenRequestWithUserGroup(username, password, usergroup));
        Response response = given()
                //.config(config)
                .header("Content-Type","application/json")
                .contentType(ContentType.JSON)
                .body(RequestBody.createTokenRequestWithUserGroup(username, password, usergroup))
                .post(urlCreateToken);

        System.out.println(response.getHeaders());

        JsonPath js = new JsonPath(Objects.requireNonNull(response).asPrettyString());
        AutomationConstants.token = js.getString("data.accessToken");

        System.out.println("Token is: " + AutomationConstants.token);

        if (response.getStatusCode() == HttpStatus.SC_OK) {
            status = true;
            CommonLib.allureReport(StepResultType.PASS, "success", false);
        } else {
            CommonLib.allureReport(StepResultType.FAIL, "Error getting token. Check it.", false);
        }
        ProxySystemPropertyManager.setProxySystemProperties();
        return status;
    }

    public boolean getSupplier(String desiredAPIPath, String storeCode) {
        boolean status = false;

        String environment = "";
        String apiURL = "";

        environment = System.getProperty("ENVIRONMENT");
        if(environment == null || environment.equals("release")) {
            apiURL = AutomationConstants.release_apiURL;
        }
        else if(environment.equals("test")) {
            apiURL = AutomationConstants.test_apiURL;
        }

        try {
            //RestAssuredConfig config = RestAssuredConfigurator.getRestAssuredConfig();
            ProxySystemPropertyManager.clearProxySystemProperties();

            String supplierSender;
            supplierSender = "Test_for_Automation" + RandomStringUtils.randomNumeric(5);

            AutomationConstants.ime1 = RandomStringUtils.randomNumeric(15);
            AutomationConstants.ime2 = RandomStringUtils.randomNumeric(15);
            AutomationConstants.imei3 = RandomStringUtils.randomNumeric(15);
            AutomationConstants.imei4 = RandomStringUtils.randomNumeric(15);

            System.out.println(RequestBody.requestSupplier(supplierSender, storeCode, AutomationConstants.ime1, AutomationConstants.ime2, AutomationConstants.imei3, AutomationConstants.imei4));

            /*Response response = responseBody.getResponse(desiredAPIPath, RequestBody.requestSupplier(supplierSender, storeCode, AutomationConstants.ime1, AutomationConstants.ime2, AutomationConstants.imei3, AutomationConstants.imei4),
                    AutomationConstants.token, apiURL);*/

            Response response = given()
                    //.config(config)
                    .header("Authorization", "Bearer " + AutomationConstants.token)
                    .contentType(JSON)
                    .and()
                    .body(RequestBody.requestSupplier(supplierSender, storeCode, AutomationConstants.ime1, AutomationConstants.ime2, AutomationConstants.imei3, AutomationConstants.imei4))
                    .when()
                    .post(apiURL)
                    .then()
                    .extract().response();

            JsonPath js = new JsonPath(Objects.requireNonNull(response).asPrettyString());

            boolean success = js.getBoolean("success");
            System.out.println("response:\n"+response.asPrettyString());
            if (success) {
                status = true;
                //  System.out.println(supplierSender);
                //   CommonLib.allureReport(StepResultType.PASS, "Supplier send to " + storeCode + " 1 " + imei1 + " 2 " + imei2 + " 3 " + imei3 + " 4 " + imei4, false);
            } else {
                CommonLib.allureReport(StepResultType.FAIL, "It has been seen that the characters do not come up properly.", false);

            }
            AutomationConstants.globalVariables.put("SupplierSenderNo",supplierSender);
        } catch (Exception e) {
            CommonLib.allureReport(StepResultType.FAIL, "There was an error in the arrival of all the characters.", false);
        }

        ProxySystemPropertyManager.setProxySystemProperties();

        return status;
    }


    public boolean createSupplierRequestWithInStockIMEI(String desiredAPIPath, String storeCode) {
        boolean status = false;

        String environment = "";
        String apiURL = "";

        environment = System.getProperty("ENVIRONMENT");
        if(environment == null || environment.equals("release")) {
            apiURL = AutomationConstants.release_apiURL;
        }
        else if(environment.equals("test")) {
            apiURL = AutomationConstants.test_apiURL;
        }

        try {
            ProxySystemPropertyManager.clearProxySystemProperties();

            String supplierSender;
            supplierSender = "Test_for_Automation" + RandomStringUtils.randomNumeric(5);

            System.out.println(RequestBody.supplierOrderWithInStockIMEIRequest(supplierSender, storeCode));

            Response response = responseBody.getResponse(desiredAPIPath, RequestBody.supplierOrderWithInStockIMEIRequest(supplierSender, storeCode),
                    AutomationConstants.token, apiURL);

            JsonPath js = new JsonPath(Objects.requireNonNull(response).asPrettyString());

            boolean success = js.getBoolean("success");
            System.out.println("response:\n"+response.asPrettyString());
            if (success) {
                status = true;
                //  System.out.println(supplierSender);
                //   CommonLib.allureReport(StepResultType.PASS, "Supplier send to " + storeCode + " 1 " + imei1 + " 2 " + imei2 + " 3 " + imei3 + " 4 " + imei4, false);
            } else {
                CommonLib.allureReport(StepResultType.FAIL, "It has been seen that the characters do not come up properly.", false);

            }
            AutomationConstants.globalVariables.put("SupplierSenderNo",supplierSender);
        } catch (Exception e) {
            CommonLib.allureReport(StepResultType.FAIL, "There was an error in the arrival of all the characters.", false);
        }

        ProxySystemPropertyManager.setProxySystemProperties();

        return status;
    }

    public boolean createSupplierRequestWithInStockAndNonStockIMEI(String desiredAPIPath, String storeCode) {
        boolean status = false;

        String environment = "";
        String apiURL = "";

        environment = System.getProperty("ENVIRONMENT");
        if(environment == null || environment.equals("release")) {
            apiURL = AutomationConstants.release_apiURL;
        }
        else if(environment.equals("test")) {
            apiURL = AutomationConstants.test_apiURL;
        }

        try {
            ProxySystemPropertyManager.clearProxySystemProperties();

            String supplierSender;
            supplierSender = "Test_for_Automation" + RandomStringUtils.randomNumeric(5);

            AutomationConstants.ime1 = RandomStringUtils.randomNumeric(15);
            AutomationConstants.ime2 = RandomStringUtils.randomNumeric(15);
            AutomationConstants.imei3 = RandomStringUtils.randomNumeric(15);
            AutomationConstants.imei4 = AutomationConstants.inStockIMEI;

            System.out.println(RequestBody.supplierOrderWithInStockAndNonStockIMEIRequest(supplierSender, storeCode, AutomationConstants.ime1, AutomationConstants.ime2, AutomationConstants.imei3, AutomationConstants.imei4));

            Response response = responseBody.getResponse(desiredAPIPath, RequestBody.supplierOrderWithInStockAndNonStockIMEIRequest(supplierSender, storeCode, AutomationConstants.ime1, AutomationConstants.ime2, AutomationConstants.imei3, AutomationConstants.imei4),
                    AutomationConstants.token, apiURL);

            JsonPath js = new JsonPath(Objects.requireNonNull(response).asPrettyString());

            boolean success = js.getBoolean("success");
            System.out.println("response:\n"+response.asPrettyString());
            if (success) {
                status = true;
                //  System.out.println(supplierSender);
                //   CommonLib.allureReport(StepResultType.PASS, "Supplier send to " + storeCode + " 1 " + imei1 + " 2 " + imei2 + " 3 " + imei3 + " 4 " + imei4, false);
            } else {
                CommonLib.allureReport(StepResultType.FAIL, "It has been seen that the characters do not come up properly.", false);

            }
            AutomationConstants.globalVariables.put("SupplierSenderNo",supplierSender);
        } catch (Exception e) {
            CommonLib.allureReport(StepResultType.FAIL, "There was an error in the arrival of all the characters.", false);
        }

        ProxySystemPropertyManager.setProxySystemProperties();

        return status;
    }

    public boolean createSupplierRequestWithDuplicateIMEIsUnderSameBarcode(String desiredAPIPath, String storeCode) {
        boolean status = false;

        String environment = "";
        String apiURL = "";

        environment = System.getProperty("ENVIRONMENT");
        if(environment == null || environment.equals("release")) {
            apiURL = AutomationConstants.release_apiURL;
        }
        else if(environment.equals("test")) {
            apiURL = AutomationConstants.test_apiURL;
        }

        try {
            ProxySystemPropertyManager.clearProxySystemProperties();

            String supplierSender;
            supplierSender = "Test_for_Automation" + RandomStringUtils.randomNumeric(5);

            AutomationConstants.ime1 = RandomStringUtils.randomNumeric(15);

            System.out.println(RequestBody.supplierOrderWithDuplicateIMEIsUnderSameBarcodeRequest(supplierSender, storeCode, AutomationConstants.ime1));

            Response response = responseBody.getResponse(desiredAPIPath, RequestBody.supplierOrderWithDuplicateIMEIsUnderSameBarcodeRequest(supplierSender, storeCode, AutomationConstants.ime1),
                    AutomationConstants.token, apiURL);

            JsonPath js = new JsonPath(Objects.requireNonNull(response).asPrettyString());

            String errorMessage = js.getString("error");
            System.out.println("response:\n"+response.asPrettyString());
            if (errorMessage.contains("DuplicateImeiException: ("+AutomationConstants.ime1+") imei's birden fazla mevcut")) {
                status = true;
                CommonLib.allureReport(StepResultType.PASS, "Can not send duplicate imeis under same barcode", false);
            } else {
                CommonLib.allureReport(StepResultType.FAIL, "Could not get the expected error message", false);
            }
            AutomationConstants.globalVariables.put("SupplierSenderNo",supplierSender);
        } catch (Exception e) {
            CommonLib.allureReport(StepResultType.FAIL, "There was an error in the arrival of all the characters.", false);
        }

        ProxySystemPropertyManager.setProxySystemProperties();

        return status;
    }

    public boolean createSupplierRequestWithDuplicateIMEIsUnderDifferentBarcodes(String desiredAPIPath, String storeCode) {
        boolean status = false;

        String environment = "";
        String apiURL = "";

        environment = System.getProperty("ENVIRONMENT");
        if(environment == null || environment.equals("release")) {
            apiURL = AutomationConstants.release_apiURL;
        }
        else if(environment.equals("test")) {
            apiURL = AutomationConstants.test_apiURL;
        }

        try {
            ProxySystemPropertyManager.clearProxySystemProperties();

            String supplierSender;
            supplierSender = "Test_for_Automation" + RandomStringUtils.randomNumeric(5);

            AutomationConstants.ime1 = RandomStringUtils.randomNumeric(15);

            System.out.println(RequestBody.supplierOrderWithDuplicateIMEIsUnderDifferentBarcodesRequest(supplierSender, storeCode, AutomationConstants.ime1));

            Response response = responseBody.getResponse(desiredAPIPath, RequestBody.supplierOrderWithDuplicateIMEIsUnderDifferentBarcodesRequest(supplierSender, storeCode, AutomationConstants.ime1),
                    AutomationConstants.token, apiURL);

            JsonPath js = new JsonPath(Objects.requireNonNull(response).asPrettyString());

            String errorMessage = js.getString("error");
            System.out.println("response:\n"+response.asPrettyString());
            if (errorMessage.contains("DuplicateImeiException: ("+AutomationConstants.ime1+") imei's birden fazla mevcut")) {
                status = true;
                CommonLib.allureReport(StepResultType.PASS, "Can not send duplicate imeis under different barcodes", false);
            } else {
                CommonLib.allureReport(StepResultType.FAIL, "Could not get the expected error message", false);
            }
            AutomationConstants.globalVariables.put("SupplierSenderNo",supplierSender);
        } catch (Exception e) {
            CommonLib.allureReport(StepResultType.FAIL, "There was an error in the arrival of all the characters.", false);
        }

        ProxySystemPropertyManager.setProxySystemProperties();

        return status;
    }

    public boolean createSupplierRequestWithNonExistentBarcode(String desiredAPIPath, String storeCode, String barcode) {
        boolean status = false;

        String environment = "";
        String apiURL = "";

        environment = System.getProperty("ENVIRONMENT");
        if(environment == null || environment.equals("release")) {
            apiURL = AutomationConstants.release_apiURL;
        }
        else if(environment.equals("test")) {
            apiURL = AutomationConstants.test_apiURL;
        }

        try {
            ProxySystemPropertyManager.clearProxySystemProperties();

            String supplierSender;
            supplierSender = "Test_for_Automation" + RandomStringUtils.randomNumeric(5);

            AutomationConstants.ime1 = RandomStringUtils.randomNumeric(15);

            System.out.println(RequestBody.supplierOrderWithNonExistentBarcode(supplierSender, storeCode, barcode, AutomationConstants.ime1));

            Response response = responseBody.getResponse(desiredAPIPath, RequestBody.supplierOrderWithNonExistentBarcode(supplierSender, storeCode, barcode, AutomationConstants.ime1),
                    AutomationConstants.token, apiURL);

            JsonPath js = new JsonPath(Objects.requireNonNull(response).asPrettyString());

            String errorMessage = js.getString("error");
            System.out.println("response:\n"+response.asPrettyString());
            if (errorMessage.contains("ProductNotFoundException: "+barcode+" nolu barkoda ait ürün bulunamadı")) {
                status = true;
                CommonLib.allureReport(StepResultType.PASS, "Can not send order with non-existent barcode", false);
            } else {
                CommonLib.allureReport(StepResultType.FAIL, "Could not get the expected error message", false);
            }
            AutomationConstants.globalVariables.put("SupplierSenderNo",supplierSender);
        } catch (Exception e) {
            CommonLib.allureReport(StepResultType.FAIL, "There was an error in the arrival of all the characters.", false);
        }

        ProxySystemPropertyManager.setProxySystemProperties();

        return status;
    }

    public boolean createSupplierRequestWithNonExistentSku(String desiredAPIPath, String storeCode, String sku) {
        boolean status = false;

        String environment = "";
        String apiURL = "";

        environment = System.getProperty("ENVIRONMENT");
        if(environment == null || environment.equals("release")) {
            apiURL = AutomationConstants.release_apiURL;
        }
        else if(environment.equals("test")) {
            apiURL = AutomationConstants.test_apiURL;
        }

        try {
            ProxySystemPropertyManager.clearProxySystemProperties();

            String supplierSender;
            supplierSender = "Test_for_Automation" + RandomStringUtils.randomNumeric(5);

            AutomationConstants.ime1 = RandomStringUtils.randomNumeric(15);

            System.out.println(RequestBody.supplierOrderWithNonExistentSku(supplierSender, storeCode, sku, AutomationConstants.ime1));

            Response response = responseBody.getResponse(desiredAPIPath, RequestBody.supplierOrderWithNonExistentSku(supplierSender, storeCode, sku, AutomationConstants.ime1),
                    AutomationConstants.token, apiURL);

            JsonPath js = new JsonPath(Objects.requireNonNull(response).asPrettyString());

            String errorMessage = js.getString("error");
            System.out.println("response:\n"+response.asPrettyString());
            if (errorMessage.contains("SkuNotExistException: "+sku+" nolu sku bulunamadı")) {
                status = true;
                CommonLib.allureReport(StepResultType.PASS, "Can not send order with non-existent sku", false);
            } else {
                CommonLib.allureReport(StepResultType.FAIL, "Could not get the expected error message", false);
            }
            AutomationConstants.globalVariables.put("SupplierSenderNo",supplierSender);
        } catch (Exception e) {
            CommonLib.allureReport(StepResultType.FAIL, "There was an error in the arrival of all the characters.", false);
        }

        ProxySystemPropertyManager.setProxySystemProperties();

        return status;
    }

    public boolean createSupplierRequestWithInvalidIMEI(String desiredAPIPath, String storeCode, String imei) {
        boolean status = false;

        String environment = "";
        String apiURL = "";

        environment = System.getProperty("ENVIRONMENT");
        if(environment == null || environment.equals("release")) {
            apiURL = AutomationConstants.release_apiURL;
        }
        else if(environment.equals("test")) {
            apiURL = AutomationConstants.test_apiURL;
        }

        try {
            ProxySystemPropertyManager.clearProxySystemProperties();

            String supplierSender;
            supplierSender = "Test_for_Automation" + RandomStringUtils.randomNumeric(5);

            System.out.println(RequestBody.supplierOrderWithInvalidIMEI(supplierSender, storeCode, imei));

            Response response = responseBody.getResponse(desiredAPIPath, RequestBody.supplierOrderWithInvalidIMEI(supplierSender, storeCode, imei),
                    AutomationConstants.token, apiURL);

            JsonPath js = new JsonPath(Objects.requireNonNull(response).asPrettyString());

            String errorMessage = js.getString("error");
            System.out.println("response:\n"+response.asPrettyString());
            if (errorMessage.contains("InvalidImeiException: ("+imei+") imei's formatı uygun değil.")) {
                status = true;
                CommonLib.allureReport(StepResultType.PASS, "Can only send 15 digits IMEI", false);
            } else {
                CommonLib.allureReport(StepResultType.FAIL, "Could not get the expected error message", false);
            }
            AutomationConstants.globalVariables.put("SupplierSenderNo",supplierSender);
        } catch (Exception e) {
            CommonLib.allureReport(StepResultType.FAIL, "There was an error in the arrival of all the characters.", false);
        }

        ProxySystemPropertyManager.setProxySystemProperties();

        return status;
    }

    public boolean createSupplierRequestWithNonMatchingSKU(String desiredAPIPath, String storeCode, String barcode, String sku) {
        boolean status = false;

        String environment = "";
        String apiURL = "";

        environment = System.getProperty("ENVIRONMENT");
        if(environment == null || environment.equals("release")) {
            apiURL = AutomationConstants.release_apiURL;
        }
        else if(environment.equals("test")) {
            apiURL = AutomationConstants.test_apiURL;
        }

        try {
            ProxySystemPropertyManager.clearProxySystemProperties();

            String supplierSender;
            supplierSender = "Test_for_Automation" + RandomStringUtils.randomNumeric(5);

            AutomationConstants.ime1 = RandomStringUtils.randomNumeric(15);

            System.out.println(RequestBody.supplierOrderWithNonMatchingSKU(supplierSender, storeCode, barcode, sku, AutomationConstants.ime1));

            Response response = responseBody.getResponse(desiredAPIPath, RequestBody.supplierOrderWithNonMatchingSKU(supplierSender, storeCode, barcode, sku, AutomationConstants.ime1),
                    AutomationConstants.token, apiURL);

            JsonPath js = new JsonPath(Objects.requireNonNull(response).asPrettyString());

            String errorMessage = js.getString("error");
            System.out.println("response:\n"+response.asPrettyString());
            if (errorMessage.contains("SkuAndBarcodeDoesNotMatchException: Eklediğiniz ürünün SKU'su ("+sku+") sistemde kayıtlı olan  barkod")) {
                status = true;
                CommonLib.allureReport(StepResultType.PASS, "Can not send non matching barcode-sku", false);
            } else {
                CommonLib.allureReport(StepResultType.FAIL, "Could not get the expected error message", false);
            }
            AutomationConstants.globalVariables.put("SupplierSenderNo",supplierSender);
        } catch (Exception e) {
            CommonLib.allureReport(StepResultType.FAIL, "There was an error in the arrival of all the characters.", false);
        }

        ProxySystemPropertyManager.setProxySystemProperties();

        return status;
    }

    public boolean createSupplierRequestWithExistentReceiptNoAndVersionNo(String desiredAPIPath, String storeCode) {
        boolean status = false;

        String environment = "";
        String apiURL = "";

        environment = System.getProperty("ENVIRONMENT");
        if(environment == null || environment.equals("release")) {
            apiURL = AutomationConstants.release_apiURL;
        }
        else if(environment.equals("test")) {
            apiURL = AutomationConstants.test_apiURL;
        }

        try {
            ProxySystemPropertyManager.clearProxySystemProperties();

            AutomationConstants.ime1 = RandomStringUtils.randomNumeric(15);

            System.out.println(RequestBody.supplierOrderWithExistentReceiptNoAndVersionNo(AutomationConstants.receiptNo, storeCode, AutomationConstants.ime1));

            Response response = responseBody.getResponse(desiredAPIPath, RequestBody.supplierOrderWithExistentReceiptNoAndVersionNo(AutomationConstants.receiptNo, storeCode, AutomationConstants.ime1),
                    AutomationConstants.token, apiURL);

            JsonPath js = new JsonPath(Objects.requireNonNull(response).asPrettyString());

            String errorMessage = js.getString("error");
            System.out.println("response:\n"+response.asPrettyString());
            if (errorMessage.contains("A Delivery Order already created with the given Receipt No:")) {
                status = true;
                CommonLib.allureReport(StepResultType.PASS, "Can not send the same receipt no and version number as expected.", false);
            } else {
                CommonLib.allureReport(StepResultType.FAIL, "Could not get the expected error message", false);
            }
        } catch (Exception e) {
            CommonLib.allureReport(StepResultType.FAIL, "There was an error in the arrival of all the characters.", false);
        }

        ProxySystemPropertyManager.setProxySystemProperties();

        return status;
    }

    public boolean createSupplierRequestWithExistentReceiptNoAndDifferentVersionNo(String desiredAPIPath, String storeCode) {
        boolean status = false;

        String environment = "";
        String apiURL = "";

        environment = System.getProperty("ENVIRONMENT");
        if(environment == null || environment.equals("release")) {
            apiURL = AutomationConstants.release_apiURL;
        }
        else if(environment.equals("test")) {
            apiURL = AutomationConstants.test_apiURL;
        }

        try {
            //RestAssuredConfig config = RestAssuredConfigurator.getRestAssuredConfig();
            ProxySystemPropertyManager.clearProxySystemProperties();

            AutomationConstants.ime1 = RandomStringUtils.randomNumeric(15);
            AutomationConstants.ime2 = RandomStringUtils.randomNumeric(15);
            AutomationConstants.imei3 = RandomStringUtils.randomNumeric(15);
            AutomationConstants.imei4 = RandomStringUtils.randomNumeric(15);

            System.out.println(RequestBody.supplierOrderWithExistentReceiptNoAndDifferentVersionNo(AutomationConstants.globalVariables.get("SupplierSenderNo"), storeCode, AutomationConstants.ime1, AutomationConstants.ime2, AutomationConstants.imei3, AutomationConstants.imei4));

            Response response = responseBody.getResponse(desiredAPIPath, RequestBody.supplierOrderWithExistentReceiptNoAndDifferentVersionNo(AutomationConstants.globalVariables.get("SupplierSenderNo"), storeCode, AutomationConstants.ime1, AutomationConstants.ime2, AutomationConstants.imei3, AutomationConstants.imei4),
                    AutomationConstants.token, apiURL);

            JsonPath js = new JsonPath(Objects.requireNonNull(response).asPrettyString());

            boolean success = js.getBoolean("success");
            System.out.println("response:\n"+response.asPrettyString());
            if (success) {
                status = true;
                //  System.out.println(supplierSender);
                //   CommonLib.allureReport(StepResultType.PASS, "Supplier send to " + storeCode + " 1 " + imei1 + " 2 " + imei2 + " 3 " + imei3 + " 4 " + imei4, false);
            } else {
                CommonLib.allureReport(StepResultType.FAIL, "It has been seen that the characters do not come up properly.", false);

            }
        } catch (Exception e) {
            CommonLib.allureReport(StepResultType.FAIL, "There was an error in the arrival of all the characters.", false);
        }

        ProxySystemPropertyManager.setProxySystemProperties();

        return status;
    }

}
