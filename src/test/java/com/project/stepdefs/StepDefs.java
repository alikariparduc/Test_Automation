package com.project.stepdefs;

import API.METOD.BaseMethods;
import API.bodys.Responses;
import com.saf.framework.*;

import com.saf.framework.databasemethods.*;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.openqa.selenium.*;

import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;

import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import utils.excelutils.ExcelUtils;


import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.text.ParseException;
import java.util.*;
import java.util.List;

public class StepDefs extends MyTestNGBaseClass {
    DataBase dataBase;
    ExcelUtils excelUtils = new ExcelUtils();
    CommonLib commonLib = new CommonLib();
    TCKN tckn = new TCKN();
    int timeout = 120;
    public String uuid = UUID.randomUUID().toString();
    public boolean checkLoginControl = false;
    public String phNo;
    public String randomEmployees;
    public String randomCiroString;
    public String mytckn;
    public String object;
    public String tax;
    public String realCustomerTax;
    public static HashMap<String, String> strings = new HashMap<String, String>();
    InputStream stringsis;
    TestUtils utils;
    public String imeiNo;
    public List<String> imeiList;

    public String uploadedExcelFileName;

    public String barkodNo;
    public String randomText;

    public String faturaName;
    public String transferDokumanNumarasi;

    public int stokAdedi;

    public Invoice invoice;

    int maxDifferenceInSeconds = 10;

    public static String connectionString = "";
    public static String environment;


    @And("I have to refresh the page" )
    public void refreshPage() {

        oDriver.navigate().refresh();
    }

    @And("^I have to getText from below element. Above element: (\\w+(?: \\w+)*) at index (\\d+)" )
    public void getTextFromBelowElement(String element, int index) {
        WebElement object = commonLib.findElement(element, index);

    }

    @Given("^Open the (.*) URL$" )
    public void openUrl(String URL) {
        CommonLib.navigateToURL(oDriver, URL);
    }

    @Given("Open the url given by jenkins job" )
    public void openUrlFromParameter() {
        String URL = "";
        environment = System.getProperty("ENVIRONMENT");
        if(environment == null || environment.equals("release")) {
            URL = "http://front-ui-rsmnsadsat.apps.mbt.vodafone.local/login";
        }
        else if(environment.equals("test")) {
            URL = "http://front-ui-rsmnsaddev.apps.mbt.vodafone.local/login";
        }

        System.out.println("URL is = " + URL);
        CommonLib.navigateToURL(oDriver, URL);
    }


    @Then("^I see (.*) page$" )
    public void seePage(String page) {
        commonLib.seePage(page);
    }

