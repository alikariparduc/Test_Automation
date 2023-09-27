package API.BODY;

import com.saf.framework.AutomationConstants;

public class RequestBody {

    public static String createTokenRequest(String username, String password) {

        return "{\n" +
                "\t\"userGroup\": \"DEALER\",\n" +
                "\t\"username\":\"" + username + "\",\n" +
                "\t\"password\":\"" + password + "\"\n" +
                "}";
    }

    public static String createTokenRequestWithUserGroup(String username, String password, String userGroup) {
        return "{\n" +
                "\t\"userGroup\": \"DEALER\",\n" +
                "\t\"username\":\"" + username + "\",\n" +
                "\t\"password\":\"" + password + "\"\n" +
                "\t\"password\":\"" + userGroup + "\"\n" +
                "}";
    }

    public static String requestSupplier(String supplierSender,String storeCode, String imei1, String imei2, String imei3, String imei4) {

        return "{\n" +
                "\t\"lastUpdatedDateTime\": null,\n" +
                "\t\"createdDateTime\": null,\n" +
                "\t\"supplierCode\": \"bstar\",\n" +
                "\t\"receiptNo\": \"" + supplierSender + "\",\n" +
                "\t\"storeCode\":\"" + storeCode + "\",\n" +
                "\t\"versionNumber\": \"9\",\n" +
                "\t\"note\": \"Tedarik\u00E7i Notu Alan\u0131 Test\",\n" +
                "\t\"customerInfo\": {\n" +
                "\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\"createdDateTime\": null,\n" +
                "\t\t\"name\": \"name\",\n" +
                "\t\t\"storeCode\":\"" + storeCode + "\",\n" +
                "\t\t\"taxNumber\": \"asd\",\n" +
                "\t\t\"address\": \"adres\",\n" +
                "\t\t\"district\": \"distict\",\n" +
                "\t\t\"city\": \"city\",\n" +
                "\t\t\"phone\": \"1234\"\n" +
                "\t},\n" +
                "\t\"totalPriceInfo\": {\n" +
                "\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\"createdDateTime\": null,\n" +
                "\t\t\"vat\": 2,\n" +
                "\t\t\"price\": 10,\n" +
                "\t\t\"vatInclusivePrice\": 8,\n" +
                "\t\t\"discount\": 3,\n" +
                "\t\t\"discountRatio\": 1,\n" +
                "\t\t\"currency\": null\n" +
                "\t},\n" +
                "\t\"skuInfoList\": [\n" +
                "\t\t{\n" +
                "\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\"sku\": \"IPH0175\",\n" +
                "\t\t\t\"quantity\": 4,\n" +
                "\t\t\t\"skuPriceInfo\": {\n" +
                "\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\"vat\": 2,\n" +
                "\t\t\t\t\"price\": 10,\n" +
                "\t\t\t\t\"vatInclusivePrice\": 8,\n" +
                "\t\t\t\t\"discount\": 3,\n" +
                "\t\t\t\t\"discountRatio\": 1,\n" +
                "\t\t\t\t\"currency\": null\n" +
                "\t\t\t},\n" +
                "\t\t\t\"recommendedPriceInfo\": {\n" +
                "\t\t\t\t\"vat\": \"10.0\",\n" +
                "\t\t\t\t\"price\": \"120.0\",\n" +
                "\t\t\t\t\"vatInclusivePrice\": \"120.0\",\n" +
                "\t\t\t\t\"discount\": \"10.0\",\n" +
                "\t\t\t\t\"discountRatio\": \"10.0\",\n" +
                "\t\t\t\t\"currency\": \"TRY\"\n" +
                "\t\t\t},\n" +
                "\t\t\t\"description\": \"descr\",\n" +
                "\t\t\t\"barcode\": \"190198044167\",\n" +
                "\t\t\t\"unitType\": \"NIU\",\n" +
                "\t\t\t\"campaignCode\": \"3\",\n" +
                "\t\t\t\"offerType\": \"TEMLIK\",\n" +
                "\t\t\t\"imeiInfoList\": [\n" +
                "\t\t\t\t{\n" +
                "\t\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\t\"imeiNo\":\"" + imei1 + "\",\n" +
                "\t\t\t\t\t\"dateExpired\": \"date\"\n" +
                "\t\t\t\t},\n" +
                "\t\t\t\t{\n" +
                "\t\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\t\"imeiNo\":\"" + imei2 + "\",\n" +
                "\t\t\t\t\t\"dateExpired\": \"date\"\n" +
                "\t\t\t\t},\n" +
                "\t\t\t\t{\n" +
                "\t\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\t\"imeiNo\":\"" + imei3 + "\",\n" +
                "\t\t\t\t\t\"dateExpired\": \"date\"\n" +
                "\t\t\t\t},\n" +
                "\t\t\t\t{\n" +
                "\t\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\t\"imeiNo\":\"" + imei4 + "\",\n" +
                "\t\t\t\t\t\"dateExpired\": \"date\"\n" +
                "\t\t\t\t}\n" +
                "\t\t\t]\n" +
                "\t\t}\n" +
                "\t]\n" +
                "}";
    }

