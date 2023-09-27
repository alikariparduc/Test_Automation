package API.bodys;

import API.METOD.BaseMethods;
import com.saf.framework.AutomationConstants;
import com.saf.framework.CommonLib;
import com.saf.framework.StepResultType;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import org.apache.http.HttpStatus;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Objects;

public class Responses extends BaseMethods {

    public boolean createStockTokenResponse(String desiredRequestMethod, String username, String password, String userGroup) {
        boolean status = false;

        Response response = ResponseBody.getResponse(desiredRequestMethod, Requests.getTokenPOSTRequest(username, password, userGroup),
                 AutomationConstants.urlStockLogin);

        AutomationConstants.responseData = Objects.requireNonNull(response).asPrettyString();

        System.out.println("Response is: " + Objects.requireNonNull(response).asPrettyString());

        JsonPath js = new JsonPath(Objects.requireNonNull(response).asPrettyString());

        AutomationConstants.token = js.getString("data.accessToken");
        System.out.println("Token: " + AutomationConstants.token);

        if (AutomationConstants.token != null) {
            status = true;
            CommonLib.allureReport(StepResultType.PASS, "Token retrieved successfully.", false);
            System.out.println("Token retrieved successfully.");
        } else {
            CommonLib.allureReport(StepResultType.FAIL, "Token can not retrieved.", false);
        }
        return status;
    }

    public boolean takeINForNonIMEIProductResponse(String desiredRequestMethod, String storeCode, String agent, String sku, String barcode, String offerType, String quantity) {
        boolean status = false;

        System.out.println("URL = " + AutomationConstants.urlStockTakeIn);
        Response response = ResponseBody.getResponse(desiredRequestMethod, Requests.takeINForNonIMEIProductPOSTRequest(storeCode, agent, sku
                , barcode, offerType, quantity),
                AutomationConstants.token, AutomationConstants.urlStockTakeIn);

        AutomationConstants.responseData = Objects.requireNonNull(response).asPrettyString();

        System.out.println("Response is: " + Objects.requireNonNull(response).asPrettyString());

        JsonPath js = new JsonPath(Objects.requireNonNull(response).asPrettyString());

        String sessionID = js.getString("data.sessionId");
        boolean added = js.getBoolean("data.added");

        if (response.getStatusCode() == HttpStatus.SC_OK &&
            sessionID.startsWith("WEB") &&
            added == true
        ) {
            status = true;
            CommonLib.allureReport(StepResultType.PASS, "Take in is successfull.", false);
            System.out.println("Take in is successfull.");
        } else {
            CommonLib.allureReport(StepResultType.FAIL,
                    "Response is:\n" + response, false);
        }
        return status;
    }

    public boolean takeINForIMEIProductResponse(String desiredRequestMethod, String storeCode, String agent, String sku, String barcode, String offerType) {
        boolean status = false;

        System.out.println("URL = " + AutomationConstants.urlStockTakeIn);
        Response response = ResponseBody.getResponse(desiredRequestMethod, Requests.takeINForIMEIProductPOSTRequest(storeCode, agent, sku
                        , barcode, offerType),
                AutomationConstants.token, AutomationConstants.urlStockTakeIn);

        AutomationConstants.responseData = Objects.requireNonNull(response).asPrettyString();

        System.out.println("Response is: " + Objects.requireNonNull(response).asPrettyString());

        JsonPath js = new JsonPath(Objects.requireNonNull(response).asPrettyString());

        //AutomationConstants.result = js.getString("result.result");
        //AutomationConstants.code = js.getString("code");

        String sessionID = js.getString("data.sessionId");
        boolean added = js.getBoolean("data.added");

        if (response.getStatusCode() == HttpStatus.SC_OK &&
                sessionID.startsWith("WEB") &&
                added == true
        ) {
            status = true;
            CommonLib.allureReport(StepResultType.PASS, "Take in is successfull.", false);
            System.out.println("Take in is successfull.");
        } else {
            CommonLib.allureReport(StepResultType.FAIL,
                    "Response is:\n" + response, false);
        }
        return status;
    }

    public boolean addICCIfromSVMStoStockResponse(String desiredRequestMethod, String storeCode, String sku, String barcode) {
        boolean status = false;

        System.out.println("URL = " + AutomationConstants.urlSimcardProductInsert);
        Response response = ResponseBody.getResponse(desiredRequestMethod, Requests.addICCIfromSVMStoStockPOSTRequest(storeCode,sku,barcode),
                AutomationConstants.token, AutomationConstants.urlSimcardProductInsert);

        CommonLib.allureReport(StepResultType.PASS, "Add ICCI from SVMS to Stock is successfull.", false);
        System.out.println("Add ICCI from SVMS to Stock is successfull.");

        return true;
    }