    @When("^(?:I )?click element: (\\w+(?: \\w+)*) at index (\\d+)" )
    public boolean clickElement(String element, int index) {
        WebElement object = commonLib.findElement(element, index);
        boolean flag = false;
        try {
            if (object != null) {
                new WebDriverWait(oDriver, 30)
                        .until(ExpectedConditions.elementToBeClickable(object))
                        .click();
                //object.click();
                System.out.println("Clicked on object-->" + element);

                commonLib.allureReport(StepResultType.PASS, "I clicked the element: " + element, true);
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            commonLib.allureReport(StepResultType.FAIL, "I cannot clicked the element: " + element, true);

            flag = false;
        }
        return flag;
    }


    @When("^(?:I )?have to verify the text for: (\\w+(?: \\w+)*) at index (\\d+)" )
    public boolean verifyText(String element, int index) throws Exception {
        WebElement object = commonLib.findElement(element, index);
        boolean flag = false;
        try {
            if (object != null) {
                String xmlFileName = "strings.xml";
                stringsis = this.getClass().getClassLoader().getResourceAsStream(xmlFileName);
                utils = new TestUtils();
                strings = utils.parseStringXML(stringsis);

                object.click();
                String actualErrTxt = object.getText();
                if (element.contains("approve popup" )) {
                    String expectedErrText = strings.get("approve popup" );
                    System.out.println("actual popup text - " + actualErrTxt + "\n" + "expected popup text - " + expectedErrText);
                    Assert.assertEquals(actualErrTxt, expectedErrText);
                    commonLib.allureReport(StepResultType.PASS, "Assertion is true." + element, true);
                    return true;
                } else if (element.contains("assign to pool popup" )) {
                    String expectedErrText = strings.get("assign to pool popup" );
                    System.out.println("actual popup text - " + actualErrTxt + "\n" + "expected popup text - " + expectedErrText);
                    Assert.assertEquals(actualErrTxt, expectedErrText);
                    commonLib.allureReport(StepResultType.PASS, "Assertion is true." + element, true);
                    return true;
                } else if (element.contains("cancel popup" )) {
                    String expectedErrText = strings.get("cancel popup" );
                    System.out.println("actual popup text - " + actualErrTxt + "\n" + "expected popup text - " + expectedErrText);
                    Assert.assertEquals(actualErrTxt, expectedErrText);
                    commonLib.allureReport(StepResultType.PASS, "Assertion is true." + element, true);
                    return true;
                }
            }
        } catch (Exception e) {
            commonLib.allureReport(StepResultType.FAIL, "An error during assertion. " + element, true);
        } finally {
            if (stringsis != null) {
                stringsis.close();
            }
        }
        return flag;
    }


    @Then("^I enter \"([^\"]*)\" text to (.*) at index (\\d+)" )
    public boolean enterText(String text, String element, int index) throws InterruptedException {
        WebElement object;
        object = commonLib.waitElement(element, timeout, index);
        boolean flag = false;
        try {
            if (object != null) {
                object.sendKeys(text);
                System.out.println("The text has been entered:" + text);
                commonLib.allureReport(StepResultType.PASS, "I entered the text: " + text, true);

                return true;
            }
        } catch (Exception e) {
            commonLib.allureReport(StepResultType.FAIL, "I cannot entered the element: " + text, true);
            flag = false;
        }
        return flag;
    }

    @Then("I go to top of the site" )
    public void topOfWebsite() {
        ((JavascriptExecutor) oDriver).executeScript("window.scrollTo(document.body.scrollHeight, 0)" );
    }

    @Then("^I enter unique text to (.*) at index (\\d+)" )
    public boolean uniqueText(String element, int index) throws InterruptedException {
        //mouseHover(element);
        WebElement object;
        object = commonLib.waitElement(element, timeout, index);
        String text = "automation" + uuid;
        boolean flag = false;
        try {
            if (object != null) {
                object.sendKeys(text);
                System.out.println("The text has been entered." );
                commonLib.allureReport(StepResultType.PASS, "I entered the text: " + text, true);
                return true;
            }
        } catch (Exception e) {
            commonLib.allureReport(StepResultType.FAIL, "I cannot entered the element: " + text, true);
            flag = false;
        }
        return flag;
    }

    @Then("^I verify the area (.*) by read only at index (\\d+)" )
    public boolean readOnlyAreaCheck(String element, int index) throws InterruptedException {
        WebElement object;
        object = commonLib.waitElement(element, timeout, index);
        boolean flag = false;

        try {
            if (object != null) {
                if (!object.isEnabled()) {
                    System.out.println("The area is a read only area. Cannot be editable." );
                    commonLib.allureReport(StepResultType.PASS, "The area is a read only area. Cannot be editable.", true);
                    return true;
                }
            }
        } catch (Exception e) {
            commonLib.allureReport(StepResultType.FAIL, "The area is not a read only area. Can be editable.", true);
            flag = false;
        }
        return flag;
    }


    @Then("^I clear text to (.*) at index (\\d+)" )
    public boolean clearText(String element, int index) throws InterruptedException {
        WebElement object;
        object = commonLib.waitElement(element, timeout, index);
        boolean flag = false;
        try {
            if (object != null) {
                object.click();
                Thread.sleep(1000);
                object.sendKeys(Keys.CONTROL, "a" );
                Thread.sleep(1000);
                object.sendKeys(Keys.DELETE);
                Thread.sleep(1000);
                System.out.println("The text has been deleted." );
                commonLib.allureReport(StepResultType.PASS, "The text has been deleted.", true);
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("The text has not been deleted." );
            commonLib.allureReport(StepResultType.FAIL, "The text has not been deleted", true);
            flag = false;
        }
        return flag;
    }

    @Then("^I enter random but valid tckn to (.*) element at index (\\d+)" )
    public boolean randomTCKN(String element, int index) throws InterruptedException {
        WebElement object;
        object = commonLib.waitElement(element, timeout, index);
        mytckn = tckn.getSaltString();
        System.out.println(mytckn);
        boolean flag = false;
        try {
            if (object != null) {
                object.click();
                Thread.sleep(1000);
                object.sendKeys(mytckn);
                System.out.println("The tckn has been entered." );
                commonLib.allureReport(StepResultType.PASS, "The tckn has been entered.", true);
                return true;
            }
        } catch (Exception e) {
            System.out.println("The tckn has not been entered." );
            commonLib.allureReport(StepResultType.FAIL, "The tckn has not been entered.", true);
            flag = false;
        }
        return flag;
    }


    @And("^I wait (.*) element (\\d+) seconds at index (\\d+)" )
    public void waitElement(String element, int timeOut, int index) throws InterruptedException {
        commonLib.waitElement(element, timeOut, index);

    }

    @When("^(?:I )?select element: \"([^\"]*)\" under (\\w+(?: \\w+)*) at index (\\d+)" )
    public boolean selectElement(String text, String element, int index) {
        WebElement object = commonLib.findElement(element, index);
        boolean flag = false;
        try {
            if (object != null) {
                object.click();
                System.out.println("Select the object type-->" + text + element);
                Select select = new Select(object);
                select.selectByVisibleText(text);
                commonLib.allureReport(StepResultType.PASS, "The selection is done.", true);
                return true;
            }
        } catch (Exception e) {
            System.out.println("The selection cannot be done." );
            commonLib.allureReport(StepResultType.FAIL, "The selection cannot be done.", true);
            flag = false;
        }
        return flag;
    }


    @And("^I need to just wait" )
    public void justWait() throws InterruptedException {
        Thread.sleep(10000);
    }

    @Then("^(?:I )?get the text area information: (\\w+(?: \\w+)*) at index (\\d+)" )
    public boolean getTextFromAttribute(String element, int index) {
        String object = commonLib.getTheItemValueFromAttribute(element, index);
        boolean flag = false;
        try {
            if (object != null) {
                System.out.println(object);
                commonLib.allureReport(StepResultType.PASS, "I got the information:" + object, true);
                return true;
            }
        } catch (Exception e) {
            System.out.println("Could not got the information." );
            commonLib.allureReport(StepResultType.FAIL, "Could not got the information.", true);
            flag = false;

        }
        return flag;
    }

    @Then("^(?:I )?get the information by copying the value from: (\\w+(?: \\w+)*) at index (\\d+)" )
    public boolean copyElement(String element, int index) throws InterruptedException {
        WebElement object;
        object = commonLib.waitElement(element, timeout, index);
        boolean flag = false;
        try {
            if (object != null) {
                object.click();
                Thread.sleep(1000);
                object.sendKeys(Keys.CONTROL, "c" );
                Thread.sleep(1000);
                System.out.println("The text has been copied." );
                commonLib.allureReport(StepResultType.PASS, "The text has been copied.", true);
                return true;
            }
        } catch (Exception e) {
            System.out.println("The copy action cannot be done." );
            commonLib.allureReport(StepResultType.FAIL, "The copy action cannot be done.", true);
            flag = false;

        }
        return flag;
    }


    @Then("^(?:I )?copy the information by copying the value to: (\\w+(?: \\w+)*) at index (\\d+)" )
    public boolean pasteElement(String element, int index) throws InterruptedException {
        WebElement object;
        object = commonLib.waitElement(element, timeout, index);
        boolean flag = false;
        try {
            if (object != null) {
                object.click();
                Thread.sleep(1000);
                object.sendKeys(Keys.CONTROL, "v" );
                Thread.sleep(1000);
                System.out.println("The text has been pasted." );
                commonLib.allureReport(StepResultType.PASS, "The text has been pasted.", true);
                return true;
            }
        } catch (Exception e) {
            System.out.println("The paste action cannot be done." );
            commonLib.allureReport(StepResultType.FAIL, "The paste action cannot be done.", true);
            flag = false;

        }
        return flag;
    }


    @When("^(?:I )?double click element: (\\w+(?: \\w+)*) at index (\\d+)" )
    public void doubleClickElement(String element, int index) {
        WebElement object = commonLib.findElement(element, index);
        commonLib.doubleClickElement(object);
    }

    @Then("^(?:I )?get the item value: (\\w+(?: \\w+)*)" )
    public void getTheItemValue(String element) {
        int index = 1;
        String object = commonLib.getTheItemValue(element, index);
    }

    @Given("I login the system with username {string} and password {string}")
    public void loginSystem(String username, String password) throws InterruptedException, SQLException, ClassNotFoundException {
        logoutKontrolEt(username);
        openUrlFromParameter();
        seePage("login" );
        enterText(username,"username text area", 1);
        enterText(password,"password text area", 1);
        waitElement("login button", 30, 1);
        clickElement("login button", 1);
    }

    @Given("I logout the system")
    public void logoutSystem() throws InterruptedException {
        seePage("ozet" );
        waitElement("ozet button", 5, 1);
        clickElement("ozet button", 1);

        seePage("home" );
        waitElement("Logout", 5, 1);
        scrollToElement("Logout", 1);
        clickElement("Logout", 1);
        waitElement("onayla butonu", 5, 1);
        clickElement("onayla butonu", 1);
    }

    @Given("I logout the back office system")
    public void logoutBackOfficeSystem() throws InterruptedException {
        seePage("home" );
        waitElement("Logout", 5, 1);
        scrollToElement("Logout", 1);
        clickElement("Logout", 1);
        waitElement("onayla butonu", 5, 1);
        clickElement("onayla butonu", 1);
    }

    @Given("I go to \"([^\"]*)\" with this username: \"([^\"]*)\" and this password:\"([^\"]*)\"" )
    public void loginSystem(String URL, String username, String password) throws InterruptedException {
        openUrl(URL);
        seePage("login" );
        enterText(username, "username text area", 1);
        enterText(password, "password text area", 1);
        waitElement("login button", timeout, 1);
        clickElement("login button", 1);
        seePage("home" );
    }




    @When("My website is close" )
    public void checkURLControl(String URL) throws InterruptedException {
        //eğer URL kapalı ise git URL'i ayağa kaldır.
        if (checkLoginControl = false) {
            openUrl(URL);
            checkLoginControl = true;
        }
        //eğer URL açık ise (checkLoginControl = true)  hata bas.
        else {
            throw new InterruptedException("Your page is already opened. You cannot open the URL one more time." );
        }
    }

    @Then("^(?:I )?get the data from Excel file to element: (\\w+(?: \\w+)*) at index (\\d+) for 5426" )
    public boolean getExcelValue5426(String element, int index) {
        WebElement object = commonLib.findElement(element, index);
        String text = excelUtils.ReadCellData(1, 0);
        boolean flag = false;

        try {
            if (object != null) {
                object.sendKeys(text);
                System.out.println("The excel value:" + text + " " + "has been entered." );
                commonLib.allureReport(StepResultType.PASS, "The excel value:" + text + " " + "has been entered.", true);
                return true;
            }
        } catch (Exception e) {
            System.out.println("The reference number:" + text + " " + "has not been entered." );
            commonLib.allureReport(StepResultType.FAIL, "The excel value:" + text + " " + "has not been entered.", true);
            flag = false;

        }
        return flag;
    }

    @Then("^(?:I )?upload the file \"([^\"]*)\" using the: (\\w+(?: \\w+)*) at index (\\d+)" )
    public void uploadFile(String text, String element, int index) throws IOException, InterruptedException,  AWTException, IOException {

        WebElement object;
        object = commonLib.findElement(element, index);
        object.click();
        System.out.println(text + " is uploading.");
        Thread.sleep(3000);

        String fileName = System.getProperty("user.dir" ) + "\\Library\\" + text;
        Runtime.getRuntime().exec(System.getProperty("user.dir" ) + "\\Exes\\seleniumFolderUpload.exe " + fileName);
        Thread.sleep(3000);
        System.out.println(text + " is uploaded.");
    }

    @Then("^(?:I )?upload the file \"([^\"]*)\" with random suffix using the: (\\w+(?: \\w+)*) at index (\\d+)" )
    public void uploadFileWithRandomSuffix(String text, String element, int index) throws IOException, InterruptedException,  AWTException, IOException {

        //yükleme butonuna tıklat
        WebElement object;
        object = commonLib.findElement(element, index);
        object.click();
        System.out.println(text + " is uploading.");
        Thread.sleep(3000);
        //---------------------------------------------------------------------------------

        File originalFile = new File(System.getProperty("user.dir" ) + "\\Library\\"
                + text + ".xlsx");
        String renamedFileName = text + "_TEST" + RandomStringUtils.randomNumeric(5) + ".xlsx";
        File renamedFile = new File(System.getProperty("user.dir" ) + "\\Library\\"
                + renamedFileName);
        System.out.println(System.getProperty("user.dir" ) + "\\Library\\");
        FileUtils.copyFile(originalFile, renamedFile);
        Runtime.getRuntime().exec(System.getProperty("user.dir" ) + "\\Exes\\seleniumFolderUpload.exe " + renamedFile);

        Thread.sleep(3000);
        System.out.println(text + " is uploaded.");

        uploadedExcelFileName = renamedFileName;
        FileUtils.forceDeleteOnExit(renamedFile);

    }

    @Then("^I enter uploaded excel file name to (.*) at index (\\d+)")
    public void enterExcelFileName(String element, int index) throws InterruptedException {
        WebElement object;
        object = commonLib.waitElement(element, timeout, index);

        try {
            if (object != null) {
                object.sendKeys(uploadedExcelFileName);
                System.out.println("The IMEI number has been entered:" + uploadedExcelFileName);
                commonLib.allureReport(StepResultType.PASS, "I entered the excel file name: " + uploadedExcelFileName, true);
            }
        } catch (Exception e) {
            commonLib.allureReport(StepResultType.FAIL, "I cannot entered the element: " + uploadedExcelFileName, true);
        }
    }

    @Then("^I need to store the information for real customer vkn" )
    public String storeInformationVKN() {
        realCustomerTax = tax;
        System.out.println("Real customer tax is: " + realCustomerTax);
        return realCustomerTax;
    }

    @Then("I scroll to the {string}" )
    public void scrollToElement(String element) throws InterruptedException {
        WebElement elementToSee = commonLib.findElement(element, 1);
        ((JavascriptExecutor) oDriver).executeScript("arguments[0].scrollIntoView(true);", elementToSee);
        Thread.sleep(1000);
    }

    @Then("I scroll to the {string} at index {int}" )
    public void scrollToElement(String element, int index) throws InterruptedException {
        WebElement elementToSee = commonLib.findElement(element, index);
        ((JavascriptExecutor) oDriver).executeScript("arguments[0].scrollIntoView(true);", elementToSee);
        Thread.sleep(1000);
    }

    @Then("I upload the excel file from {string}" )
    public void UploadTheExcelFile(String uploadfile) throws InterruptedException {

        try {
            Runtime.getRuntime().exec(System.getProperty("user.dir" ) + "\\Exes\\" + uploadfile);
            System.out.println("excel file is uploaded." );


        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @And("I generate an IMEI list with count: (\\d+)")
    public void generateIMEIlist(int count){
        if(imeiList == null)
            imeiList = new ArrayList<String>();

        for(int i=0; i < count; i++) {
            imeiList.add(RandomStringUtils.randomNumeric(15));
        }
    }

    @Then("^I enter (\\d+). IMEI number from generated IMEI list to (.*) at index (\\d+)" )
    public boolean enterIMEINumberFromIMEIlist(int nthIMEI, String element, int index) throws InterruptedException {
        boolean flag = false;
        WebElement object;
        object = commonLib.waitElement(element, timeout, index);
        String imei = imeiList.get(nthIMEI - 1);

        try {
            if (object != null) {
                object.sendKeys(imei);
                System.out.println("The IMEI number has been entered:" + imei);
                commonLib.allureReport(StepResultType.PASS, "I entered the IMEI number: " + imei, true);
                return true;
            }
        } catch (Exception e) {
            commonLib.allureReport(StepResultType.FAIL, "I cannot entered the element: " + imei, true);
            flag = false;
        }
        return flag;
    }

    @Then("^I enter a IMEI number to (.*) at index (\\d+)" )
    public boolean enterIMEINumber(String element, int index) throws InterruptedException {
        WebElement object;
        object = commonLib.waitElement(element, timeout, index);
        boolean flag = false;
        if (StringUtils.isBlank(imeiNo)) {
            String randomIMEINumbers = RandomStringUtils.randomNumeric(15);
            imeiNo = randomIMEINumbers;
        }
        System.out.println("IMEI:" + imeiNo);
        commonLib.saveGlobalVariable("randomGlobalImei", imeiNo);
        commonLib.saveVariable("randomImei", imeiNo);

        try {
            if (object != null) {
                object.sendKeys(imeiNo);
                System.out.println("The IMEI number has been entered:" + imeiNo);
                commonLib.allureReport(StepResultType.PASS, "I entered the IMEI number: " + imeiNo, true);
                return true;
            }
        } catch (Exception e) {
            commonLib.allureReport(StepResultType.FAIL, "I cannot entered the element: " + imeiNo, true);
            flag = false;
        }
        return flag;
    }

    @Then("^I enter a IMEI number fromGlobal to (.*) at index (\\d+)$" )
    public boolean enterIMEINumberfromGlobal(String element, int index) throws InterruptedException {
        WebElement object;
        object = commonLib.waitElement(element, timeout, index);
        boolean flag = false;
        System.out.println("IMEI:" + commonLib.getGlobalVariable("randomGlobalImei" ));

        try {
            if (object != null) {
                object.sendKeys(commonLib.getGlobalVariable("randomGlobalImei" ));
                System.out.println("The IMEI number has been entered:" + commonLib.getGlobalVariable("randomGlobalImei" ));
                commonLib.allureReport(StepResultType.PASS, "I entered the IMEI number: " + commonLib.getGlobalVariable("randomGlobalImei" ), true);
                return true;
            }
        } catch (Exception e) {
            commonLib.allureReport(StepResultType.FAIL, "I cannot entered the element: " + commonLib.getGlobalVariable("randomGlobalImei" ), true);
            flag = false;
        }
        return flag;
    }

    @Then("I get Stock Value (\\w+(?: \\w+)*)$" )
    public int getStokValue(String element) {
        int index = 6;
        String object = commonLib.getTheItemValue(element, index);
        int stokAdedi = Integer.parseInt(object);
        commonLib.saveVariable("oldStockValue", "" + stokAdedi);
        commonLib.saveGlobalVariable("oldStockValue", "" + stokAdedi);
        System.out.println("StokAdedi:" + stokAdedi);
        commonLib.allureReport(StepResultType.PASS, "saveStokAdedi:" + stokAdedi, true);
        return stokAdedi;
    }

    @Then("^(?:I )?verify Stock Value: (\\w+(?: \\w+)*) at deleteCount (\\d+)" )
    public void verifyStokDeleteValue(String element, int deleteCount) throws InterruptedException {
        int index = 6;
        String object = commonLib.getTheItemValue(element, index);
        int newStokAdedi = Integer.parseInt(object);
        int oldStokAdedi = Integer.parseInt(commonLib.getVariable("oldStockValue" )) - deleteCount;
        System.out.println("Şu anki count: " + newStokAdedi + " Olması beklenen count: " + oldStokAdedi + " deleteCount: " + deleteCount + " Eski count: " + commonLib.getVariable("oldStockValue"));
        if (
                newStokAdedi != oldStokAdedi
        ) {
            commonLib.allureReport(StepResultType.FAIL, "Adedler uyusmuyor:yeni Adedi " + newStokAdedi + " Eski Count: " + oldStokAdedi, true);
        } else {
            commonLib.allureReport(StepResultType.PASS, "Adedler uyusuyor:yeni StokAdedi " + newStokAdedi + " Eski Stok: " + oldStokAdedi, true);
        }
    }

    @Then("^(?:I )?verify Stock Value: (\\w+(?: \\w+)*) at addCount (\\d+)" )
    public void verifyStokAddValue(String element, int addCount) throws InterruptedException {
        int index = 6;
        String object = commonLib.getTheItemValue(element, index);
        int newStokAdedi = Integer.parseInt(object);
        int oldStokAdedi = Integer.parseInt(commonLib.getVariable("oldStockValue" )) + addCount;
        System.out.println("Şu anki count: " + newStokAdedi + " Olması beklenen count: " + oldStokAdedi + " addCount: " + addCount + " Eski count: " + commonLib.getVariable("oldStockValue"));
        if (
                newStokAdedi != oldStokAdedi
        ) {
            commonLib.allureReport(StepResultType.FAIL, "Adedler uyusmuyor:yeni Adedi " + newStokAdedi + " Eski Count: " + oldStokAdedi, true);
        } else {
            commonLib.allureReport(StepResultType.PASS, "Adedler uyusuyor:yeni StokAdedi " + newStokAdedi + " Eski Stok: " + oldStokAdedi, true);
        }
    }

    //dashboard stok Adedini alır.
    @Then("^(?:I )? get Dashboard Stock Value (\\w+(?: \\w+)*)$" )
    public int getDashboardStokValue(String element) {
        int index = 1;
        String object = commonLib.getTheItemValue(element, index);
        int stokAdedi = Integer.parseInt(object);
        commonLib.saveVariable("oldDashBoardValue", "" + stokAdedi);
        commonLib.saveGlobalVariable("oldDashBoardValue", "" + stokAdedi);
        System.out.println("StokAdedi:" + stokAdedi);
        commonLib.allureReport(StepResultType.PASS, "saveStokAdedi:" + stokAdedi, true);
        return stokAdedi;
    }

    @Then("^(?:I )? get Dashboard Stock Value (\\w+(?: \\w+)*) save as (\\w+(?: \\w+)*) globalOrlocal:(global|local)$" )
    public int getDashboardStokValue(String element, String key, String globalOrLocal) {
        int index = 1;
        String object = commonLib.getTheItemValue(element, index);
        int stokAdedi = Integer.parseInt(object);
        if (globalOrLocal.equalsIgnoreCase("global" )) {
            commonLib.saveGlobalVariable(key, "" + stokAdedi);
        } else {
            commonLib.saveVariable(key, "" + stokAdedi);
        }

        System.out.println("StokAdedi:" + stokAdedi);
        commonLib.allureReport(StepResultType.PASS, "saveStokAdedi:" + stokAdedi, true);
        return stokAdedi;
    }

    //dashboard stok Adedinin doğru guncellendiği kontolu.-------
    @Then("^(?:I )?verify Dashboard Value: (\\w+(?: \\w+)*) at addCount (-?\\d+)$" )
    public void verifyDashboardStokValue(String element, int addCount) throws InterruptedException {
        int index = 1;
        String object = commonLib.getTheItemValue(element, index);
        int newStokAdedi = Integer.parseInt(object);
        int oldStokAdedi = Integer.parseInt(commonLib.getVariable("oldDashBoardValue" )) + addCount;
        System.out.println("Şu anki count: " + newStokAdedi + " Olması beklenen count: " + oldStokAdedi + " addCount: " + addCount + " Eski count: " + commonLib.getVariable("oldDashBoardValue"));
        if (
                newStokAdedi != oldStokAdedi
        ) {
            commonLib.allureReport(StepResultType.FAIL, "Adedler uyusmuyor:yeni Count Adedi " + newStokAdedi + " Eski Count: " + oldStokAdedi, true);
        } else {
            commonLib.allureReport(StepResultType.PASS, "Adedler uyusuyor:yeni Count Adedi " + newStokAdedi + " Eski Count: " + oldStokAdedi, true);

        }
    }

    @Then("^(?:I )?verify Dashboard Value: (\\w+(?: \\w+)*) at deleteCount (\\d+)" )
    public void verifyDashboardStokDeleteValue(String element, int deleteCount) throws InterruptedException {
        int index = 1;
        String object = commonLib.getTheItemValue(element, index);
        int newStokAdedi = Integer.parseInt(object);
        int oldStokAdedi = Integer.parseInt(commonLib.getVariable("oldDashBoardValue" )) - deleteCount;
        System.out.println("Şu anki count: " + newStokAdedi + " Olması beklenen count: " + oldStokAdedi + " deleteCount: " + deleteCount + " Eski count: " + commonLib.getVariable("oldDashBoardValue"));
        if (
                newStokAdedi != oldStokAdedi
        ) {
            commonLib.allureReport(StepResultType.FAIL, "Adedler uyusmuyor:yeni Adedi " + newStokAdedi + " Eski Count: " + oldStokAdedi, true);
        } else {
            commonLib.allureReport(StepResultType.PASS, "Adedler uyusuyor:yeni StokAdedi " + newStokAdedi + " Eski Stok: " + oldStokAdedi, true);

        }
    }

    @Then("^(?:I )?verify Dashboard ValueGlobal: (\\w+(?: \\w+)*) at deleteCount (\\d+)$" )
    public void verifyDashboardStokDeleteValueFromGlobal(String element, int addCount) throws InterruptedException {
        int index = 1;
        String object = commonLib.getTheItemValue(element, index);
        int newStokAdedi = Integer.parseInt(object);
        int oldStokAdedi = Integer.parseInt(commonLib.getGlobalVariable("oldDashBoardValue" )) - addCount;
        System.out.println("add Yeni Stok: " + newStokAdedi + " Count Adedi: " + oldStokAdedi + " add :" + addCount + " " + commonLib.getGlobalVariable("old Dash Board Value" ));
        if (
                newStokAdedi != oldStokAdedi
        ) {
            commonLib.allureReport(StepResultType.FAIL, "Adedler uyusmuyor:yeni Adedi " + newStokAdedi + " Eski Count: " + oldStokAdedi, true);
        } else {
            commonLib.allureReport(StepResultType.PASS, "Adedler uyusuyor:yeni StokAdedi " + newStokAdedi + " Eski Stok: " + oldStokAdedi, true);

        }
    }


    @Then("^(?:I )?verify Dashboard ValueGlobal: (\\w+(?: \\w+)*) at addCount (\\d+)$" )
    public void verifyDashboardStokAddValueFromGlobal(String element, int addCount) throws InterruptedException {
        int index = 1;
        String object = commonLib.getTheItemValue(element, index);
        int newStokAdedi = Integer.parseInt(object);
        int oldStokAdedi = Integer.parseInt(commonLib.getGlobalVariable("oldDashBoardValue" )) + addCount;
        System.out.println("add Yeni Stok: " + newStokAdedi + " Count Adedi: " + oldStokAdedi + " add :" + addCount + " " + commonLib.getGlobalVariable("old Dash Board Value" ));
        if (
                newStokAdedi != oldStokAdedi
        ) {
            commonLib.allureReport(StepResultType.FAIL, "Adedler uyusmuyor:yeni Adedi " + newStokAdedi + " Eski Count: " + oldStokAdedi, true);
        } else {
            commonLib.allureReport(StepResultType.PASS, "Adedler uyusuyor:yeni StokAdedi " + newStokAdedi + " Eski Stok: " + oldStokAdedi, true);

        }
    }

    @Then("^I select a IMEI number from variables (.*) at index (\\d+)" )
    public void selectIMEINumber(String element, int index) throws InterruptedException {
        String ImeiNumber = commonLib.getVariable(element);
        WebElement object = commonLib.findElement(By.xpath("//li[@data-value='" + ImeiNumber + "']" ));

        try {
            if (object != null) {
                object.click();
                System.out.println("Clicked on object-->" + element);
                commonLib.allureReport(StepResultType.PASS, "I clicked the element: " + element, true);

            }
        } catch (Exception e) {
            commonLib.allureReport(StepResultType.FAIL, "I cannot clicked the element: " + element, true);


        }

    }

    @Then("^I select a IMEI number from sepet (.*) at index (\\d+)" )
    public void selectIMEINumberSepet(String element, int index) throws InterruptedException {
        String ImeiNumber = commonLib.getVariable(element);
        WebElement object = commonLib.findElement(By.xpath("//li[text()='" + ImeiNumber + "']" ));

        try {
            if (object != null) {
                object.click();
                System.out.println("Clicked on object-->" + element);
                commonLib.allureReport(StepResultType.PASS, "I clicked the element: " + element, true);

            }
        } catch (Exception e) {
            commonLib.allureReport(StepResultType.FAIL, "I cannot clicked the element: " + element, true);
        }
    }

    @Then("^I select (\\d+). IMEI number from generated IMEI list in sepet")
    public void selectIMEINumberFromImeiListInSepet(int nthImei) throws InterruptedException {
        String ImeiNumber = imeiList.get(nthImei - 1);
        WebElement object = commonLib.findElement(By.xpath("//li[text()='" + ImeiNumber + "']" ));

        try {
            if (object != null) {
                object.click();
                System.out.println("Clicked on imei object-->" + ImeiNumber);
                commonLib.allureReport(StepResultType.PASS, "I clicked the element: " + ImeiNumber, true);

            }
        } catch (Exception e) {
            commonLib.allureReport(StepResultType.FAIL, "I cannot clicked the element: " + ImeiNumber, true);
        }
    }

    @Given("Get Token With username {string} and password {string} with {string}." )
    public void getTokenWithUsernameAndPasswordWith(String username, String password, String desiredAPIPath) {
        Assert.assertTrue(new BaseMethods().createTokenRequest(desiredAPIPath, username, password));
    }

    /*@Given("Get Token With username {string} and password {string} and usergroup {string} with {string}." )
    public void getTokenWithUsernameAndPasswordAndUsergroup(String username, String password, String usergroup, String desiredAPIPath) {
        Assert.assertTrue(new BaseMethods().createTokenRequestWithUserGroup(desiredAPIPath, username, usergroup, password));
    }*/

    @Given("Get Token With username {string} and password {string} and usergroup {string} with {string}." )
    public void createStockTokenServiceIsSentAndTakeTheToken(String username, String password, String userGroup, String desiredRequestMethod) {
        Assert.assertTrue(new Responses().createStockTokenResponse(desiredRequestMethod, username, password, userGroup));
    }

    @Then("Send order for storeCode {string} with {string}.")
    public void sendOrderForStoreCodeWith(String storeCode, String desiredAPIPath) {
        Assert.assertTrue(new BaseMethods().getSupplier(desiredAPIPath, storeCode));
    }

    @Then("Send order for storeCode {string} with in-stock IMEI with {string}.")
    public void sendOrderForStoreCodeWithInStockIMEI(String storeCode, String desiredAPIPath) {
        Assert.assertTrue(new BaseMethods().createSupplierRequestWithInStockIMEI(desiredAPIPath, storeCode));
    }

    @Then("Send order for storeCode {string} with duplicate IMEIs under same barcode with {string}.")
    public void sendOrderForStoreCodeWithDuplicateIMEIsUnderSameBarcode(String storeCode, String desiredAPIPath) {
        Assert.assertTrue(new BaseMethods().createSupplierRequestWithDuplicateIMEIsUnderSameBarcode(desiredAPIPath, storeCode));
    }

    @Then("Send order for storeCode {string} with duplicate IMEIs under different barcodes with {string}.")
    public void sendOrderForStoreCodeWithDuplicateIMEIsUnderDifferentBarcodes(String storeCode, String desiredAPIPath) {
        Assert.assertTrue(new BaseMethods().createSupplierRequestWithDuplicateIMEIsUnderDifferentBarcodes(desiredAPIPath, storeCode));
    }

    @Then("Send order for storeCode {string} with in-stock and non-stock IMEI with {string}.")
    public void sendOrderForStoreCodeWithInStockAndNonStockIMEI(String storeCode, String desiredAPIPath) {
        Assert.assertTrue(new BaseMethods().createSupplierRequestWithInStockAndNonStockIMEI(desiredAPIPath, storeCode));
    }
    @Then("Send order for storeCode {string} with non-existent barcode {string} with {string}.")
    public void sendOrderForStoreCodeWithNonExistentBarcode(String storeCode, String barcode, String desiredAPIPath) {
        Assert.assertTrue(new BaseMethods().createSupplierRequestWithNonExistentBarcode(desiredAPIPath, storeCode, barcode));
    }

    @Then("Send order for storeCode {string} with non-existent sku {string} with {string}.")
    public void sendOrderForStoreCodeWithNonExistentSku(String storeCode, String sku, String desiredAPIPath) {
        Assert.assertTrue(new BaseMethods().createSupplierRequestWithNonExistentSku(desiredAPIPath, storeCode, sku));
    }

    @Then("Send order for storeCode {string} with invalid IMEI {string} with {string}.")
    public void sendOrderForStoreCodeWithInvalidIMEI(String storeCode, String imei, String desiredAPIPath) {
        Assert.assertTrue(new BaseMethods().createSupplierRequestWithInvalidIMEI(desiredAPIPath, storeCode, imei));
    }

    @Then("Send order for storeCode {string} with barcode {string} and non-matching sku {string} with {string}.")
    public void sendOrderForStoreCodeWithNonMatchingSKU(String storeCode, String barcode, String sku, String desiredAPIPath) {
        Assert.assertTrue(new BaseMethods().createSupplierRequestWithNonMatchingSKU(desiredAPIPath, storeCode, barcode, sku));
    }

    @Then("Send order for storeCode {string} with existent receipt no and version no with {string}.")
    public void sendOrderForStoreCodeWithExistentReceiptNoAndVersionNo(String storeCode, String desiredAPIPath) {
        Assert.assertTrue(new BaseMethods().createSupplierRequestWithExistentReceiptNoAndVersionNo(desiredAPIPath, storeCode));
    }

    @Then("Send order for storeCode {string} with existent receipt no and different version no with {string}.")
    public void sendOrderForStoreCodeWithExistentReceiptNoAndDifferentVersionNo(String storeCode, String desiredAPIPath) {
        Assert.assertTrue(new BaseMethods().createSupplierRequestWithExistentReceiptNoAndDifferentVersionNo(desiredAPIPath, storeCode));
    }

    @Then("Validate store with storeCode {string} and transferAmount {string} with {string}")
    public void validateStoreWithStoreCodeAndTransferAmount(String shopCode, String transferAmount, String desiredRequestMethod) throws ParseException {
        Assert.assertTrue(new Responses().validateStoreBPPSResponse(desiredRequestMethod, shopCode,  transferAmount));
    }

    @Then("Approve amount with storeCode {string} and transferAmount {string} with {string}")
    public void approveAmountWithStoreCodeAndTransferAmount(String shopCode, String transferAmount, String desiredRequestMethod) {
        Assert.assertTrue(new Responses().approveAmountBPPSResponse(desiredRequestMethod, shopCode, transferAmount));
    }


    @Then("Deduct ICCI {string} with storeCode {string} with {string}")
    public void deductICCI(String ICCI, String storeCode, String desiredRequestMethod) {
        Assert.assertTrue(new Responses().deductICCIResponse(desiredRequestMethod, ICCI, storeCode));
    }

    @Then("Deduct added ICCIs with storeCode {string} with {string}")
    public void deductAddedICCIs(String storeCode, String desiredRequestMethod) {
        for(String ICCI : CommonLib.getAddedICCIs())
            Assert.assertTrue(new Responses().deductICCIResponse(desiredRequestMethod, ICCI, storeCode));
    }

    @And("Refund deducted ICCIs with transactionIds with {string}")
    public void refundICCI(String desiredRequestMethod) {
        for(String transactionId : AutomationConstants.transactionIds)
            Assert.assertTrue(new Responses().refundICCIResponse(desiredRequestMethod, transactionId));
    }

    @And("Add multiple icci with storeCode {string} and with quantity {string} with {string}")
    public void addMultipleICCIToStore(String storeCode, String quantity, String desiredRequestMethod) {
        Assert.assertTrue(new Responses().addMultipleICCIfromSVMStoStockResponse(desiredRequestMethod, storeCode, quantity));
    }

    @And("I get and save an old receipt no and its version number from database")
    public void getAndSaveReceiptNoAndVersionNumber() throws SQLException {
        Connection con = DriverManager.getConnection(connectionString,
                AutomationConstants.oracleUsernameForSupplier,
                AutomationConstants.oraclePasswordForSupplier);

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery ("SELECT RECEIPT_NO, VERSION_NUMBER FROM V2_DELIVERY_ORDER FETCH FIRST 1 ROWS ONLY");

        if(rs.next()) {
            AutomationConstants.receiptNo = rs.getString("RECEIPT_NO");
            AutomationConstants.versionNumber = rs.getString("VERSION_NUMBER");
            System.out.println ("Retrieved a receipt no and its version number from database");
            commonLib.allureReport(StepResultType.PASS, "Retrieved a receipt no and its version number from database", false);
        }
        else{
            System.out.println ("Cannot retrieve a receipt no from database");
            commonLib.allureReport(StepResultType.FAIL, "Cannot retrieve a receipt no from database", false);
        }

        rs.close();
        st.close();
        con.close();
    }

    @Then("^I enter a Supplier no fromGlobal to (.*) at index (\\d+)$" )
    public boolean enterSupplierNofromGlobal(String element, int index) throws InterruptedException {
        WebElement object;
        object = commonLib.waitElement(element, timeout, index);
        boolean flag = false;
       // System.out.println("IMEI:" + commonLib.getGlobalVariable("randomGlobalImei" ));

        try {
            if (object != null) {
                //object.sendKeys(commonLib.getGlobalVariable("SupplierSenderNo"));

                for(int i = 0; i < commonLib.getGlobalVariable("SupplierSenderNo").length(); i++)
                {
                    object.sendKeys(String.valueOf(
                            commonLib.getGlobalVariable("SupplierSenderNo").charAt(i)
                    ));
                }

                System.out.println("The SupplierSenderNo has been entered:" + commonLib.getGlobalVariable("SupplierSenderNo" ));
                commonLib.allureReport(StepResultType.PASS, "I entered the SupplierSenderNo : " + commonLib.getGlobalVariable("SupplierSenderNo" ), true);
                return true;
            }
        } catch (Exception e) {
            commonLib.allureReport(StepResultType.FAIL, "I cannot entered the element: " + commonLib.getGlobalVariable("SupplierSenderNo" ), true);
            flag = false;
        }
        return flag;
    }

    @Then("^I enter a Supplier IMEI1 fromGlobal to (.*) at index (\\d+)$" )
    public boolean enterSupplierIMEINofromGlobal(String element, int index) throws InterruptedException {
        WebElement object;
        object = commonLib.waitElement(element, timeout, index);
        boolean flag = false;
        // System.out.println("IMEI 1 :" + AutomationConstants.ime1);

        try {
            if (object != null) {
                object.sendKeys(AutomationConstants.ime1);
                System.out.println("IMEI1 : " + AutomationConstants.ime1);
                commonLib.allureReport(StepResultType.PASS, "I entered the SupplierI MEI No : " + commonLib.getGlobalVariable("ime1" ), true);
                return true;
            }
        } catch (Exception e) {
            commonLib.allureReport(StepResultType.FAIL, "I cannot entered the element: " + commonLib.getGlobalVariable("ime1" ), true);
            flag = false;
        }
        return flag;
    }

    @Then("^I enter a Supplier IMEI2 fromGlobal to (.*) at index (\\d+)$" )
    public boolean enterSupplierIMEINo2fromGlobal(String element, int index) throws InterruptedException {
        WebElement object;
        object = commonLib.waitElement(element, timeout, index);
        boolean flag = false;
        // System.out.println("IMEI 2 :" + AutomationConstants.ime2);

        try {
            if (object != null) {
                object.sendKeys(AutomationConstants.ime2);
                System.out.println("IMEI2 : " + AutomationConstants.ime2);
                commonLib.allureReport(StepResultType.PASS, "I entered the SupplierI MEI No : " + commonLib.getGlobalVariable("ime2" ), true);
                return true;
            }
        } catch (Exception e) {
            commonLib.allureReport(StepResultType.FAIL, "I cannot entered the element: " + commonLib.getGlobalVariable("ime2" ), true);
            flag = false;
        }
        return flag;
    }

    @Then("^I enter a Supplier IMEI3 fromGlobal to (.*) at index (\\d+)$" )
    public boolean enterSupplierIMEINo3fromGlobal(String element, int index) throws InterruptedException {
        WebElement object;
        object = commonLib.waitElement(element, timeout, index);
        boolean flag = false;
        // System.out.println("IMEI 3 :" + AutomationConstants.ime3);

        try {
            if (object != null) {
                object.sendKeys(AutomationConstants.imei3);
                System.out.println("IMEI3 : " + AutomationConstants.imei3);
                commonLib.allureReport(StepResultType.PASS, "I entered the SupplierI MEI No : " + commonLib.getGlobalVariable("imei3" ), true);
                return true;
            }
        } catch (Exception e) {
            commonLib.allureReport(StepResultType.FAIL, "I cannot entered the element: " + commonLib.getGlobalVariable("imei3" ), true);
            flag = false;
        }
        return flag;
    }

    @Then("^I enter a Supplier IMEI4 fromGlobal to (.*) at index (\\d+)$" )
    public boolean enterSupplierIMEINo4fromGlobal(String element, int index) throws InterruptedException {
        WebElement object;
        object = commonLib.waitElement(element, timeout, index);
        boolean flag = false;
        // System.out.println("IMEI 4 :" + AutomationConstants.ime4);

        try {
            if (object != null) {
                object.sendKeys(AutomationConstants.imei4);
                System.out.println("IMEI4 : " + AutomationConstants.imei4);
                commonLib.allureReport(StepResultType.PASS, "I entered the SupplierI MEI No : " + commonLib.getGlobalVariable("imei4" ), true);
                return true;
            }
        } catch (Exception e) {
            commonLib.allureReport(StepResultType.FAIL, "I cannot entered the element: " + commonLib.getGlobalVariable("imei4" ), true);
            flag = false;
        }
        return flag;
    }

    @And("I change the created date of the delivery order")
    public void changeCreatedDateOfDeliveryOrder() throws ClassNotFoundException, SQLException {
        Class.forName ("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection(connectionString,
                AutomationConstants.oracleUsernameForSupplier,
                AutomationConstants.oraclePasswordForSupplier);

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery ("SELECT * FROM V2_DELIVERY_ORDER\n" +
                "WHERE RECEIPT_NO ='" + commonLib.getGlobalVariable("SupplierSenderNo" ) + "'");
        if (rs.next ())
        {
            Timestamp createdDate = rs.getTimestamp("CREATED_DATE");
            System.out.println("Created Date= " + createdDate);

            Calendar cal = Calendar.getInstance();
            cal.setTimeInMillis(createdDate.getTime());
            cal.add(Calendar.DATE, -1);

            Timestamp modifiedCreatedDate = new Timestamp(cal.getTime().getTime());
            System.out.println("modified Created Date= " + modifiedCreatedDate);

            PreparedStatement ps = con.prepareStatement("UPDATE V2_DELIVERY_ORDER SET CREATED_DATE = ? WHERE RECEIPT_NO = ?");
            ps.setTimestamp(1, modifiedCreatedDate);
            ps.setString(2, commonLib.getGlobalVariable("SupplierSenderNo"));
            int rows = ps.executeUpdate();
            System.out.println(rows + " row(s) affected.");
        }
        else{
            System.out.println ("Delivery order for this receipt no can not be found");
            commonLib.allureReport(StepResultType.FAIL, "Delivery order for this receipt no can not be found", false);
        }

        rs.close();
        st.close();
        con.close();
    }

    @And("I wait for dashboard to update")
    public void waitForDashboardToUpdate(){
        try{
            Thread.sleep(1 * 60 * 1000);
            refreshPage();
            justWait();
        }
        catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @And("I wait to accept the delivery automatically")
    public void waitToAcceptTheDeliveryAutomatically() {
        try{
            Thread.sleep(5 * 60 * 1000);
        }
        catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @And("I press Down and Enter buttons")
    public void pressDownandEnterButtons() throws InterruptedException {
        Thread.sleep(1000);
        Actions act = new Actions(oDriver);
        act.sendKeys(Keys.chord(Keys.DOWN)).perform();
        Thread.sleep(1000);
        act.sendKeys(Keys.chord(Keys.ENTER)).perform();
    }

    @And("I press Enter button")
    public void pressEnterButton() throws InterruptedException {
        Actions act = new Actions(oDriver);
        Thread.sleep(1000);
        act.sendKeys(Keys.chord(Keys.ENTER)).perform();
        System.out.println("Enter yapıldı");
    }

    @And("I press TAB button")
    public void pressTABButton() throws InterruptedException {
        Actions act = new Actions(oDriver);
        Thread.sleep(1000);
        act.sendKeys(Keys.chord(Keys.TAB)).perform();
        System.out.println("TAB yapıldı");
    }

    @And("I accept Alert")
    public void acceptAlert() throws InterruptedException {
        Thread.sleep(2000);

        Alert alert = new WebDriverWait(oDriver,5).until(ExpectedConditions.alertIsPresent());

        alert = oDriver.switchTo().alert();
        String actualAlertText = alert.getText();
        alert.accept();

        oDriver.switchTo().window(oDriver.getWindowHandle());

    }

    @And("^I verify \"([^\"]*)\" text in alert")
    public void verifyAlertText(String alertText) throws InterruptedException {
        Thread.sleep(2000);

        Alert alert = new WebDriverWait(oDriver,5).until(ExpectedConditions.alertIsPresent());

        String actualAlertText = alert.getText();
        System.out.println(actualAlertText);

        if(actualAlertText.equals(alertText)) {
            System.out.println("Alert text is correct.");
            commonLib.allureReport(StepResultType.PASS, "Alert text is correct", true);
        }
        else {
            System.out.println("Alert text is wrong.");
            commonLib.allureReport(StepResultType.FAIL, "Alert text is wrong", true);
        }
        System.out.println("verify alert text'e girdi");
        oDriver.switchTo().window(oDriver.getWindowHandle());

    }

    @Then("^I enter random text to (.*) at index (\\d+)" )
    public boolean enterRandomText(String element, int index) throws InterruptedException {
        WebElement object;
        object = commonLib.waitElement(element, timeout, index);
        boolean flag = false;
        if (StringUtils.isBlank(randomText)) {
            randomText = "Otomasyon" + RandomStringUtils.randomNumeric(6);
        }
        commonLib.saveGlobalVariable("randomGlobalText", randomText);
        commonLib.saveVariable("randomText", randomText);

        try {
            if (object != null) {
                object.sendKeys(randomText);
                System.out.println("The random text has been entered:" + randomText);
                commonLib.allureReport(StepResultType.PASS, "I entered the random text: " + randomText, true);
                return true;
            }
        } catch (Exception e) {
            commonLib.allureReport(StepResultType.FAIL, "I cannot entered the element: " + randomText, true);
            flag = false;
        }
        return flag;

    }

    @Then("^I enter barkod number to (.*) at index (\\d+)" )
    public boolean enterRandomBarkod(String element, int index) throws InterruptedException {
        WebElement object;
        object = commonLib.waitElement(element, timeout, index);
        boolean flag = false;
        if (StringUtils.isBlank(barkodNo)) {
            String randomBarkodNumbers = RandomStringUtils.randomNumeric(13);
            barkodNo = randomBarkodNumbers;
        }
        System.out.println("Barkod:" + barkodNo);
        commonLib.saveGlobalVariable("randomGlobalBarkod", barkodNo);
        commonLib.saveVariable("randomBarkod", barkodNo);

        try {
            if (object != null) {
                object.sendKeys(barkodNo);
                System.out.println("The Barkod number has been entered:" + barkodNo);
                commonLib.allureReport(StepResultType.PASS, "I entered the Barkod number: " + barkodNo, true);
                return true;
            }
        } catch (Exception e) {
            commonLib.allureReport(StepResultType.FAIL, "I cannot entered the element: " + barkodNo, true);
            flag = false;
        }
        return flag;

    }

    @Then("^I enter random SKU to (.*) at index (\\d+)" )
    public boolean enterRandomSKU(String element, int index) throws InterruptedException {
        WebElement object;
        object = commonLib.waitElement(element, timeout, index);
        String randomSKU = "TEST" + RandomStringUtils.randomNumeric(4);
        boolean flag = false;
        try {
            if (object != null) {
                object.sendKeys(randomSKU);
                System.out.println("The text has been entered:" + randomSKU);
                commonLib.allureReport(StepResultType.PASS, "I entered the text: " + randomSKU, true);

                return true;
            }
        } catch (Exception e) {
            commonLib.allureReport(StepResultType.FAIL, "I cannot entered the element: " + randomSKU, true);
            flag = false;
        }
        return flag;
    }

    @Then("^I control \"([^\"]*)\" IMEI is deleted in database" )
    public void controlIfIMEIDeleted(String IMEI) throws SQLException, ClassNotFoundException {
        
        /*Class.forName ("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection(connectionString,
                AutomationConstants.oracleUsernameForStock,
                AutomationConstants.oraclePasswordForStock);
        Statement st = con.createStatement();

        ResultSet rs = st.executeQuery ("SELECT a.ID, a.SESSION_ID" +
                "FROM v2_inventory_transaction a, v2_inventory_transaction_sub_item b, v2_inventory_transaction_imei c\n" +
                "WHERE a.id = b.transaction_id and b.id = c.transaction_item_id and c.imei ='" + IMEI + "'" +
                "ORDER BY a.created_date DESC" +
                "FETCH FIRST 1 ROWS ONLY;");

        if (rs.next())
            if(rs.getString("SESSION_ID").startsWith("MR"))
                System.out.println("IMEI is already deleted.");
            else {
                int transactionID = rs.getInt("ID");
                st.executeUpdate("UPDATE v2_inventory_transaction" +
                        "SET is_active = 0" +
                        "WHERE id ='" + transactionID + "'");
                System.out.println("IMEI is deleted successfuly");
            }
        else
            System.out.println("IMEI database'de bulunamadi.");


        rs.close();
        st.close();
        con.close();*/
    }

    //Logout İşlemi
    @Then("^I control logout with username: \"([^\"]*)\"" )
    public void logoutKontrolEt(String username) throws SQLException, ClassNotFoundException {

        environment = System.getProperty("ENVIRONMENT");
        if(environment == null || environment.equals("release")) {
            connectionString = AutomationConstants.releaseConnectionString;
        }
        else if(environment.equals("test")) {
            connectionString = AutomationConstants.testConnectionString;
        }

        Class.forName ("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection(connectionString,
                                                     AutomationConstants.oracleUsernameForStore,
                                                     AutomationConstants.oraclePasswordForStore);
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery ("select * from login_logout_ledger " +
                                            "where logout_time is null and user_name ='" + username + "'");
        if (rs.next ())
        {
            int rows = st.executeUpdate("update login_logout_ledger set is_active = 0 where is_active = 1 and logout_time is null and user_name = '" + username + "'");
            //int rows = st.executeUpdate("delete from login_logout_ledger where logout_time is null and user_name = '" + username + "'");
            System.out.println(rows + " row(s) affected.");
        }
        else
            System.out.println ("This user is already logged out.");


        rs.close();
        System.out.println("rs close");
        st.close();
        System.out.println("st close");
        con.close();
        System.out.println("connection closed");
    }

    @Then("^I control take in operations in database for IMEI: \"([^\"]*)\" barkod: \"([^\"]*)\" SKU: \"([^\"]*)\" and store code: \"([^\"]*)\"" )
    public void controlTakeInOperationsInDatabase(String imei, String barkod, String SKU, String storeCode) throws SQLException, ClassNotFoundException {

        //feature.file dan gönderilen imei "RANDOM" ise
        if(imei.equals("RANDOM")) {
            imei = imeiNo;
        }

        System.out.println("\n" + imei + " IMEI'li urun için ekleme işlemi database'de kontrol ediliyor...");
        try{
            dataBase = new DataBase(DataBase.DBType.ORACLE);
            Statement statement = dataBase.DataBaseConn(connectionString,
                    AutomationConstants.oracleUsernameForStock,
                    AutomationConstants.oraclePasswordForStock);

            //Ürün db kontrol
            TakeInDBMethods.controlTakeInOperationsIn_StockDB(statement,imei,storeCode);


            statement.close();
            dataBase.closeDatabaseConnection();
            System.out.println(imei + " IMEI'li urun için ekleme işlemi database kontrolü başarılı, bağlantı kapandı.\n");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Then("^I control delete operations in database for IMEI: \"([^\"]*)\" barkod: \"([^\"]*)\" SKU: \"([^\"]*)\" and store code: \"([^\"]*)\"" )
    public void controlDeleteOperationsInDatabase(String imei, String barkod, String SKU, String storeCode) throws SQLException, ClassNotFoundException {
        System.out.println("\n" + imei + " IMEI'li urun için silme işlemi database'de kontrol ediliyor...");

        try{
            dataBase = new DataBase(DataBase.DBType.ORACLE);
            Statement statement = dataBase.DataBaseConn(connectionString,
                                                 AutomationConstants.oracleUsernameForStock,
                                                 AutomationConstants.oraclePasswordForStock);

            ProductDeleteDBMethods.controlDeleteOperationsIn_StockDB(statement, imei, storeCode);

            statement.close();
            dataBase.closeDatabaseConnection();
            System.out.println(imei + " IMEI'li urun için silme işlemi database kontrolü başarılı, bağlantı kapandı.\n");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Then("^I control vdm to silver sale operations in database for IMEI: \"([^\"]*)\" barkod: \"([^\"]*)\" SKU: \"([^\"]*)\" and store code: \"([^\"]*)\"" )
    public void controlVDMtoSilverSaleOperationsInDatabase(String imei, String barkod, String SKU, String storeCode) throws SQLException, ClassNotFoundException {
        /*
        //feature.file dan gönderilen imei "RANDOM" ise
        if(imei.equals("RANDOM")) {
            imei = imeiNo;
        }

        System.out.println("\n" + imei + " IMEI'li urun için VDM'den Silver'a satış işlemi database'de kontrol ediliyor...");

        try{
            //---SALES DATABASE'İ İÇİN KONTROLLER---
            dataBase = new DataBase(DataBase.DBType.ORACLE);
            Statement statement = dataBase.DataBaseConn(connectionString,
                    AutomationConstants.oracleUsernameForSales,
                    AutomationConstants.oraclePasswordForSales);

            //V2_SALES_ORDER TABLOSU İÇİN KONTROL
            VDMtoSilverSaleDBMethods.controlSaleOperationsInSALESDatabase_V2_SALES_ORDER_Table(statement,faturaName);

            //V2_PAYMENT TABLOSU İÇİN KONTROL
            VDMtoSilverSaleDBMethods.controlSaleOperationsInSALESDatabase_V2_PAYMENT_Table(statement, fatura.getOdenecekTutar());

            //V2_CUSTOMER TABLOSU İÇİN KONTROL
            VDMtoSilverSaleDBMethods.controlSaleOperationsInSALESDatabase_V2_CUSTOMER_Table(statement, fatura);

            //V2_ADDRESS TABLOSU İÇİN KONTROL
            VDMtoSilverSaleDBMethods.controlSaleOperationsInSALESDatabase_V2_ADDRESS_Table(statement, fatura);

            //V2_FINANCIAL_PAPER TABLOSU İÇİN KONTROL
            VDMtoSilverSaleDBMethods.controlSaleOperationsInSALESDatabase_V2_FINANCIAL_PAPER_Table(statement, fatura);

            //V2_ORDER_ITEM TABLOSU İÇİN KONTROL
            VDMtoSilverSaleDBMethods.controlSaleOperationsInSALESDatabase_V2_ORDER_ITEM_Table(statement, imei, fatura);

            //V2_ITEM_TAX TABLOSU İÇİN KONTROL
            VDMtoSilverSaleDBMethods.controlSaleOperationsInSALESDatabase_V2_ITEM_TAX_Table(statement, fatura);

            //---MEDIATOR DATABASE'İ İÇİN KONTROLLER---
            statement = dataBase.DataBaseConn(connectionString,
                    AutomationConstants.oracleUsernameForMediator,
                    AutomationConstants.oraclePasswordForMediator);

            //V2_INVOICE_STATUS TABLOSU İÇİN KONTROL
            VDMtoSilverSaleDBMethods.controlSaleOperationsInMEDIATORDatabase_V2_INVOICE_STATUS_Table(statement, faturaName);

            //---ERP DATABASE'İ İÇİN KONTROLLER---
            statement = dataBase.DataBaseConn(connectionString,
                    AutomationConstants.oracleUsernameForErp,
                    AutomationConstants.oraclePasswordForErp);

            //V2_ORDER_INFO TABLOSU İÇİN KONTROL
            VDMtoSilverSaleDBMethods.controlSaleOperationsInERPDatabase_V2_ORDER_INFO_Table(statement, faturaName, fatura);

            //V2_PAYMENT TABLOSU İÇİN KONTROL
            VDMtoSilverSaleDBMethods.controlSaleOperationsInERPDatabase_V2_PAYMENT_Table(statement, fatura.getOdenecekTutar());

            //V2_CUSTOMER TABLOSU İÇİN KONTROL
            VDMtoSilverSaleDBMethods.controlSaleOperationsInERPDatabase_V2_CUSTOMER_Table(statement, fatura);

            //V2_ADDRESS TABLOSU İÇİN KONTROL
            VDMtoSilverSaleDBMethods.controlSaleOperationsInERPDatabase_V2_ADDRESS_Table(statement, fatura);

            //V2_ORDER_DETAIL_ITEM TABLOSU İÇİN KONTROL
            VDMtoSilverSaleDBMethods.controlSaleOperationsInERPDatabase_V2_ORDER_DETAIL_ITEM_Table(statement, imei, fatura);

            //---STOCK DATABASE'İ İÇİN KONTROLLER---
            dataBase = new DataBase(DataBase.DBType.ORACLE);
            statement = dataBase.DataBaseConn(connectionString,
                    AutomationConstants.oracleUsernameForStock,
                    AutomationConstants.oraclePasswordForStock);

            //V2_INVENTORY_IMEI TABLOSU İÇİN KONTROL
            VDMtoSilverSaleDBMethods.controlSaleOperationsInSTOCKDatabase_V2_INVENTORY_IMEI_Table(statement, imei);

            //V2_INVENTORY_QUANTITY_RAW TABLOSU İÇİN KONTROL
            VDMtoSilverSaleDBMethods.controlSaleOperationsInSTOCKDatabase_V2_INVENTORY_QUANTITY_RAW_Table(statement, faturaName, SKU, barkod);

            //V2_INVENTORY_TRANSACTION TABLOSU İÇİN KONTROL
            VDMtoSilverSaleDBMethods.controlSaleOperationsInSTOCKDatabase_V2_INVENTORY_TRANSACTION_Table(statement, faturaName);

            //V2_VDM_SILVER_RELATION_TABLE TABLOSU İÇİN KONTROL
            VDMtoSilverSaleDBMethods.controlSaleOperationsInSTOCKDatabase_V2_VDM_SILVER_RELATION_TABLE_Table(statement, faturaName, storeCode);

            statement.close();
            dataBase.closeDatabaseConnection();
            System.out.println(imei + " IMEI'li urun için VDM'den Silver'a satış işlemi database kontrolü başarılı, bağlantı kapandı.\n");
        }
        catch (Exception e) {
            e.printStackTrace();
        }*/
    }

    @Then("^I control faturali bireysel satis operations in database for IMEI: \"([^\"]*)\" barkod: \"([^\"]*)\" SKU: \"([^\"]*)\" and store code: \"([^\"]*)\"" )
    public void controlFaturaliBireyselSatisOperationsInDatabase(String imei, String barkod, String SKU, String storeCode) throws SQLException, ClassNotFoundException {

        //feature.file dan gönderilen imei "RANDOM" ise
        if(imei.equals("RANDOM")) {
            imei = imeiNo;
        }

        //System.out.println("\n" + imei + " IMEI'li urun için faturalı bireysel satış işlemi database'de kontrol ediliyor...");
        System.out.println("\nFaturalı bireysel satış işlemi database'de kontrol ediliyor...");

        try{
            //---SALES DATABASE'İ İÇİN KONTROLLER---
            dataBase = new DataBase(DataBase.DBType.ORACLE);
            /*Statement statement = dataBase.DataBaseConn(connectionString,
                    AutomationConstants.oracleUsernameForSales,
                    AutomationConstants.oraclePasswordForSales);*/

            FaturaliBireyselSatisDBMethods.checkOperation(dataBase, invoice);
            /*
            //V2_SALES_ORDER TABLOSU İÇİN KONTROL
            FaturaliBireyselSatisDBMethods.controlSaleOperationsInSALESDatabase_V2_SALES_ORDER_Table(statement,faturaName);

            //V2_PAYMENT TABLOSU İÇİN KONTROL
            FaturaliBireyselSatisDBMethods.controlSaleOperationsInSALESDatabase_V2_PAYMENT_Table(statement, invoice.getOdenecekTutar());

            //V2_CUSTOMER TABLOSU İÇİN KONTROL
            FaturaliBireyselSatisDBMethods.controlSaleOperationsInSALESDatabase_V2_CUSTOMER_Table(statement, invoice);

            //V2_ADDRESS TABLOSU İÇİN KONTROL
            FaturaliBireyselSatisDBMethods.controlSaleOperationsInSALESDatabase_V2_ADDRESS_Table(statement, invoice);

            //V2_FINANCIAL_PAPER TABLOSU İÇİN KONTROL
            FaturaliBireyselSatisDBMethods.controlSaleOperationsInSALESDatabase_V2_FINANCIAL_PAPER_Table(statement, invoice);

            //V2_ORDER_ITEM TABLOSU İÇİN KONTROL
            FaturaliBireyselSatisDBMethods.controlSaleOperationsInSALESDatabase_V2_ORDER_ITEM_Table(statement, imei, invoice);

            //V2_ITEM_TAX TABLOSU İÇİN KONTROL
            FaturaliBireyselSatisDBMethods.controlSaleOperationsInSALESDatabase_V2_ITEM_TAX_Table(statement, invoice);

            //---MEDIATOR DATABASE'İ İÇİN KONTROLLER---
            statement = dataBase.DataBaseConn(connectionString,
                    AutomationConstants.oracleUsernameForMediator,
                    AutomationConstants.oraclePasswordForMediator);

            //V2_INVOICE_STATUS TABLOSU İÇİN KONTROL
            FaturaliBireyselSatisDBMethods.controlSaleOperationsInMEDIATORDatabase_V2_INVOICE_STATUS_Table(statement, faturaName);

            //---ERP DATABASE'İ İÇİN KONTROLLER---
            statement = dataBase.DataBaseConn(connectionString,
                    AutomationConstants.oracleUsernameForErp,
                    AutomationConstants.oraclePasswordForErp);

            //V2_ORDER_INFO TABLOSU İÇİN KONTROL
            FaturaliBireyselSatisDBMethods.controlSaleOperationsInERPDatabase_V2_ORDER_INFO_Table(statement, faturaName, invoice);

            //V2_PAYMENT TABLOSU İÇİN KONTROL
            FaturaliBireyselSatisDBMethods.controlSaleOperationsInERPDatabase_V2_PAYMENT_Table(statement, invoice.getOdenecekTutar());

            //V2_CUSTOMER TABLOSU İÇİN KONTROL
            FaturaliBireyselSatisDBMethods.controlSaleOperationsInERPDatabase_V2_CUSTOMER_Table(statement, invoice);

            //V2_ADDRESS TABLOSU İÇİN KONTROL
            FaturaliBireyselSatisDBMethods.controlSaleOperationsInERPDatabase_V2_ADDRESS_Table(statement, invoice);

            //V2_ORDER_DETAIL_ITEM TABLOSU İÇİN KONTROL
            FaturaliBireyselSatisDBMethods.controlSaleOperationsInERPDatabase_V2_ORDER_DETAIL_ITEM_Table(statement, imei, invoice);

            //---STOCK DATABASE'İ İÇİN KONTROLLER---
            dataBase = new DataBase(DataBase.DBType.ORACLE);
            statement = dataBase.DataBaseConn(connectionString,
                    AutomationConstants.oracleUsernameForStock,
                    AutomationConstants.oraclePasswordForStock);

            //V2_INVENTORY_IMEI TABLOSU İÇİN KONTROL
            FaturaliBireyselSatisDBMethods.controlSaleOperationsInSTOCKDatabase_V2_INVENTORY_IMEI_Table(statement, imei);

            //V2_INVENTORY_QUANTITY_RAW TABLOSU İÇİN KONTROL
            FaturaliBireyselSatisDBMethods.controlSaleOperationsInSTOCKDatabase_V2_INVENTORY_QUANTITY_RAW_Table(statement, faturaName, SKU, barkod);

            //V2_INVENTORY_TRANSACTION TABLOSU İÇİN KONTROL
            FaturaliBireyselSatisDBMethods.controlSaleOperationsInSTOCKDatabase_V2_INVENTORY_TRANSACTION_Table(statement, faturaName);

            statement.close();*/
            dataBase.closeDatabaseConnection();
            System.out.println("Faturalı bireysel satış işlemi database kontrolü başarılı, bağlantı kapandı.\n");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Then("^I control create transfer operations in database" )
    public void controlCreateTransferOperationsInDatabase() throws SQLException, ClassNotFoundException {
        /*System.out.println("\nTransfer oluşturma işlemi database'de kontrol ediliyor...");

        try{
            //---TRANSFER DATABASE'İ İÇİN KONTROLLER---
            dataBase = new DataBase(DataBase.DBType.ORACLE);
            Statement statement = dataBase.DataBaseConn(connectionString,
                    AutomationConstants.oracleUsernameForTransfer,
                    AutomationConstants.oraclePasswordForTransfer);

            //V2_TRANSACTION TABLOSU İÇİN KONTROL
            CreateTransferDBMethods.controlCreateTransferOperationsInTRANSFERDatabase_V2_TRANSACTION_Table(statement, transferDokumanNumarasi);

            //V2_TRANSACTION_ITEM TABLOSU İÇİN KONTROL
            CreateTransferDBMethods.controlCreateTransferOperationsInTRANSFERDatabase_V2_TRANSACTION_ITEM_Table(statement, imeiNo);

            //---STOCK DATABASE'İ İÇİN KONTROLLER---
            statement = dataBase.DataBaseConn(connectionString,
                    AutomationConstants.oracleUsernameForStock,
                    AutomationConstants.oraclePasswordForStock);

            //V2_INVENTORY_TRANSFER_PENDING TABLOSU İÇİN KONTROLLER
            CreateTransferDBMethods.controlCreateTransferOperationsInSTOCKDatabase_V2_INVENTORY_TRANSFER_PENDING_Table(statement, transferDokumanNumarasi, imeiNo);

            statement.close();
            dataBase.closeDatabaseConnection();
            System.out.println("Transfer oluşturma işlemi database kontrolü başarılı, bağlantı kapandı.\n");
        }
        catch (Exception e) {
            e.printStackTrace();
        }*/
    }

    @Then("^I control accept transfer operations in database" )
    public void controlAcceptTransferOperationsInDatabase() throws SQLException, ClassNotFoundException {
        /*System.out.println("\nTransfer onaylama işlemi database'de kontrol ediliyor...");

        try{
            //---TRANSFER DATABASE'İ İÇİN KONTROLLER---
            dataBase = new DataBase(DataBase.DBType.ORACLE);
            Statement statement = dataBase.DataBaseConn(connectionString,
                    AutomationConstants.oracleUsernameForTransfer,
                    AutomationConstants.oraclePasswordForTransfer);

            //V2_TRANSACTION TABLOSU İÇİN KONTROL
            AcceptTransferDBMethods.controlAcceptTransferOperationsInTRANSFERDatabase_V2_TRANSACTION_Table(statement, transferDokumanNumarasi);

            //---STOCK DATABASE'İ İÇİN KONTROLLER---
            statement = dataBase.DataBaseConn(connectionString,
                    AutomationConstants.oracleUsernameForStock,
                    AutomationConstants.oraclePasswordForStock);

            //V2_INVENTORY_TRANSFER_PENDING TABLOSU İÇİN KONTROLLER
            AcceptTransferDBMethods.controlAcceptTransferOperationsInSTOCKDatabase_V2_INVENTORY_TRANSFER_PENDING_Table(statement, transferDokumanNumarasi);

            //V2_INVENTORY_QUANTITY_RAW TABLOSU İÇİN KONTROLLER
            AcceptTransferDBMethods.controlAcceptTransferOperationsInSTOCKDatabase_V2_INVENTORY_QUANTITY_RAW_Table(statement, transferDokumanNumarasi);

            //V2_TRANSACTION TABLOSU İÇİN KONTROLLER
            AcceptTransferDBMethods.controlAcceptTransferOperationsInSTOCKDatabase_V2_INVENTORY_TRANSACTION_Table(statement, transferDokumanNumarasi);

            statement.close();
            dataBase.closeDatabaseConnection();
            System.out.println("Transfer onaylama işlemi database kontrolü başarılı, bağlantı kapandı.\n");
        }
        catch (Exception e) {
            e.printStackTrace();
        }*/
    }

    @Then("^I control reject transfer operations in database")
    public void controlRejectTransferOperationsInDatabase() throws SQLException, ClassNotFoundException {
        /*System.out.println("\nTransfer reddetme işlemi database'de kontrol ediliyor...");

        try{
            //---TRANSFER DATABASE'İ İÇİN KONTROLLER---
            dataBase = new DataBase(DataBase.DBType.ORACLE);
            Statement statement = dataBase.DataBaseConn(connectionString,
                    AutomationConstants.oracleUsernameForTransfer,
                    AutomationConstants.oraclePasswordForTransfer);

            //V2_TRANSACTION TABLOSU İÇİN KONTROL
            RejectTransferDBMethods.controlRejectTransferOperationsInTRANSFERDatabase_V2_TRANSACTION_Table(statement, transferDokumanNumarasi);

            //---STOCK DATABASE'İ İÇİN KONTROLLER---
            statement = dataBase.DataBaseConn(connectionString,
                    AutomationConstants.oracleUsernameForStock,
                    AutomationConstants.oraclePasswordForStock);

            //V2_INVENTORY_TRANSFER_PENDING TABLOSU İÇİN KONTROLLER
            RejectTransferDBMethods.controlRejectTransferOperationsInSTOCKDatabase_V2_INVENTORY_TRANSFER_PENDING_Table(statement, transferDokumanNumarasi);

            statement.close();
            dataBase.closeDatabaseConnection();
            System.out.println("Transfer reddetme işlemi database kontrolü başarılı, bağlantı kapandı.\n");
        }
        catch (Exception e) {
            e.printStackTrace();
        }*/
    }

    @Then("^I control cancel transfer operations in database")
    public void controlCancelTransferOperationsInDatabase() throws SQLException, ClassNotFoundException {
        /*System.out.println("\nTransfer iptal etme işlemi database'de kontrol ediliyor...");

        try{
            //---TRANSFER DATABASE'İ İÇİN KONTROLLER---
            dataBase = new DataBase(DataBase.DBType.ORACLE);
            Statement statement = dataBase.DataBaseConn(connectionString,
                    AutomationConstants.oracleUsernameForTransfer,
                    AutomationConstants.oraclePasswordForTransfer);

            //V2_TRANSACTION TABLOSU İÇİN KONTROL
            CancelTransferDBMethods.controlCancelTransferOperationsInTRANSFERDatabase_V2_TRANSACTION_Table(statement, transferDokumanNumarasi);

            //---STOCK DATABASE'İ İÇİN KONTROLLER---
            statement = dataBase.DataBaseConn(connectionString,
                    AutomationConstants.oracleUsernameForStock,
                    AutomationConstants.oraclePasswordForStock);

            //V2_INVENTORY_TRANSFER_PENDING TABLOSU İÇİN KONTROLLER
            CancelTransferDBMethods.controlCancelTransferOperationsInSTOCKDatabase_V2_INVENTORY_TRANSFER_PENDING_Table(statement, transferDokumanNumarasi);

            statement.close();
            dataBase.closeDatabaseConnection();
            System.out.println("Transfer iptal etme işlemi database kontrolü başarılı, bağlantı kapandı.\n");
        }
        catch (Exception e) {
            e.printStackTrace();
        }*/
    }

    @And("^I save transfer dokuman numarasi from (.*) element at index (\\d+)")
    public void saveTransferDokumanNumarasi(String element, int index) {
        transferDokumanNumarasi = commonLib.getTheItemValue(element,index);
        System.out.println("Transfer Dokuman Numarasi: " + transferDokumanNumarasi);
    }

    @And("^I control (.*) element's text is \"([^\"]*)\" at index (\\d+)")
    public boolean controlElementsText(String element, String expectedText, int index) {
        String elementsText = commonLib.getTheItemValue(element, index);
        System.out.println("elementsText = " + elementsText);
        System.out.println("expectedText = " + expectedText);
        boolean flag = false;
        try {
            if (elementsText != null) {
                if(elementsText.equals(expectedText)){
                    System.out.println(elementsText);
                    commonLib.allureReport(StepResultType.PASS, "Element's text is expected value:" + elementsText, true);
                    return true;
                }
                else {
                    System.out.println("Text is not the expected value." );
                    commonLib.allureReport(StepResultType.FAIL, "Element's text is not the expected value.", true);
                    flag = false;
                }
            }
        } catch (Exception e) {
            System.out.println("Could not got the text." );
            commonLib.allureReport(StepResultType.FAIL, "Could not got the text.", true);
            flag = false;

        }
        return flag;
    }

    @And("^I control (.*) element's count is (\\d+) at index (\\d+)")
    public boolean controlElementsCount(String element, int expectedElementCount, int index) {

        int elementCount = commonLib.findElements(element,index).size();
        System.out.println("elementCount = " + elementCount);

        boolean flag = false;
        try {
            if (elementCount == expectedElementCount){
                System.out.println("Element count is correct");
                commonLib.allureReport(StepResultType.PASS, "Element count is correct:" , true);
                return true;
            }
            else {
                System.out.println("Element count is not correct" );
                commonLib.allureReport(StepResultType.FAIL, "Element count is not correct", true);
                flag = false;
            }
        } catch (Exception e) {
            System.out.println("Could not find the elements." );
            commonLib.allureReport(StepResultType.FAIL, "Could not find the elements.", true);
            flag = false;
        }
        return flag;
    }

    @And("^I save fatura name from (.*) element at index (\\d+)")
    public void saveFaturaName(String element, int index) {
        String faturaDetay = commonLib.getTheItemValue(element,index);
        faturaName = faturaDetay.substring(14);
        System.out.println("Fatura İsmi: " + faturaName);
    }

    @And("I verify contents of the downloaded PDF file")
    public void verifyContentsOfPDFFile() throws IOException {
        String pdfFileName = faturaName + ".pdf";
        String pdfFilePath = System.getProperty("user.home") + "\\Downloads\\" + pdfFileName;
        File pdfFile = new File(pdfFilePath);

        PDDocument pdfDocument = PDDocument.load(new File(pdfFilePath));
        String pdfDocumentText = new PDFTextStripper().getText(pdfDocument);
        String[] pdfDocumentTextLines = pdfDocumentText.split("\n");
        System.out.println(pdfDocumentText);

        //satır sonundaki özel karakterleri sil
        for (int i = 0; i < Arrays.stream(pdfDocumentTextLines).count(); i++){
            pdfDocumentTextLines[i] = pdfDocumentTextLines[i].replaceAll("\r","");
            if(pdfDocumentTextLines[i].charAt(pdfDocumentTextLines[i].length() - 1) == ' ') {
                pdfDocumentTextLines[i] = pdfDocumentTextLines[i].substring(0, pdfDocumentTextLines[i].length() - 1);
            }
        }

        // her satırı gezerek ilgili satırlarda
        // pdf dökümanından gelen değerler ile arayüzden gelen değerleri karşılaştır
        for (int i = 0; i < Arrays.stream(pdfDocumentTextLines).count(); i++){
            //11. satırda isim kontrolü
            if(i==10 &&
                    !pdfDocumentTextLines[i].equals(invoice.getMusteriIsmi()))
            {
                System.out.println("Faturadan gelen musteri ismi:" + pdfDocumentTextLines[i]);
                System.out.println("Arayüzden gelen musteri ismi:" + invoice.getMusteriIsmi());
                commonLib.allureReport(StepResultType.FAIL, "Faturadaki musteri ismi dogru degil", true);
            }
            //12 ve 13.satırda adres kontrolü
            if(i==11 &&
                    !(pdfDocumentTextLines[i] + pdfDocumentTextLines[i+1]).replace("/","").equals(invoice.getMusteriAdresi()))
            {
                commonLib.allureReport(StepResultType.FAIL, "Faturadaki musteri adresi dogru degil", true);
            }
            //15.satırda tel kontrolü
            if(i==14 &&
                    !pdfDocumentTextLines[i].substring(6).equals(invoice.getMusteriTel()))
            {
                commonLib.allureReport(StepResultType.FAIL, "Faturadaki musteri tel numarasi dogru degil", true);
            }
            //16.satırda tckn kontrolü
            if(i==15 &&
                    !pdfDocumentTextLines[i].substring(7).equals(invoice.getMusteriTCKN()))
            {
                commonLib.allureReport(StepResultType.FAIL, "Faturadaki musteri tckn dogru degil", true);
            }
            //17.satırda belge no kontrolü
            if(i==16 &&
                    !pdfDocumentTextLines[i].substring(7).equals(invoice.getBelgeNo()))
            {
                commonLib.allureReport(StepResultType.FAIL, "Faturadaki belge no (ETTN) dogru degil", true);
            }
            //24.satırda fatura no kontrolü
            if(i==23 &&
                    !pdfDocumentTextLines[i].substring(12).equals(invoice.getFaturaNo()))
            {
                commonLib.allureReport(StepResultType.FAIL, "Faturadaki fatura no dogru degil", true);
            }
            //50.satırda barkod kontrolü
            if(i==49 &&
                    !pdfDocumentTextLines[i].substring(2).equals(invoice.getBarkod()))
            {
                commonLib.allureReport(StepResultType.FAIL, "Faturadaki barkod dogru degil", true);
            }
            //51-52-53-54.satırlarda ürün ismi kontrolü
            if(i == 50 &&
                    !(pdfDocumentTextLines[i] + " "
                            + pdfDocumentTextLines[i+1] + " "
                            + pdfDocumentTextLines[i+2] + " "
                            + pdfDocumentTextLines[i+3]).equals(invoice.getUrunIsmi()))
            {
                commonLib.allureReport(StepResultType.FAIL, "Faturadaki urun ismi dogru degil", true);
            }
            //55.satırda imei kontrolü
            if(i == 54 &&
                    !pdfDocumentTextLines[i].substring(1,16).equals(invoice.getImei()))
            {
                commonLib.allureReport(StepResultType.FAIL, "Faturadaki imei dogru degil", true);
            }
            //58.satırda Mal / Hizmet Toplam Tutarı kontrolü
            if(i == 57 &&
                    !pdfDocumentTextLines[i].substring(29,38).replace(".", "").replace(",",".").equals(invoice.getMalHizmetToplamTutari()))
            {
                commonLib.allureReport(StepResultType.FAIL, "Faturadaki mal / hizmet tutari dogru degil", true);
            }
            //59.satırda toplam iskonto kontrolü
            if(i == 58 &&
                    !pdfDocumentTextLines[i].substring(17,21).replace(",",".").equals(invoice.getToplamIskonto()))
            {
                commonLib.allureReport(StepResultType.FAIL, "Faturadaki toplam iskonto dogru degil", true);
            }
            //60.satırda KDV kontrolü
            if(i == 59 &&
                    !pdfDocumentTextLines[i].substring(25,33).replace(".", "").replace(",",".").equals(invoice.getKDV()))
            {
                commonLib.allureReport(StepResultType.FAIL, "Faturadaki KDV dogru degil", true);
            }
            //62.satırda ödenecek tutar kontrolü
            if(i == 61 &&
                    !pdfDocumentTextLines[i].substring(17,26).replace(".", "").replace(",",".").equals(invoice.getOdenecekTutar()))
            {
                commonLib.allureReport(StepResultType.FAIL, "Faturadaki ödenecek tutar dogru degil", true);
            }
        }
        pdfDocument.close();
        FileUtils.forceDeleteOnExit(pdfFile);
        System.out.println("Fatura icerigi dogru");
        commonLib.allureReport(StepResultType.PASS, "Fatura icerigi dogru" , true);
    }

    @And("I save invoice information into variables")
    public void saveInvoiceInformation() throws InterruptedException {
        invoice = new Invoice();

        invoice.setSessionID(faturaName);

        /*WebElement musteriIsmiElementi = commonLib.findElement("faturaDetaylariSatisDetaylari",12);
        ((JavascriptExecutor) oDriver).executeScript("arguments[0].scrollIntoView(true);", musteriIsmiElementi);
        System.out.println(musteriIsmiElementi.getText());
        invoice.setMusteriIsmi(
                musteriIsmiElementi.getText()
        );

        WebElement musteriAdresiElementi = commonLib.findElement("faturaDetaylariSatisDetaylari",13);
        ((JavascriptExecutor) oDriver).executeScript("arguments[0].scrollIntoView(true);", musteriAdresiElementi);
        System.out.println(musteriAdresiElementi.getText());
        invoice.setMusteriAdresi(
                musteriAdresiElementi.getText()
        );

        WebElement musteriTelElementi = commonLib.findElement("faturaDetaylariSatisDetaylari",14);
        ((JavascriptExecutor) oDriver).executeScript("arguments[0].scrollIntoView(true);", musteriTelElementi);
        System.out.println(musteriTelElementi.getText());
        invoice.setMusteriTel(
                musteriTelElementi.getText()
        );

        WebElement musteriTCKNElementi = commonLib.findElement("faturaDetaylariSatisDetaylari",15);
        ((JavascriptExecutor) oDriver).executeScript("arguments[0].scrollIntoView(true);", musteriTCKNElementi);
        System.out.println(musteriTCKNElementi.getText());
        invoice.setMusteriTCKN(
                musteriTCKNElementi.getText()
        );

        WebElement belgeNoElementi = commonLib.findElement("faturaDetaylariSatisDetaylari",7);
        ((JavascriptExecutor) oDriver).executeScript("arguments[0].scrollIntoView(true);", belgeNoElementi);
        System.out.println(belgeNoElementi.getText());
        invoice.setBelgeNo(
                belgeNoElementi.getText()
        );

        WebElement faturaNoElementi = commonLib.findElement("faturaDetaylariSatisDetaylari",10);
        ((JavascriptExecutor) oDriver).executeScript("arguments[0].scrollIntoView(true);", faturaNoElementi);
        System.out.println(faturaNoElementi.getText().substring(10));
        invoice.setFaturaNo(
                faturaNoElementi.getText().substring(10)
        );


        WebElement barkodElementi = commonLib.findElement("faturaDetaylariUrunDetaylari",4);
        ((JavascriptExecutor) oDriver).executeScript("arguments[0].scrollIntoView(true);", barkodElementi);
        System.out.println(barkodElementi.getText().replaceAll("\ncontent_copy",""));
        invoice.setBarkod(
                barkodElementi.getText().replaceAll("\ncontent_copy","")
        );

        WebElement urunIsmiElementi = commonLib.findElement("faturaDetaylariUrunDetaylari",2);
        ((JavascriptExecutor) oDriver).executeScript("arguments[0].scrollIntoView(true);", urunIsmiElementi);
        System.out.println(urunIsmiElementi.getText().replaceAll("\ncontent_copy",""));
        invoice.setUrunIsmi(
                urunIsmiElementi.getText().replaceAll("\ncontent_copy","")
        );

        WebElement imeiElementi = commonLib.findElement("faturaDetaylariUrunDetaylari",3);
        ((JavascriptExecutor) oDriver).executeScript("arguments[0].scrollIntoView(true);", imeiElementi);
        System.out.println(imeiElementi.getText().replaceAll("\ncontent_copy",""));
        invoice.setImei(
                imeiElementi.getText().replaceAll("\ncontent_copy","")
        );

        WebElement malHizmetToplamTutariElementi = commonLib.findElement("faturaDetaylariSatisDetaylari",1);
        ((JavascriptExecutor) oDriver).executeScript("arguments[0].scrollIntoView(true);", malHizmetToplamTutariElementi);
        System.out.println(malHizmetToplamTutariElementi.getText());
        invoice.setMalHizmetToplamTutari(
                malHizmetToplamTutariElementi.getText()
        );

        WebElement toplamIskontoElementi = commonLib.findElement("faturaDetaylariSatisDetaylari",3);
        ((JavascriptExecutor) oDriver).executeScript("arguments[0].scrollIntoView(true);", toplamIskontoElementi);
        System.out.println(toplamIskontoElementi.getText());
        invoice.setToplamIskonto(
                toplamIskontoElementi.getText()
        );

        WebElement KDVElementi = commonLib.findElement("faturaDetaylariSatisDetaylari",2);
        ((JavascriptExecutor) oDriver).executeScript("arguments[0].scrollIntoView(true);", KDVElementi);
        System.out.println(KDVElementi.getText());
        invoice.setKDV(
                KDVElementi.getText()
        );

        WebElement odenecekTutarElementi = commonLib.findElement("faturaDetaylariSatisDetaylari",5);
        ((JavascriptExecutor) oDriver).executeScript("arguments[0].scrollIntoView(true);", odenecekTutarElementi);
        System.out.println(odenecekTutarElementi.getText());
        invoice.setOdenecekTutar(
                odenecekTutarElementi.getText()
        );*/
    }

}




