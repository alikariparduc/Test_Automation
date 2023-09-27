package com.saf.framework;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AutomationConstants

{
	
	public static String sIEDriverPath      	= "/Exes/IEDriverServer.exe";
	public static String sChromeDriverPath  	= "/Exes/chromedriver.exe";
	public static String sGeckoDriverPath   	= "/Exes/geckodriver.exe";
	
	public static String sProxyHostName 		= "genproxy.amdocs.com";
	public static int iProxyPort 				= 8080;
	
	public static long lngPageLoadTimeout 		= 90L;
	public static long lngImplicitWaitTimeout	= 300L;
	
	public static String testDataPath = ".\\TestData\\";
	public static String CommonFileName = "COMMON.xlsx";
	
	public static String reportsDBName = "reports.db";


	public static Map<String, String> globalVariables = new HashMap<String, String>();

	
	public static int itestCaseID;


    public static String release_apiURL="http://cloud-gateway-rsmnsadsat.apps.mbt.vodafone.local/services/supplier/delivery/create-delivery-order";
    public static String test_apiURL="http://cloud-gateway-rsmnsaddev.apps.mbt.vodafone.local/services/supplier/delivery/create-delivery-order";

	public static String release_urlCreateToken="http://cloud-gateway-rsmnsadsat.apps.mbt.vodafone.local/services/auth/api/login";
	public static String test_urlCreateToken="http://cloud-gateway-rsmnsaddev.apps.mbt.vodafone.local/services/auth/api/login";

	public static String token;
	public static String ime1="";
	public static String ime2="";
	public static String imei3="";
	public static String imei4="";
	public static final String inStockIMEI = "333444555666777";
	public static String receiptNo = "";
	public static String versionNumber = "";

	public static String releaseConnectionString = "jdbc:oracle:thin:@//172.31.60.22:1521/srv_retckam";
	public static String testConnectionString = "jdbc:oracle:thin:@//172.31.60.22:1521/srv_retckdev";


	//STORE tablosu bilgileri
	public static String oracleUsernameForStore = "STORE";
	public static String oraclePasswordForStore = "STORE123*";

	//STOCK tablosu bilgileri
	public static String oracleUsernameForStock = "STOCK";
	public static String oraclePasswordForStock = "STOCK!";

	//SALES tablosu bilgileri
	public static String oracleUsernameForSales = "SALES";
	public static String oraclePasswordForSales = "SALES";

	//MEDIATOR tablosu bilgileri
	public static String oracleUsernameForMediator = "MEDIATOR";
	public static String oraclePasswordForMediator = "MEDIATOR";

	//ERP tablosu bilgileri
	public static String oracleUsernameForErp = "ERP";
	public static String oraclePasswordForErp = "ERP123*";

	//TRANSFER tablosu bilgileri
	public static String oracleUsernameForTransfer = "TRANSFER";
	public static String oraclePasswordForTransfer = "TRANSFER";

	//DASHBOARD tablosu bilgileri
	public static String oracleUsernameForDashboard = "DASHBOARD";
	public static String oraclePasswordForDashboard = "DASHBOARD123*";

	//SUPPLIER tablosu bilgileri
	public static String oracleUsernameForSupplier = "SUPPLIER";
	public static String oraclePasswordForSupplier = "SUPPLIER";

    public static String sessionId;
	public static String invoiceNo;
	public static String icciForQueryTest;
	public static final String icciForDeductionTest = "899002392607372700";
	public static String provisionId;

	public final static String stockReleaseBaseURL = "http://cloud-gateway-rsmnsadsat.apps.mbt.vodafone.local";

	public static String urlStockLogin = stockReleaseBaseURL + "/services/auth/api/login";
	public static String urlStockTakeIn = stockReleaseBaseURL + "/services/inventory/in/byStore";
	public static String urlSimcardProductInsert = stockReleaseBaseURL + "/services/simcard/product/insert/";
	public static String urlBalanceQuery = stockReleaseBaseURL + "/services/balance/query/";
	public static String urlBalanceDeduction = stockReleaseBaseURL + "/services/balance/deduction/";
	public static String urlBalanceRefund = stockReleaseBaseURL + "/services/balance/refund/";
	public static String urlBPPSValidateStore = stockReleaseBaseURL + "/services/bpps/validate/store/";
	public static String urlBPPSApprove = stockReleaseBaseURL + "/services/bpps/approve/";
	public static String responseData = "";
	public static List<String> transactionIds = new ArrayList<>();
	public static String startICCI;
	public static String endICCI;
}