    public static String supplierOrderWithInStockIMEIRequest(String supplierSender,String storeCode) {

        return "{\n" +
                "\t\"lastUpdatedDateTime\": null,\n" +
                "\t\"createdDateTime\": null,\n" +
                "\t\"supplierCode\": \"bstar\",\n" +
                "\t\"receiptNo\": \"" + supplierSender + "\",\n" +
                "\t\"storeCode\":\"" + storeCode + "\",\n" +
                "\t\"versionNumber\": \"9\",\n" +
                "\t\"note\": \"Tedarik\u00E7i Notu Alan\u0131 Test\",\n" +
                "\t\"customerInfo\": {\n" +
                "\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\"createdDateTime\": null,\n" +
                "\t\t\"name\": \"name\",\n" +
                "\t\t\"storeCode\":\"" + storeCode + "\",\n" +
                "\t\t\"taxNumber\": \"asd\",\n" +
                "\t\t\"address\": \"adres\",\n" +
                "\t\t\"district\": \"distict\",\n" +
                "\t\t\"city\": \"city\",\n" +
                "\t\t\"phone\": \"1234\"\n" +
                "\t},\n" +
                "\t\"totalPriceInfo\": {\n" +
                "\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\"createdDateTime\": null,\n" +
                "\t\t\"vat\": 2,\n" +
                "\t\t\"price\": 10,\n" +
                "\t\t\"vatInclusivePrice\": 8,\n" +
                "\t\t\"discount\": 3,\n" +
                "\t\t\"discountRatio\": 1,\n" +
                "\t\t\"currency\": null\n" +
                "\t},\n" +
                "\t\"skuInfoList\": [\n" +
                "\t\t{\n" +
                "\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\"sku\": \"IPH0175\",\n" +
                "\t\t\t\"quantity\": 1,\n" +
                "\t\t\t\"skuPriceInfo\": {\n" +
                "\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\"vat\": 2,\n" +
                "\t\t\t\t\"price\": 10,\n" +
                "\t\t\t\t\"vatInclusivePrice\": 8,\n" +
                "\t\t\t\t\"discount\": 3,\n" +
                "\t\t\t\t\"discountRatio\": 1,\n" +
                "\t\t\t\t\"currency\": null\n" +
                "\t\t\t},\n" +
                "\t\t\t\"recommendedPriceInfo\": {\n" +
                "\t\t\t\t\"vat\": \"10.0\",\n" +
                "\t\t\t\t\"price\": \"120.0\",\n" +
                "\t\t\t\t\"vatInclusivePrice\": \"120.0\",\n" +
                "\t\t\t\t\"discount\": \"10.0\",\n" +
                "\t\t\t\t\"discountRatio\": \"10.0\",\n" +
                "\t\t\t\t\"currency\": \"TRY\"\n" +
                "\t\t\t},\n" +
                "\t\t\t\"description\": \"descr\",\n" +
                "\t\t\t\"barcode\": \"190198044167\",\n" +
                "\t\t\t\"unitType\": \"NIU\",\n" +
                "\t\t\t\"campaignCode\": \"3\",\n" +
                "\t\t\t\"offerType\": \"TEMLIK\",\n" +
                "\t\t\t\"imeiInfoList\": [\n" +
                "\t\t\t\t{\n" +
                "\t\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\t\"imeiNo\":\"" + AutomationConstants.inStockIMEI + "\",\n" +
                "\t\t\t\t\t\"dateExpired\": \"date\"\n" +
                "\t\t\t\t}\n" +
                "\t\t\t]\n" +
                "\t\t}\n" +
                "\t]\n" +
                "}";
    }

    public static String supplierOrderWithInStockAndNonStockIMEIRequest(String supplierSender, String storeCode, String imei1, String imei2, String imei3, String imei4) {
        return "{\n" +
                "\t\"lastUpdatedDateTime\": null,\n" +
                "\t\"createdDateTime\": null,\n" +
                "\t\"supplierCode\": \"bstar\",\n" +
                "\t\"receiptNo\": \"" + supplierSender + "\",\n" +
                "\t\"storeCode\":\"" + storeCode + "\",\n" +
                "\t\"versionNumber\": \"9\",\n" +
                "\t\"note\": \"Tedarik\u00E7i Notu Alan\u0131 Test\",\n" +
                "\t\"customerInfo\": {\n" +
                "\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\"createdDateTime\": null,\n" +
                "\t\t\"name\": \"name\",\n" +
                "\t\t\"storeCode\":\"" + storeCode + "\",\n" +
                "\t\t\"taxNumber\": \"asd\",\n" +
                "\t\t\"address\": \"adres\",\n" +
                "\t\t\"district\": \"distict\",\n" +
                "\t\t\"city\": \"city\",\n" +
                "\t\t\"phone\": \"1234\"\n" +
                "\t},\n" +
                "\t\"totalPriceInfo\": {\n" +
                "\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\"createdDateTime\": null,\n" +
                "\t\t\"vat\": 2,\n" +
                "\t\t\"price\": 10,\n" +
                "\t\t\"vatInclusivePrice\": 8,\n" +
                "\t\t\"discount\": 3,\n" +
                "\t\t\"discountRatio\": 1,\n" +
                "\t\t\"currency\": null\n" +
                "\t},\n" +
                "\t\"skuInfoList\": [\n" +
                "\t\t{\n" +
                "\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\"sku\": \"IPH0175\",\n" +
                "\t\t\t\"quantity\": 4,\n" +
                "\t\t\t\"skuPriceInfo\": {\n" +
                "\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\"vat\": 2,\n" +
                "\t\t\t\t\"price\": 10,\n" +
                "\t\t\t\t\"vatInclusivePrice\": 8,\n" +
                "\t\t\t\t\"discount\": 3,\n" +
                "\t\t\t\t\"discountRatio\": 1,\n" +
                "\t\t\t\t\"currency\": null\n" +
                "\t\t\t},\n" +
                "\t\t\t\"recommendedPriceInfo\": {\n" +
                "\t\t\t\t\"vat\": \"10.0\",\n" +
                "\t\t\t\t\"price\": \"120.0\",\n" +
                "\t\t\t\t\"vatInclusivePrice\": \"120.0\",\n" +
                "\t\t\t\t\"discount\": \"10.0\",\n" +
                "\t\t\t\t\"discountRatio\": \"10.0\",\n" +
                "\t\t\t\t\"currency\": \"TRY\"\n" +
                "\t\t\t},\n" +
                "\t\t\t\"description\": \"descr\",\n" +
                "\t\t\t\"barcode\": \"190198044167\",\n" +
                "\t\t\t\"unitType\": \"NIU\",\n" +
                "\t\t\t\"campaignCode\": \"3\",\n" +
                "\t\t\t\"offerType\": \"TEMLIK\",\n" +
                "\t\t\t\"imeiInfoList\": [\n" +
                "\t\t\t\t{\n" +
                "\t\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\t\"imeiNo\":\"" + imei1 + "\",\n" +
                "\t\t\t\t\t\"dateExpired\": \"date\"\n" +
                "\t\t\t\t},\n" +
                "\t\t\t\t{\n" +
                "\t\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\t\"imeiNo\":\"" + imei2 + "\",\n" +
                "\t\t\t\t\t\"dateExpired\": \"date\"\n" +
                "\t\t\t\t},\n" +
                "\t\t\t\t{\n" +
                "\t\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\t\"imeiNo\":\"" + imei3 + "\",\n" +
                "\t\t\t\t\t\"dateExpired\": \"date\"\n" +
                "\t\t\t\t},\n" +
                "\t\t\t\t{\n" +
                "\t\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\t\"imeiNo\":\"" + imei4 + "\",\n" +
                "\t\t\t\t\t\"dateExpired\": \"date\"\n" +
                "\t\t\t\t}\n" +
                "\t\t\t]\n" +
                "\t\t}\n" +
                "\t]\n" +
                "}";
    }

