package com.saf.framework;

import com.relevantcodes.extentreports.ExtentReports;
import com.relevantcodes.extentreports.ExtentTest;
import com.relevantcodes.extentreports.LogStatus;
import io.appium.java_client.screenrecording.CanRecordScreen;
import io.qameta.allure.Allure;
import org.apache.commons.io.FileUtils;
import org.apache.commons.net.util.Base64;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.testng.Assert;
import org.testng.ITestResult;
import org.testng.annotations.*;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.HashMap;

public class MyTestNGBaseClass {

	public static WebDriver oDriver;
	public static ExtentReports oExtentReport;
	public static ExtentTest oExtentTest;
	public static int ssNumber;
	public static String reportPath;
	public static boolean dbFlag;
	public static int testCaseId = 0;
	public static String sDriverName = "";
	DataDriver oDataDriver = new DataDriver();
	HashMap<String, HashMap<String, String>> myMap = new HashMap<String, HashMap<String,String>>();
	protected static HashMapNew dataMap = new HashMapNew();
	static HashMapNew keysMap = new HashMapNew();

	@Parameters({ "browserName"})
	@BeforeSuite
	//@BeforeTest
	public void BeforeSuite(@Optional("")String browserName) throws Throwable {
		//public void BeforeSuite() throws Throwable{


		if (browserName.equalsIgnoreCase("ie")) {
			sDriverName = "ie";
		} else if (browserName.equalsIgnoreCase("firefox")) {
			sDriverName = "firefox";
		} else if (browserName.equalsIgnoreCase("chrome")) {
			sDriverName = "chrome";
		} else if (browserName.equalsIgnoreCase("htmlunit")) {
			sDriverName = "htmlunit";
		} else {
			throw new Exception("Unknown driver name = " + sDriverName +
					"Valid names are: ie,firefox,chrome,htmlunit");
		}

		//oDriver = CommonLib.getDriver(sDriverName);

	}

	@BeforeMethod
	public void BeforeMethod() throws Throwable {
		try {
			oDriver = CommonLib.getDriver(sDriverName);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	//********************************************************
	//End of execution
	//********************************************************
	@AfterMethod
	public void automationTeardown() throws Exception
	{
		oDriver.quit();
	}


	@AfterSuite
//	@AfterTest
	public void afterSuite()  throws Throwable{

		//oDriver.quit();

	}


	public static HashMapNew fConvertHashToHashNew(HashMap<String, String> hashOld) {

		try {
			HashMapNew hashNew = (HashMapNew)hashOld;
			return hashNew;
		}
		catch(Exception e){
			return null;
		}


	}

	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
	public static boolean reportResult(String status, String message, boolean ssFlag){
		try {
			String dest = "";
			if(ssFlag) {
				ssNumber++;
				TakesScreenshot ts = (TakesScreenshot)oDriver;
				File source = ts.getScreenshotAs(OutputType.FILE);
				dest = System.getProperty("user.dir") + "/Reports/" + reportPath + "/Screenshots/" + ssNumber + ".png";
				File destination = new File(dest);
				FileUtils.copyFile(source, destination);
			}


			if(status.equalsIgnoreCase("PASS")) {
				if(ssFlag) {
					oExtentTest.log(LogStatus.PASS, message + "\n" + oExtentTest.addScreenCapture(dest));
				}else {
					oExtentTest.log(LogStatus.PASS, message);
				}
				//DBReporting.insertExecutionDetailsIntoDB(testCaseId, "PASS", message, className, System.getProperty("user.name"));
			}else if(status.equalsIgnoreCase("FAIL")) {
				if(ssFlag) {
					oExtentTest.log(LogStatus.FAIL, message + "\n" + oExtentTest.addScreenCapture(dest));
				}else {
					oExtentTest.log(LogStatus.FAIL, message);
				}
				//DBReporting.insertExecutionDetailsIntoDB(testCaseId, "FAIL", message, className, System.getProperty("user.name"));
			}else {
				if(ssFlag) {
					oExtentTest.log(LogStatus.INFO, message + "\n" + oExtentTest.addScreenCapture(dest));
				}else {
					oExtentTest.log(LogStatus.INFO, message);
				}
				//DBReporting.insertExecutionDetailsIntoDB(testCaseId, "INFO", message, className, System.getProperty("user.name"));
			}
			//oExtentTest.log(LogStatus.INFO, oExtentTest.addScreenCapture(dest));
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}




}
