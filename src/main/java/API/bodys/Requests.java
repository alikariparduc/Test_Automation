package API.bodys;

import API.stockPojo.*;
import com.saf.framework.AutomationConstants;
import com.saf.framework.CommonLib;
import org.apache.commons.lang3.RandomStringUtils;

import java.util.ArrayList;
import java.util.List;

public class Requests {

    public static String getTokenPOSTRequest(String username, String password, String userGroup) {
        Login login = new Login();

        login.setUserGroup(userGroup);
        login.setUsername(username);
        login.setPassword(password);

        System.out.println(CommonLib.prepJson(login));
        return CommonLib.prepJson(login);
    }

    public static String takeINForNonIMEIProductPOSTRequest(String storeCode, String agent, String sku, String barcode, String offerType, String quantity) {
        TakeIn takeIn = new TakeIn();

        takeIn.setStoreCode(storeCode);
        takeIn.setAgent(agent);

        Product product = new Product();
        product.setSku(sku);
        product.setBarcode(barcode);
        product.setOfferType(offerType);
        product.setQuantity(Integer.valueOf(quantity));

        List<Product> products = new ArrayList<>();
        products.add(product);

        takeIn.setProducts(products);

        System.out.println(CommonLib.prepJson(takeIn));
        return CommonLib.prepJson(takeIn);
    }

    public static String takeINForIMEIProductPOSTRequest(String storeCode, String agent, String sku, String barcode, String offerType) {
        TakeIn takeIn = new TakeIn();

        takeIn.setStoreCode(storeCode);
        takeIn.setAgent(agent);

        Product product = new Product();
        product.setSku(sku);
        product.setBarcode(barcode);
        product.setOfferType(offerType);
        product.setQuantity(3);

        List<String> imeiList = new ArrayList<>();
        imeiList.add(RandomStringUtils.randomNumeric(15));
        imeiList.add(RandomStringUtils.randomNumeric(15));
        imeiList.add(RandomStringUtils.randomNumeric(15));

        product.setImeiList(imeiList);

        List<Product> products = new ArrayList<>();
        products.add(product);

        takeIn.setProducts(products);

        System.out.println(CommonLib.prepJson(takeIn));
        return CommonLib.prepJson(takeIn);
    }

    public static String addICCIfromSVMStoStockPOSTRequest(String storeCode, String sku, String barcode) {
        String icciNo = "899002";
        icciNo += RandomStringUtils.randomNumeric(12);
        ICCI icci = new ICCI();

        String sessionId = "SIM-" + RandomStringUtils.randomNumeric(10);
        AutomationConstants.sessionId = sessionId;
        String invoiceNo = "AutomationTest" + RandomStringUtils.randomNumeric(5);
        AutomationConstants.invoiceNo = invoiceNo;

        icci.setSessionId(sessionId);
        icci.setStartIcci(icciNo);
        icci.setEndIcci(icciNo);
        icci.setStoreCode(storeCode);
        icci.setSku(sku);
        icci.setBarcode(barcode);
        icci.setInvoiceNo(invoiceNo);
        icci.setDispatchNo(RandomStringUtils.randomNumeric(10));
        icci.setInitialDateTime("2022-11-22");

        System.out.println(CommonLib.prepJson(icci));
        return CommonLib.prepJson(icci);
    }

    public static String addMultipleICCIfromSVMStoStockPOSTRequest(String storeCode, String quantity) {

        //------------------------------------------------------------------

        String icciPrefix = "899002";      //899002 172839483923    172839483926
        String icciNo = RandomStringUtils.randomNumeric(12);

        Long startICCI12Digits = Long.parseLong(icciNo);
        Long endICCI12Digits = startICCI12Digits + (Long.parseLong(quantity) - 1);

        String startICCI = icciPrefix + startICCI12Digits.toString();
        String endICCI = icciPrefix + endICCI12Digits.toString();

        //-------------------------------------------------------------------

        ICCI icci = new ICCI();

        String sessionId = "SIM-" + RandomStringUtils.randomNumeric(10);
        AutomationConstants.sessionId = sessionId;
        String invoiceNo = "AutomationTest" + RandomStringUtils.randomNumeric(5);
        AutomationConstants.invoiceNo = invoiceNo;

        icci.setSessionId(sessionId);
        icci.setStartIcci(startICCI);
        icci.setEndIcci(endICCI);
        icci.setStoreCode(storeCode);
        icci.setSku("FJB0827");
        icci.setBarcode("1000000000000");
        icci.setInvoiceNo(invoiceNo);
        icci.setDispatchNo(RandomStringUtils.randomNumeric(10));
        icci.setInitialDateTime("2022-11-22");

        AutomationConstants.startICCI = startICCI;
        AutomationConstants.endICCI = endICCI;

        System.out.println(CommonLib.prepJson(icci));
        return CommonLib.prepJson(icci);
    }