    public static String supplierOrderWithDuplicateIMEIsUnderSameBarcodeRequest(String supplierSender, String storeCode, String imei1) {
        return "{\n" +
                "\t\"lastUpdatedDateTime\": null,\n" +
                "\t\"createdDateTime\": null,\n" +
                "\t\"supplierCode\": \"bstar\",\n" +
                "\t\"receiptNo\": \"" + supplierSender + "\",\n" +
                "\t\"storeCode\":\"" + storeCode + "\",\n" +
                "\t\"versionNumber\": \"9\",\n" +
                "\t\"note\": \"Tedarik\u00E7i Notu Alan\u0131 Test\",\n" +
                "\t\"customerInfo\": {\n" +
                "\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\"createdDateTime\": null,\n" +
                "\t\t\"name\": \"name\",\n" +
                "\t\t\"storeCode\":\"" + storeCode + "\",\n" +
                "\t\t\"taxNumber\": \"asd\",\n" +
                "\t\t\"address\": \"adres\",\n" +
                "\t\t\"district\": \"distict\",\n" +
                "\t\t\"city\": \"city\",\n" +
                "\t\t\"phone\": \"1234\"\n" +
                "\t},\n" +
                "\t\"totalPriceInfo\": {\n" +
                "\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\"createdDateTime\": null,\n" +
                "\t\t\"vat\": 2,\n" +
                "\t\t\"price\": 10,\n" +
                "\t\t\"vatInclusivePrice\": 8,\n" +
                "\t\t\"discount\": 3,\n" +
                "\t\t\"discountRatio\": 1,\n" +
                "\t\t\"currency\": null\n" +
                "\t},\n" +
                "\t\"skuInfoList\": [\n" +
                "\t\t{\n" +
                "\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\"sku\": \"IPH0175\",\n" +
                "\t\t\t\"quantity\": 2,\n" +
                "\t\t\t\"skuPriceInfo\": {\n" +
                "\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\"vat\": 2,\n" +
                "\t\t\t\t\"price\": 10,\n" +
                "\t\t\t\t\"vatInclusivePrice\": 8,\n" +
                "\t\t\t\t\"discount\": 3,\n" +
                "\t\t\t\t\"discountRatio\": 1,\n" +
                "\t\t\t\t\"currency\": null\n" +
                "\t\t\t},\n" +
                "\t\t\t\"recommendedPriceInfo\": {\n" +
                "\t\t\t\t\"vat\": \"10.0\",\n" +
                "\t\t\t\t\"price\": \"120.0\",\n" +
                "\t\t\t\t\"vatInclusivePrice\": \"120.0\",\n" +
                "\t\t\t\t\"discount\": \"10.0\",\n" +
                "\t\t\t\t\"discountRatio\": \"10.0\",\n" +
                "\t\t\t\t\"currency\": \"TRY\"\n" +
                "\t\t\t},\n" +
                "\t\t\t\"description\": \"descr\",\n" +
                "\t\t\t\"barcode\": \"190198044167\",\n" +
                "\t\t\t\"unitType\": \"NIU\",\n" +
                "\t\t\t\"campaignCode\": \"3\",\n" +
                "\t\t\t\"offerType\": \"TEMLIK\",\n" +
                "\t\t\t\"imeiInfoList\": [\n" +
                "\t\t\t\t{\n" +
                "\t\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\t\"imeiNo\":\"" + imei1 + "\",\n" +
                "\t\t\t\t\t\"dateExpired\": \"date\"\n" +
                "\t\t\t\t},\n" +
                "\t\t\t\t{\n" +
                "\t\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\t\"imeiNo\":\"" + imei1 + "\",\n" +
                "\t\t\t\t\t\"dateExpired\": \"date\"\n" +
                "\t\t\t\t}\n" +
                "\t\t\t]\n" +
                "\t\t}\n" +
                "\t]\n" +
                "}";
    }