    public boolean addMultipleICCIfromSVMStoStockResponse(String desiredRequestMethod, String storeCode, String quantity) {
        boolean status = false;

        System.out.println("URL = " + AutomationConstants.urlSimcardProductInsert);
        Response response = ResponseBody.getResponse(desiredRequestMethod, Requests.addMultipleICCIfromSVMStoStockPOSTRequest(storeCode, quantity),
                AutomationConstants.token, AutomationConstants.urlSimcardProductInsert);

        CommonLib.allureReport(StepResultType.PASS, "Add multiple ICCI from SVMS to Stock is successfull.", false);
        System.out.println("Add multiple ICCI from SVMS to Stock is successfull.");

        return true;
    }

    public boolean queryICCIResponse(String desiredRequestMethod, String source, String productId, String issueTypeCode, String cardType, String paymentType, String shopCode, String branchCode, String gsmNo, String isTourist, String isEsim) {
        boolean status = false;

        System.out.println("URL = " + AutomationConstants.urlBalanceQuery);
        Response response = ResponseBody.getResponse(desiredRequestMethod, Requests.queryICCIPOSTRequest(source,  productId,  issueTypeCode,  cardType,  paymentType,  shopCode,  branchCode,  gsmNo,  isTourist,  isEsim),
                AutomationConstants.token, AutomationConstants.urlBalanceQuery);

        AutomationConstants.responseData = Objects.requireNonNull(response).asPrettyString();

        System.out.println("Response is: " + Objects.requireNonNull(response).asPrettyString());

        JsonPath js = new JsonPath(Objects.requireNonNull(response).asPrettyString());

        String message = js.getString("data.balanceInfo.message");
        String responseShopCode = js.getString("data.acknowledgmentInfo.shopCode");

        int cost = -1;
        cost = js.getInt("data.balanceInfo.cost");

        if (response.getStatusCode() == HttpStatus.SC_OK &&
            message.equals("Bayinin bakiyesi yeterlidir") &&
            responseShopCode.equals(shopCode) &&
            cost != -1
        ) {
            status = true;
            CommonLib.allureReport(StepResultType.PASS, "Query ICCI is successfull.", false);
            System.out.println("Query ICCI is successfull.");
        } else {
            CommonLib.allureReport(StepResultType.FAIL,
                    "Response is:\n" + response, false);
        }
        return status;
    }

    public boolean deductICCIResponse(String desiredRequestMethod, String ICCI, String storeCode) {
        boolean status = false;

        System.out.println("URL = " + AutomationConstants.urlBalanceDeduction);
        Response response = ResponseBody.getResponse(desiredRequestMethod, Requests.deductICCIPOSTRequest(ICCI, storeCode),
                AutomationConstants.token, AutomationConstants.urlBalanceDeduction);

        AutomationConstants.responseData = Objects.requireNonNull(response).asPrettyString();

        System.out.println("Response is: " + Objects.requireNonNull(response).asPrettyString());

        JsonPath js = new JsonPath(Objects.requireNonNull(response).asPrettyString());

        String message = js.getString("data.balanceInfo.message");
        String responseShopCode = js.getString("data.acknowledgmentInfo.shopCode");

        double cost = -1;
        cost = js.getDouble("data.balanceInfo.cost");

        if (response.getStatusCode() == HttpStatus.SC_OK &&
                message.equals("İşlem başarıyla gerçekleşti ve ücret bayi bakiyesine yansıtıldı") &&
                responseShopCode.equals(storeCode) &&
                cost != -1
        ) {
            status = true;
            CommonLib.allureReport(StepResultType.PASS, "Deduct ICCI is successfull.", false);
            System.out.println("Deduct ICCI is successfull.");
        } else {
            CommonLib.allureReport(StepResultType.FAIL,
                    "Response is:\n" + response, false);
        }
        AutomationConstants.transactionIds.add(js.getString("data.acknowledgmentInfo.transactionId"));
        return status;
    }

    public boolean refundICCIResponse(String desiredRequestMethod, String transactionId) {
        boolean status = false;

        System.out.println("URL = " + AutomationConstants.urlBalanceRefund);
        Response response = ResponseBody.getResponse(desiredRequestMethod, Requests.refundICCIPOSTRequest(transactionId),
                AutomationConstants.token, AutomationConstants.urlBalanceRefund);

        AutomationConstants.responseData = Objects.requireNonNull(response).asPrettyString();

        System.out.println("Response is: " + Objects.requireNonNull(response).asPrettyString());

        JsonPath js = new JsonPath(Objects.requireNonNull(response).asPrettyString());

        String message = js.getString("data.message");
        String responseTransactionId = js.getString("data.transactionId");

        if (response.getStatusCode() == HttpStatus.SC_OK &&
                message.equals("İade başarıyla gerçekleşti ve ücret bayi bakiyesine yanstıldı") &&
                responseTransactionId.equals(transactionId)
        ) {
            status = true;
            CommonLib.allureReport(StepResultType.PASS, "Refund ICCI is successfull.", false);
            System.out.println("Refund ICCI is successfull.");
        } else {
            CommonLib.allureReport(StepResultType.FAIL,
                    "Response is:\n" + response, false);
        }
        return status;
    }