    public static String queryICCIPOSTRequest(String source, String productId, String issueTypeCode, String cardType, String paymentType, String shopCode, String branchCode, String gsmNo, String isTourist, String isEsim) {
        BalanceQuery balanceQuery = new BalanceQuery();

        balanceQuery.setSource(source);
        balanceQuery.setProductId(productId);
        balanceQuery.setTransactionId(RandomStringUtils.randomNumeric(10));
        balanceQuery.setIssueTypeCode(issueTypeCode);
        balanceQuery.setCardType(cardType);
        balanceQuery.setPaymentType(paymentType);
        balanceQuery.setShopCode(shopCode);

        if(branchCode.equals("null"))
            branchCode = null;
        balanceQuery.setBranchCode(branchCode);

        balanceQuery.setGsmNo(gsmNo);
        balanceQuery.setIcci(AutomationConstants.icciForQueryTest);
        balanceQuery.setIsTourist(isTourist);
        balanceQuery.setIsEsim(isEsim);

        System.out.println(CommonLib.prepJson(balanceQuery));
        return CommonLib.prepJson(balanceQuery);
    }

    public static String deductICCIPOSTRequest(String ICCI, String storeCode) {
        BalanceDeduction balanceDeduction = new BalanceDeduction();

        balanceDeduction.setSource("RSM-AUTOMATION");
        balanceDeduction.setProductId("PRE");
        balanceDeduction.setTransactionId(RandomStringUtils.randomNumeric(10));
        balanceDeduction.setIssueTypeCode("500");
        balanceDeduction.setCardType("TR");
        balanceDeduction.setPaymentType("T");
        balanceDeduction.setShopCode(storeCode);

        /*if(branchCode.equals("null"))
            branchCode = null;
        balanceDeduction.setBranchCode(branchCode);*/

        balanceDeduction.setGsmNo("53422522462");
        balanceDeduction.setIcci(ICCI);
        balanceDeduction.setIsTourist("N");
        balanceDeduction.setIsEsim("N");
        balanceDeduction.setIsFree("N");

        System.out.println(CommonLib.prepJson(balanceDeduction));
        return CommonLib.prepJson(balanceDeduction);
    }

    public static String refundICCIPOSTRequest(String transactionId) {
        BalanceRefund balanceRefund = new BalanceRefund();
        balanceRefund.setSource("RSM-AUTOMATION");
        balanceRefund.setTransactionId(transactionId);

        System.out.println(CommonLib.prepJson(balanceRefund));
        return CommonLib.prepJson(balanceRefund);
    }

    public static String validateStoreBPPSRequest(String shopCode, String transferAmount) {
        BPPS validateStore = new BPPS();
        validateStore.setShopCode(shopCode);
        validateStore.setAmountAvailable(0);
        validateStore.setTransferAmount(Double.parseDouble(transferAmount));
        validateStore.setTransferAmountUom(0);

        System.out.println(CommonLib.prepJson(validateStore));
        return CommonLib.prepJson(validateStore);
    }

    public static String approveAmountBPPSRequest(String shopCode, String transferAmount) {
        BPPS approveAmount = new BPPS();
        approveAmount.setProvisionId(AutomationConstants.provisionId);
        approveAmount.setShopCode(shopCode);
        approveAmount.setAmountAvailable(0);
        approveAmount.setBankCode("1210");
        approveAmount.setTransferAmount(Double.parseDouble(transferAmount));
        approveAmount.setTransferAmountUom(0);

        System.out.println(CommonLib.prepJson(approveAmount));
        return CommonLib.prepJson(approveAmount);
    }

    public static String addInvalidICCIfromSVMStoStockPOSTRequest(String storeCode, String sku, String barcode,String icciDigits) {
        String icciNo = RandomStringUtils.randomNumeric(Integer.parseInt(icciDigits));
        ICCI icci = new ICCI();

        String sessionId = "SIM-" + RandomStringUtils.randomNumeric(10);
        AutomationConstants.sessionId = sessionId;
        String invoiceNo = "AutomationTest" + RandomStringUtils.randomNumeric(5);
        AutomationConstants.invoiceNo = invoiceNo;

        icci.setSessionId(sessionId);
        icci.setStartIcci(icciNo);
        icci.setEndIcci(icciNo);
        icci.setStoreCode(storeCode);
        icci.setSku(sku);
        icci.setBarcode(barcode);
        icci.setInvoiceNo(invoiceNo);
        icci.setDispatchNo(RandomStringUtils.randomNumeric(10));
        icci.setInitialDateTime("2022-11-22");

        System.out.println(CommonLib.prepJson(icci));
        return CommonLib.prepJson(icci); }
}