    public static String supplierOrderWithDuplicateIMEIsUnderDifferentBarcodesRequest(String supplierSender, String storeCode, String imei1) {
        return "{\n" +
                "\t\"lastUpdatedDateTime\": null,\n" +
                "\t\"createdDateTime\": null,\n" +
                "\t\"supplierCode\": \"bstar\",\n" +
                "\t\"receiptNo\": \"" + supplierSender + "\",\n" +
                "\t\"storeCode\":\"" + storeCode + "\",\n" +
                "\t\"versionNumber\": \"9\",\n" +
                "\t\"note\": \"Tedarik\u00E7i Notu Alan\u0131 Test\",\n" +
                "\t\"customerInfo\": {\n" +
                "\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\"createdDateTime\": null,\n" +
                "\t\t\"name\": \"name\",\n" +
                "\t\t\"storeCode\":\"" + storeCode + "\",\n" +
                "\t\t\"taxNumber\": \"asd\",\n" +
                "\t\t\"address\": \"adres\",\n" +
                "\t\t\"district\": \"distict\",\n" +
                "\t\t\"city\": \"city\",\n" +
                "\t\t\"phone\": \"1234\"\n" +
                "\t},\n" +
                "\t\"totalPriceInfo\": {\n" +
                "\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\"createdDateTime\": null,\n" +
                "\t\t\"vat\": 2,\n" +
                "\t\t\"price\": 10,\n" +
                "\t\t\"vatInclusivePrice\": 8,\n" +
                "\t\t\"discount\": 3,\n" +
                "\t\t\"discountRatio\": 1,\n" +
                "\t\t\"currency\": null\n" +
                "\t},\n" +
                "\t\"skuInfoList\": [\n" +
                "\t\t{\n" +
                "\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\"sku\": \"IPH0175\",\n" +
                "\t\t\t\"quantity\": 1,\n" +
                "\t\t\t\"skuPriceInfo\": {\n" +
                "\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\"vat\": 2,\n" +
                "\t\t\t\t\"price\": 10,\n" +
                "\t\t\t\t\"vatInclusivePrice\": 8,\n" +
                "\t\t\t\t\"discount\": 3,\n" +
                "\t\t\t\t\"discountRatio\": 1,\n" +
                "\t\t\t\t\"currency\": null\n" +
                "\t\t\t},\n" +
                "\t\t\t\"recommendedPriceInfo\": {\n" +
                "\t\t\t\t\"vat\": \"10.0\",\n" +
                "\t\t\t\t\"price\": \"120.0\",\n" +
                "\t\t\t\t\"vatInclusivePrice\": \"120.0\",\n" +
                "\t\t\t\t\"discount\": \"10.0\",\n" +
                "\t\t\t\t\"discountRatio\": \"10.0\",\n" +
                "\t\t\t\t\"currency\": \"TRY\"\n" +
                "\t\t\t},\n" +
                "\t\t\t\"description\": \"descr\",\n" +
                "\t\t\t\"barcode\": \"190198044167\",\n" +
                "\t\t\t\"unitType\": \"NIU\",\n" +
                "\t\t\t\"campaignCode\": \"3\",\n" +
                "\t\t\t\"offerType\": \"TEMLIK\",\n" +
                "\t\t\t\"imeiInfoList\": [\n" +
                "\t\t\t\t{\n" +
                "\t\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\t\"imeiNo\":\"" + imei1 + "\",\n" +
                "\t\t\t\t\t\"dateExpired\": \"date\"\n" +
                "\t\t\t\t}\n" +
                "\t\t\t]\n" +
                "\t\t},\n" +
                "\t\t{\n" +
                "\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\"sku\": \"HMT0005\",\n" +
                "\t\t\t\"quantity\": 1,\n" +
                "\t\t\t\"skuPriceInfo\": {\n" +
                "\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\"vat\": 2,\n" +
                "\t\t\t\t\"price\": 10,\n" +
                "\t\t\t\t\"vatInclusivePrice\": 8,\n" +
                "\t\t\t\t\"discount\": 3,\n" +
                "\t\t\t\t\"discountRatio\": 1,\n" +
                "\t\t\t\t\"currency\": null\n" +
                "\t\t\t},\n" +
                "\t\t\t\"recommendedPriceInfo\": {\n" +
                "\t\t\t\t\"vat\": \"10.0\",\n" +
                "\t\t\t\t\"price\": \"120.0\",\n" +
                "\t\t\t\t\"vatInclusivePrice\": \"120.0\",\n" +
                "\t\t\t\t\"discount\": \"10.0\",\n" +
                "\t\t\t\t\"discountRatio\": \"10.0\",\n" +
                "\t\t\t\t\"currency\": \"TRY\"\n" +
                "\t\t\t},\n" +
                "\t\t\t\"description\": \"descr\",\n" +
                "\t\t\t\"barcode\": \"8692751059875\",\n" +
                "\t\t\t\"unitType\": \"NIU\",\n" +
                "\t\t\t\"campaignCode\": \"3\",\n" +
                "\t\t\t\"offerType\": \"TEMLIK\",\n" +
                "\t\t\t\"imeiInfoList\": [\n" +
                "\t\t\t\t{\n" +
                "\t\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\t\"imeiNo\":\"" + imei1 + "\",\n" +
                "\t\t\t\t\t\"dateExpired\": \"date\"\n" +
                "\t\t\t\t}" +
                "\t\t\t]\n" +
                "\t\t}\n" +
                "\t]\n" +
                "}";
    }