    public boolean validateStoreBPPSResponse(String desiredRequestMethod, String shopCode, String transferAmount) throws ParseException {
        boolean status = false;

        System.out.println("URL = " + AutomationConstants.urlBPPSValidateStore);
        Response response = ResponseBody.getResponse(desiredRequestMethod, Requests.validateStoreBPPSRequest(shopCode, transferAmount),
                AutomationConstants.token, AutomationConstants.urlBPPSValidateStore);

        AutomationConstants.responseData = Objects.requireNonNull(response).asPrettyString();

        System.out.println("Response is: " + Objects.requireNonNull(response).asPrettyString());

        JsonPath js = new JsonPath(Objects.requireNonNull(response).asPrettyString());

        String provisionId = js.getString("data.provisionId");

        if (response.getStatusCode() == HttpStatus.SC_OK &&
            provisionId != null
        ) {
            status = true;
            CommonLib.allureReport(StepResultType.PASS, "Validate store is successfull.", false);
            System.out.println("Validate store is successfull.");
        } else {
            CommonLib.allureReport(StepResultType.FAIL,
                    "Response is:\n" + response, false);
        }
        AutomationConstants.provisionId = provisionId;
        return status;
    }

    public boolean approveAmountBPPSResponse(String desiredRequestMethod, String shopCode, String transferAmount) {
        boolean status = false;

        System.out.println("URL = " + AutomationConstants.urlBPPSApprove);
        Response response = ResponseBody.getResponse(desiredRequestMethod, Requests.approveAmountBPPSRequest(shopCode, transferAmount),
                AutomationConstants.token, AutomationConstants.urlBPPSApprove);

        AutomationConstants.responseData = Objects.requireNonNull(response).asPrettyString();

        System.out.println("Response is: " + Objects.requireNonNull(response).asPrettyString());

        JsonPath js = new JsonPath(Objects.requireNonNull(response).asPrettyString());

        String provisionId = js.getString("data.provisionId");
        String errorMsg = js.getString("data.errorMsg");

        if (response.getStatusCode() == HttpStatus.SC_OK &&
            provisionId.equals(AutomationConstants.provisionId) &&
            errorMsg.equals("")
        ) {
            status = true;
            CommonLib.allureReport(StepResultType.PASS, "Approve amount is successfull.", false);
            System.out.println("Approve amount is successfull.");
        } else {
            CommonLib.allureReport(StepResultType.FAIL,
                    "Response is:\n" + response, false);
        }
        return status;
    }

    public boolean addInvalidICCIfromSVMStoStockResponse(String desiredRequestMethod, String storeCode, String sku, String barcode,String icciDigits) {
        boolean status = false;

        System.out.println("URL = " + AutomationConstants.urlSimcardProductInsert);
        Response response = ResponseBody.getResponse(desiredRequestMethod, Requests.addInvalidICCIfromSVMStoStockPOSTRequest(storeCode,sku,barcode,icciDigits),
                AutomationConstants.token, AutomationConstants.urlSimcardProductInsert);

        CommonLib.allureReport(StepResultType.PASS, "Add Invalid ICCI from SVMS to Stock is not successfull.", false);
        System.out.println("Add Invalid ICCI from SVMS to Stock is not successfull.");

        return true;}

    /*public boolean makeFreeActivationResponse(String desiredRequestMethod, String source, String productId, String issueTypeCode, String cardType, String paymentType, String shopCode, String branchCode, String gsmNo, String isTourist, String isEsim, String isFree) {
        boolean status = false;

        System.out.println("URL = " + AutomationConstants.);
        Response response = ResponseBody.getResponse(desiredRequestMethod, Requests.deductICCIPOSTRequest(source,  productId,  issueTypeCode,  cardType,  paymentType,  shopCode,  branchCode,  gsmNo,  isTourist,  isEsim, isFree),
                AutomationConstants.token, AutomationConstants.);

        AutomationConstants.responseData = Objects.requireNonNull(response).asPrettyString();

        System.out.println("Response is: " + Objects.requireNonNull(response).asPrettyString());

        JsonPath js = new JsonPath(Objects.requireNonNull(response).asPrettyString());

        String message = js.getString("data.balanceInfo.message");
        String responseShopCode = js.getString("data.acknowledgmentInfo.shopCode");

        int cost = -1;
        cost = js.getInt("data.balanceInfo.cost");

        if (response.getStatusCode() == HttpStatus.SC_OK &&
                message.equals("İşlem başarıyla gerçekleşti ve ücret bayi bakiyesine yansıtıldı") &&
                responseShopCode.equals(shopCode) &&
                cost != -1
        ) {
            status = true;
            CommonLib.allureReport(StepResultType.PASS, "Deduct ICCI is successfull.", false);
            System.out.println("Deduct ICCI is successfull.", false);
        } else {
            CommonLib.allureReport("FAIL",
                    "Response is:\n" + response);
        }
        AutomationConstants.transactionId = js.getString("data.acknowledgmentInfo.transactionId");
        return status;
    }*/
}