    public static String supplierOrderWithNonExistentBarcode(String supplierSender, String storeCode, String barcode, String imei1) {
        return "{\n" +
                "\t\"lastUpdatedDateTime\": null,\n" +
                "\t\"createdDateTime\": null,\n" +
                "\t\"supplierCode\": \"bstar\",\n" +
                "\t\"receiptNo\": \"" + supplierSender + "\",\n" +
                "\t\"storeCode\":\"" + storeCode + "\",\n" +
                "\t\"versionNumber\": \"9\",\n" +
                "\t\"note\": \"Tedarik\u00E7i Notu Alan\u0131 Test\",\n" +
                "\t\"customerInfo\": {\n" +
                "\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\"createdDateTime\": null,\n" +
                "\t\t\"name\": \"name\",\n" +
                "\t\t\"storeCode\":\"" + storeCode + "\",\n" +
                "\t\t\"taxNumber\": \"asd\",\n" +
                "\t\t\"address\": \"adres\",\n" +
                "\t\t\"district\": \"distict\",\n" +
                "\t\t\"city\": \"city\",\n" +
                "\t\t\"phone\": \"1234\"\n" +
                "\t},\n" +
                "\t\"totalPriceInfo\": {\n" +
                "\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\"createdDateTime\": null,\n" +
                "\t\t\"vat\": 2,\n" +
                "\t\t\"price\": 10,\n" +
                "\t\t\"vatInclusivePrice\": 8,\n" +
                "\t\t\"discount\": 3,\n" +
                "\t\t\"discountRatio\": 1,\n" +
                "\t\t\"currency\": null\n" +
                "\t},\n" +
                "\t\"skuInfoList\": [\n" +
                "\t\t{\n" +
                "\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\"sku\": \"IPH0175\",\n" +
                "\t\t\t\"quantity\": 1,\n" +
                "\t\t\t\"skuPriceInfo\": {\n" +
                "\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\"vat\": 2,\n" +
                "\t\t\t\t\"price\": 10,\n" +
                "\t\t\t\t\"vatInclusivePrice\": 8,\n" +
                "\t\t\t\t\"discount\": 3,\n" +
                "\t\t\t\t\"discountRatio\": 1,\n" +
                "\t\t\t\t\"currency\": null\n" +
                "\t\t\t},\n" +
                "\t\t\t\"recommendedPriceInfo\": {\n" +
                "\t\t\t\t\"vat\": \"10.0\",\n" +
                "\t\t\t\t\"price\": \"120.0\",\n" +
                "\t\t\t\t\"vatInclusivePrice\": \"120.0\",\n" +
                "\t\t\t\t\"discount\": \"10.0\",\n" +
                "\t\t\t\t\"discountRatio\": \"10.0\",\n" +
                "\t\t\t\t\"currency\": \"TRY\"\n" +
                "\t\t\t},\n" +
                "\t\t\t\"description\": \"descr\",\n" +
                "\t\t\t\"barcode\": \"" + barcode + "\",\n" +
                "\t\t\t\"unitType\": \"NIU\",\n" +
                "\t\t\t\"campaignCode\": \"3\",\n" +
                "\t\t\t\"offerType\": \"TEMLIK\",\n" +
                "\t\t\t\"imeiInfoList\": [\n" +
                "\t\t\t\t{\n" +
                "\t\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\t\"imeiNo\":\"" + imei1 + "\",\n" +
                "\t\t\t\t\t\"dateExpired\": \"date\"\n" +
                "\t\t\t\t}\n" +
                "\t\t\t]\n" +
                "\t\t}\n" +
                "\t]\n" +
                "}";
    }

    public static String supplierOrderWithNonExistentSku(String supplierSender, String storeCode, String sku, String ime1) {
        return "{\n" +
                "\t\"lastUpdatedDateTime\": null,\n" +
                "\t\"createdDateTime\": null,\n" +
                "\t\"supplierCode\": \"bstar\",\n" +
                "\t\"receiptNo\": \"" + supplierSender + "\",\n" +
                "\t\"storeCode\":\"" + storeCode + "\",\n" +
                "\t\"versionNumber\": \"9\",\n" +
                "\t\"note\": \"Tedarik\u00E7i Notu Alan\u0131 Test\",\n" +
                "\t\"customerInfo\": {\n" +
                "\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\"createdDateTime\": null,\n" +
                "\t\t\"name\": \"name\",\n" +
                "\t\t\"storeCode\":\"" + storeCode + "\",\n" +
                "\t\t\"taxNumber\": \"asd\",\n" +
                "\t\t\"address\": \"adres\",\n" +
                "\t\t\"district\": \"distict\",\n" +
                "\t\t\"city\": \"city\",\n" +
                "\t\t\"phone\": \"1234\"\n" +
                "\t},\n" +
                "\t\"totalPriceInfo\": {\n" +
                "\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\"createdDateTime\": null,\n" +
                "\t\t\"vat\": 2,\n" +
                "\t\t\"price\": 10,\n" +
                "\t\t\"vatInclusivePrice\": 8,\n" +
                "\t\t\"discount\": 3,\n" +
                "\t\t\"discountRatio\": 1,\n" +
                "\t\t\"currency\": null\n" +
                "\t},\n" +
                "\t\"skuInfoList\": [\n" +
                "\t\t{\n" +
                "\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\"sku\": \"" + sku + "\",\n" +
                "\t\t\t\"quantity\": 1,\n" +
                "\t\t\t\"skuPriceInfo\": {\n" +
                "\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\"vat\": 2,\n" +
                "\t\t\t\t\"price\": 10,\n" +
                "\t\t\t\t\"vatInclusivePrice\": 8,\n" +
                "\t\t\t\t\"discount\": 3,\n" +
                "\t\t\t\t\"discountRatio\": 1,\n" +
                "\t\t\t\t\"currency\": null\n" +
                "\t\t\t},\n" +
                "\t\t\t\"recommendedPriceInfo\": {\n" +
                "\t\t\t\t\"vat\": \"10.0\",\n" +
                "\t\t\t\t\"price\": \"120.0\",\n" +
                "\t\t\t\t\"vatInclusivePrice\": \"120.0\",\n" +
                "\t\t\t\t\"discount\": \"10.0\",\n" +
                "\t\t\t\t\"discountRatio\": \"10.0\",\n" +
                "\t\t\t\t\"currency\": \"TRY\"\n" +
                "\t\t\t},\n" +
                "\t\t\t\"description\": \"descr\",\n" +
                "\t\t\t\"barcode\": \"190198044167\",\n" +
                "\t\t\t\"unitType\": \"NIU\",\n" +
                "\t\t\t\"campaignCode\": \"3\",\n" +
                "\t\t\t\"offerType\": \"TEMLIK\",\n" +
                "\t\t\t\"imeiInfoList\": [\n" +
                "\t\t\t\t{\n" +
                "\t\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\t\"imeiNo\":\"" + ime1 + "\",\n" +
                "\t\t\t\t\t\"dateExpired\": \"date\"\n" +
                "\t\t\t\t}\n" +
                "\t\t\t]\n" +
                "\t\t}\n" +
                "\t]\n" +
                "}";
    }

    public static String supplierOrderWithInvalidIMEI(String supplierSender, String storeCode, String imei) {
        return  "{\n" +
                "\t\"lastUpdatedDateTime\": null,\n" +
                "\t\"createdDateTime\": null,\n" +
                "\t\"supplierCode\": \"bstar\",\n" +
                "\t\"receiptNo\": \"" + supplierSender + "\",\n" +
                "\t\"storeCode\":\"" + storeCode + "\",\n" +
                "\t\"versionNumber\": \"9\",\n" +
                "\t\"note\": \"Tedarik\u00E7i Notu Alan\u0131 Test\",\n" +
                "\t\"customerInfo\": {\n" +
                "\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\"createdDateTime\": null,\n" +
                "\t\t\"name\": \"name\",\n" +
                "\t\t\"storeCode\":\"" + storeCode + "\",\n" +
                "\t\t\"taxNumber\": \"asd\",\n" +
                "\t\t\"address\": \"adres\",\n" +
                "\t\t\"district\": \"distict\",\n" +
                "\t\t\"city\": \"city\",\n" +
                "\t\t\"phone\": \"1234\"\n" +
                "\t},\n" +
                "\t\"totalPriceInfo\": {\n" +
                "\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\"createdDateTime\": null,\n" +
                "\t\t\"vat\": 2,\n" +
                "\t\t\"price\": 10,\n" +
                "\t\t\"vatInclusivePrice\": 8,\n" +
                "\t\t\"discount\": 3,\n" +
                "\t\t\"discountRatio\": 1,\n" +
                "\t\t\"currency\": null\n" +
                "\t},\n" +
                "\t\"skuInfoList\": [\n" +
                "\t\t{\n" +
                "\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\"sku\": \"IPH0175\",\n" +
                "\t\t\t\"quantity\": 1,\n" +
                "\t\t\t\"skuPriceInfo\": {\n" +
                "\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\"vat\": 2,\n" +
                "\t\t\t\t\"price\": 10,\n" +
                "\t\t\t\t\"vatInclusivePrice\": 8,\n" +
                "\t\t\t\t\"discount\": 3,\n" +
                "\t\t\t\t\"discountRatio\": 1,\n" +
                "\t\t\t\t\"currency\": null\n" +
                "\t\t\t},\n" +
                "\t\t\t\"recommendedPriceInfo\": {\n" +
                "\t\t\t\t\"vat\": \"10.0\",\n" +
                "\t\t\t\t\"price\": \"120.0\",\n" +
                "\t\t\t\t\"vatInclusivePrice\": \"120.0\",\n" +
                "\t\t\t\t\"discount\": \"10.0\",\n" +
                "\t\t\t\t\"discountRatio\": \"10.0\",\n" +
                "\t\t\t\t\"currency\": \"TRY\"\n" +
                "\t\t\t},\n" +
                "\t\t\t\"description\": \"descr\",\n" +
                "\t\t\t\"barcode\": \"190198044167\",\n" +
                "\t\t\t\"unitType\": \"NIU\",\n" +
                "\t\t\t\"campaignCode\": \"3\",\n" +
                "\t\t\t\"offerType\": \"TEMLIK\",\n" +
                "\t\t\t\"imeiInfoList\": [\n" +
                "\t\t\t\t{\n" +
                "\t\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\t\"imeiNo\":\"" + imei + "\",\n" +
                "\t\t\t\t\t\"dateExpired\": \"date\"\n" +
                "\t\t\t\t}\n" +
                "\t\t\t]\n" +
                "\t\t}\n" +
                "\t]\n" +
                "}";
    }

    public static String supplierOrderWithNonMatchingSKU(String supplierSender, String storeCode, String barcode, String sku, String ime1) {
        return "{\n" +
                "\t\"lastUpdatedDateTime\": null,\n" +
                "\t\"createdDateTime\": null,\n" +
                "\t\"supplierCode\": \"bstar\",\n" +
                "\t\"receiptNo\": \"" + supplierSender + "\",\n" +
                "\t\"storeCode\":\"" + storeCode + "\",\n" +
                "\t\"versionNumber\": \"9\",\n" +
                "\t\"note\": \"Tedarik\u00E7i Notu Alan\u0131 Test\",\n" +
                "\t\"customerInfo\": {\n" +
                "\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\"createdDateTime\": null,\n" +
                "\t\t\"name\": \"name\",\n" +
                "\t\t\"storeCode\":\"" + storeCode + "\",\n" +
                "\t\t\"taxNumber\": \"asd\",\n" +
                "\t\t\"address\": \"adres\",\n" +
                "\t\t\"district\": \"distict\",\n" +
                "\t\t\"city\": \"city\",\n" +
                "\t\t\"phone\": \"1234\"\n" +
                "\t},\n" +
                "\t\"totalPriceInfo\": {\n" +
                "\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\"createdDateTime\": null,\n" +
                "\t\t\"vat\": 2,\n" +
                "\t\t\"price\": 10,\n" +
                "\t\t\"vatInclusivePrice\": 8,\n" +
                "\t\t\"discount\": 3,\n" +
                "\t\t\"discountRatio\": 1,\n" +
                "\t\t\"currency\": null\n" +
                "\t},\n" +
                "\t\"skuInfoList\": [\n" +
                "\t\t{\n" +
                "\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\"sku\": \"" + sku + "\",\n" +
                "\t\t\t\"quantity\": 1,\n" +
                "\t\t\t\"skuPriceInfo\": {\n" +
                "\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\"vat\": 2,\n" +
                "\t\t\t\t\"price\": 10,\n" +
                "\t\t\t\t\"vatInclusivePrice\": 8,\n" +
                "\t\t\t\t\"discount\": 3,\n" +
                "\t\t\t\t\"discountRatio\": 1,\n" +
                "\t\t\t\t\"currency\": null\n" +
                "\t\t\t},\n" +
                "\t\t\t\"recommendedPriceInfo\": {\n" +
                "\t\t\t\t\"vat\": \"10.0\",\n" +
                "\t\t\t\t\"price\": \"120.0\",\n" +
                "\t\t\t\t\"vatInclusivePrice\": \"120.0\",\n" +
                "\t\t\t\t\"discount\": \"10.0\",\n" +
                "\t\t\t\t\"discountRatio\": \"10.0\",\n" +
                "\t\t\t\t\"currency\": \"TRY\"\n" +
                "\t\t\t},\n" +
                "\t\t\t\"description\": \"descr\",\n" +
                "\t\t\t\"barcode\": \""+ barcode +"\",\n" +
                "\t\t\t\"unitType\": \"NIU\",\n" +
                "\t\t\t\"campaignCode\": \"3\",\n" +
                "\t\t\t\"offerType\": \"TEMLIK\",\n" +
                "\t\t\t\"imeiInfoList\": [\n" +
                "\t\t\t\t{\n" +
                "\t\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\t\"imeiNo\":\"" + ime1 + "\",\n" +
                "\t\t\t\t\t\"dateExpired\": \"date\"\n" +
                "\t\t\t\t}\n" +
                "\t\t\t]\n" +
                "\t\t}\n" +
                "\t]\n" +
                "}";
    }

    public static String supplierOrderWithExistentReceiptNoAndVersionNo(String supplierSender, String storeCode, String imei) {
        return  "{\n" +
                "\t\"lastUpdatedDateTime\": null,\n" +
                "\t\"createdDateTime\": null,\n" +
                "\t\"supplierCode\": \"bstar\",\n" +
                "\t\"receiptNo\": \"" + supplierSender + "\",\n" +
                "\t\"storeCode\":\"" + storeCode + "\",\n" +
                "\t\"versionNumber\": \"" + AutomationConstants.versionNumber + "\",\n" +
                "\t\"note\": \"Tedarik\u00E7i Notu Alan\u0131 Test\",\n" +
                "\t\"customerInfo\": {\n" +
                "\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\"createdDateTime\": null,\n" +
                "\t\t\"name\": \"name\",\n" +
                "\t\t\"storeCode\":\"" + storeCode + "\",\n" +
                "\t\t\"taxNumber\": \"asd\",\n" +
                "\t\t\"address\": \"adres\",\n" +
                "\t\t\"district\": \"distict\",\n" +
                "\t\t\"city\": \"city\",\n" +
                "\t\t\"phone\": \"1234\"\n" +
                "\t},\n" +
                "\t\"totalPriceInfo\": {\n" +
                "\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\"createdDateTime\": null,\n" +
                "\t\t\"vat\": 2,\n" +
                "\t\t\"price\": 10,\n" +
                "\t\t\"vatInclusivePrice\": 8,\n" +
                "\t\t\"discount\": 3,\n" +
                "\t\t\"discountRatio\": 1,\n" +
                "\t\t\"currency\": null\n" +
                "\t},\n" +
                "\t\"skuInfoList\": [\n" +
                "\t\t{\n" +
                "\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\"sku\": \"IPH0175\",\n" +
                "\t\t\t\"quantity\": 1,\n" +
                "\t\t\t\"skuPriceInfo\": {\n" +
                "\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\"vat\": 2,\n" +
                "\t\t\t\t\"price\": 10,\n" +
                "\t\t\t\t\"vatInclusivePrice\": 8,\n" +
                "\t\t\t\t\"discount\": 3,\n" +
                "\t\t\t\t\"discountRatio\": 1,\n" +
                "\t\t\t\t\"currency\": null\n" +
                "\t\t\t},\n" +
                "\t\t\t\"recommendedPriceInfo\": {\n" +
                "\t\t\t\t\"vat\": \"10.0\",\n" +
                "\t\t\t\t\"price\": \"120.0\",\n" +
                "\t\t\t\t\"vatInclusivePrice\": \"120.0\",\n" +
                "\t\t\t\t\"discount\": \"10.0\",\n" +
                "\t\t\t\t\"discountRatio\": \"10.0\",\n" +
                "\t\t\t\t\"currency\": \"TRY\"\n" +
                "\t\t\t},\n" +
                "\t\t\t\"description\": \"descr\",\n" +
                "\t\t\t\"barcode\": \"190198044167\",\n" +
                "\t\t\t\"unitType\": \"NIU\",\n" +
                "\t\t\t\"campaignCode\": \"3\",\n" +
                "\t\t\t\"offerType\": \"TEMLIK\",\n" +
                "\t\t\t\"imeiInfoList\": [\n" +
                "\t\t\t\t{\n" +
                "\t\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\t\"imeiNo\":\"" + imei + "\",\n" +
                "\t\t\t\t\t\"dateExpired\": \"date\"\n" +
                "\t\t\t\t}\n" +
                "\t\t\t]\n" +
                "\t\t}\n" +
                "\t]\n" +
                "}";
    }

    public static String supplierOrderWithExistentReceiptNoAndDifferentVersionNo(String supplierSender, String storeCode, String imei1, String imei2, String imei3, String imei4) {
        return "{\n" +
                "\t\"lastUpdatedDateTime\": null,\n" +
                "\t\"createdDateTime\": null,\n" +
                "\t\"supplierCode\": \"bstar\",\n" +
                "\t\"receiptNo\": \"" + supplierSender + "\",\n" +
                "\t\"storeCode\":\"" + storeCode + "\",\n" +
                "\t\"versionNumber\": \"10\",\n" +
                "\t\"note\": \"Tedarik\u00E7i Notu Alan\u0131 Test\",\n" +
                "\t\"customerInfo\": {\n" +
                "\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\"createdDateTime\": null,\n" +
                "\t\t\"name\": \"name\",\n" +
                "\t\t\"storeCode\":\"" + storeCode + "\",\n" +
                "\t\t\"taxNumber\": \"asd\",\n" +
                "\t\t\"address\": \"adres\",\n" +
                "\t\t\"district\": \"distict\",\n" +
                "\t\t\"city\": \"city\",\n" +
                "\t\t\"phone\": \"1234\"\n" +
                "\t},\n" +
                "\t\"totalPriceInfo\": {\n" +
                "\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\"createdDateTime\": null,\n" +
                "\t\t\"vat\": 2,\n" +
                "\t\t\"price\": 10,\n" +
                "\t\t\"vatInclusivePrice\": 8,\n" +
                "\t\t\"discount\": 3,\n" +
                "\t\t\"discountRatio\": 1,\n" +
                "\t\t\"currency\": null\n" +
                "\t},\n" +
                "\t\"skuInfoList\": [\n" +
                "\t\t{\n" +
                "\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\"sku\": \"IPH0175\",\n" +
                "\t\t\t\"quantity\": 4,\n" +
                "\t\t\t\"skuPriceInfo\": {\n" +
                "\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\"vat\": 2,\n" +
                "\t\t\t\t\"price\": 10,\n" +
                "\t\t\t\t\"vatInclusivePrice\": 8,\n" +
                "\t\t\t\t\"discount\": 3,\n" +
                "\t\t\t\t\"discountRatio\": 1,\n" +
                "\t\t\t\t\"currency\": null\n" +
                "\t\t\t},\n" +
                "\t\t\t\"recommendedPriceInfo\": {\n" +
                "\t\t\t\t\"vat\": \"10.0\",\n" +
                "\t\t\t\t\"price\": \"120.0\",\n" +
                "\t\t\t\t\"vatInclusivePrice\": \"120.0\",\n" +
                "\t\t\t\t\"discount\": \"10.0\",\n" +
                "\t\t\t\t\"discountRatio\": \"10.0\",\n" +
                "\t\t\t\t\"currency\": \"TRY\"\n" +
                "\t\t\t},\n" +
                "\t\t\t\"description\": \"descr\",\n" +
                "\t\t\t\"barcode\": \"190198044167\",\n" +
                "\t\t\t\"unitType\": \"NIU\",\n" +
                "\t\t\t\"campaignCode\": \"3\",\n" +
                "\t\t\t\"offerType\": \"TEMLIK\",\n" +
                "\t\t\t\"imeiInfoList\": [\n" +
                "\t\t\t\t{\n" +
                "\t\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\t\"imeiNo\":\"" + imei1 + "\",\n" +
                "\t\t\t\t\t\"dateExpired\": \"date\"\n" +
                "\t\t\t\t},\n" +
                "\t\t\t\t{\n" +
                "\t\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\t\"imeiNo\":\"" + imei2 + "\",\n" +
                "\t\t\t\t\t\"dateExpired\": \"date\"\n" +
                "\t\t\t\t},\n" +
                "\t\t\t\t{\n" +
                "\t\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\t\"imeiNo\":\"" + imei3 + "\",\n" +
                "\t\t\t\t\t\"dateExpired\": \"date\"\n" +
                "\t\t\t\t},\n" +
                "\t\t\t\t{\n" +
                "\t\t\t\t\t\"lastUpdatedDateTime\": null,\n" +
                "\t\t\t\t\t\"createdDateTime\": null,\n" +
                "\t\t\t\t\t\"imeiNo\":\"" + imei4 + "\",\n" +
                "\t\t\t\t\t\"dateExpired\": \"date\"\n" +
                "\t\t\t\t}\n" +
                "\t\t\t]\n" +
                "\t\t}\n" +
                "\t]\n" +
                "}";
    }

    /*public static String createValidateStoreWithStoreCodeAndTransferAmountRequest(String storeCode, String transferAmount) {
        return "{\n" +
                "\t\"shopCode\": \""+ storeCode +"\",\n" +
                "\t\"amountAvailable\": \"\",\n" +
                "\t\"password\":\"" + password + "\"\n" +
                "\t\"supplierCode\": \"bstar\",\n" +
                "}";
    }*/
}
