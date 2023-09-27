package com.saf.framework;
import API.stockPojo.Login;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.qameta.allure.model.*;
import io.github.bonigarcia.wdm.WebDriverManager;
import io.qameta.allure.Allure;
import org.openqa.selenium.*;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.Proxy.ProxyType;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxOptions;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.ie.InternetExplorerOptions;

import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.URL;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.*;
import java.util.concurrent.TimeUnit;

public class CommonLib extends MyTestNGBaseClass {
    public static WebDriver oDriver;
    public String page = "common";
    public static String referenceNumber;
    public static String pricingNo;
    public static String positiveornegative;
    public static String itemValue;
    public static double creditAmount;
    int timeout = 120;
    Parser parser = new Parser();
    Actions actions = new Actions(oDriver);
    WebDriverWait wait = new WebDriverWait(oDriver, 30);

    Map<String, String> variables = new HashMap<String, String>();

    public static String prepJson(Object dataClass) {
        // Creating Object of ObjectMapper define in Jackson API
        ObjectMapper Obj = new ObjectMapper();
        try {
            // Converting the Java object into a JSON string
            // Java objects to JSON string - pretty-print
            return Obj.writerWithDefaultPrettyPrinter().writeValueAsString(dataClass);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static List<String> getAddedICCIs() {
        List<String> ICCIs = new ArrayList<>();

        /*Long.parseLong(AutomationConstants.startICCI.substring(6));

        Long.parseLong(AutomationConstants.endICCI.substring(6));*/

        ICCIs.add(AutomationConstants.startICCI);
        ICCIs.add(AutomationConstants.endICCI);

        return ICCIs;
    }

    public String getTheElementInformation(String elem, int index) {
        System.out.println(findElement(elem, index).getText());
        String elementText = findElement(elem, index).getText();
        this.referenceNumber = elementText;
        System.out.println(elementText);
        return elementText;
    }


    public double getTheElementInformationForCreditAmount(String elem, int index) {
        System.out.println(findElement(elem, index).getText());
        double elementText = Double.parseDouble(findElement(elem, index).getText());
        System.out.println(elementText);
        return elementText;

    }

    public String readTheElementInformation(String elem, int index) {
        System.out.println(findElement(elem, index).getText());
        String elementText = findElement(elem, index).getText();
        System.out.println(elementText);
        return elementText;
    }

    public String getTheElementInformationForPricing(String elem, int index) {
        System.out.println(findElement(elem, index).getText());
        String elementTextPricing = findElement(elem, index).getText();
        this.pricingNo = elementTextPricing;
        System.out.println(elementTextPricing);
        return elementTextPricing;
    }

    public String getTheElementInformation2(String elem, int index) {
        System.out.println(findElement(elem, index).getText());
        String elementText = findElement(elem, index).getText();
        this.positiveornegative = elementText;
        System.out.println(elementText);
        return elementText;
    }

    public void doubleClickElement(WebElement object) {
        actions.doubleClick(object).perform();

    }

    public WebElement findElement(String elem, int index) {
        WebElement object = null;
        String element = parser.getElement(page, elem);

        try {
            if (element != null) {
                if (element.startsWith("//") || element.startsWith("(//")) {
                    object = oDriver.findElements(By.xpath(element)).get(index - 1);

                    System.out.println("Element found : " + elem);
                } else if (element.startsWith("#") || element.startsWith(".")) {
                    object = oDriver.findElements(By.cssSelector(element)).get(index - 1);
                    System.out.println("Element found : " + elem);
                } else {
                    object = oDriver.findElements(By.id(element)).get(index - 1);
                    System.out.println("Element found : " + elem);
                }
            } else if (element == null) {
                object = oDriver.findElement(By.xpath("//*[text()='" + elem + "'or contains(text(),'" + elem + "')]"));
            }

            if (object == null) {
                System.out.println("Element not found: " + elem);

            }
            return object;
        } catch (Exception e) {
            System.out.println("Element not found: " + elem);
            allureReport(StepResultType.FAIL, "There is no such element. " + elem, true);

            return null;

        }
    }

    public List<WebElement> findElements(String elem, int index) {
        //WebElement object = null;
        List<WebElement> objects = null;
        String element = parser.getElement(page, elem);

        try {
            if (element != null) {
                if (element.startsWith("//") || element.startsWith("(//")) {
                    objects = oDriver.findElements(By.xpath(element));

                    System.out.println("Elements found : " + elem);
                } else if (element.startsWith("#") || element.startsWith(".")) {
                    objects = oDriver.findElements(By.cssSelector(element));
                    System.out.println("Elements found : " + elem);
                } else {
                    objects = oDriver.findElements(By.id(element));
                    System.out.println("Element found : " + elem);
                }
            } else if (element == null) {
                objects = oDriver.findElements(By.xpath("//*[text()='" + elem + "'or contains(text(),'" + elem + "')]"));
            }

            if (objects == null) {
                System.out.println("Elements not found: " + elem);

            }
            return objects;
        } catch (Exception e) {
            System.out.println("Elements not found: " + elem);
            allureReport(StepResultType.FAIL, "There are no elements. " + elem, true);

            return null;

        }
    }


    public String getTheItemValueFromAttribute(String elem, int index) {
        String elementText = (findElement(elem, index).getAttribute("value"));
        System.out.println(elementText);
        this.itemValue = elementText;
        //System.out.println(itemValue);
        return elementText;
    }

    public String getTheItemTextFromAttribute(String elem, int index) {

        String elementText = (findElement(elem, index).getAttribute("text"));
        System.out.println(elementText);
        this.itemValue = elementText;
        //System.out.println(itemValue);
        return elementText;
    }

    public String getTheItemValue(String elem, int index) {
        String elementText = (findElement(elem, index).getText());
        //System.out.println(elementText);
        this.itemValue = elementText;
        //System.out.println(itemValue);
        return elementText;
    }


    public String seePage(String page) {
        List<String> returnValue = parser.isPageExist(page);

        try {
            if (returnValue.get(0).equalsIgnoreCase(page)) {
                System.out.println(page + " page found!");
                this.page = page;

                if (returnValue.get(1).length() > 0) {
                    waitElement(returnValue.get(1), timeout, 1);
                }
                allureReport(StepResultType.PASS, "I see " + page + " page.(Page found)", false);
                return page;
            }
        } catch (Exception e) {
            allureReport(StepResultType.FAIL, "I see " + page + " page.(Page not found)", true);

        }
        return null;
    }

    public WebElement waitElement(String element, int timeout, int index) throws InterruptedException {
        WebElement object;
        try {
            for (int i = 0; i < timeout; i++) {

                object = findElement(element, index);
                if (object != null) {
                    Thread.sleep(2000);
                    return object;
                } else {
                    Thread.sleep(2000);
                }
            }
        } catch (Exception e) {
            allureReport(StepResultType.FAIL, "Element could not find. ", true);
        }
        return null;
    }

    public String getRandomString() {
        String RANDOMCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 10) { // length of the random string.
            int index = (int) (rnd.nextFloat() * RANDOMCHARS.length());
            salt.append(RANDOMCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;

    }

    //-----------------------------------------------
    //Define the method for Proxy
    //-----------------------------------------------
    public static Proxy getProxy() throws Exception {
        Proxy oProxy = new Proxy();
        String sProxyString = String.format("%s:%d", AutomationConstants.sProxyHostName, AutomationConstants.iProxyPort);

        oProxy.setProxyType(ProxyType.MANUAL);
        oProxy.setHttpProxy(sProxyString);
        oProxy.setSslProxy(sProxyString);

        return oProxy;

    }

    //-----------------------------------------------
    //Define the method of Desired capability of the browsers - javascript = true and set the Proxy for the browser
    //-----------------------------------------------
    public static DesiredCapabilities getCapability() throws Exception {
        DesiredCapabilities oCapability = new DesiredCapabilities();
        oCapability.setJavascriptEnabled(true);
        //oCapability.setCapability("proxy", getProxy());

        return oCapability;
    }

    //-----------------------------------------------
    //set InterExplorer options by merging the Desired Capability
    //-----------------------------------------------
    public static InternetExplorerOptions getIEOptions() throws Exception {
        InternetExplorerOptions oIEOptions = new InternetExplorerOptions();
        oIEOptions.merge(getCapability());
        oIEOptions.ignoreZoomSettings();
        oIEOptions.introduceFlakinessByIgnoringSecurityDomains();

        return oIEOptions;
    }

    //-----------------------------------------------
    //set ChromeOptions by merging the Desired Capability
    //-----------------------------------------------
    public static ChromeOptions getChromeOptions() throws Exception {
        ChromeOptions chromeOptions = new ChromeOptions();
        chromeOptions.merge(getCapability());
        chromeOptions.addArguments("test-type");
        //Dil çevirme penceresini kapattırma.
        chromeOptions.addArguments("disable-translate");
        //Browser tam ekranda gösterilir.
        chromeOptions.addArguments("start-maximized");
        //Pop-uplar bloklanır.
        chromeOptions.addArguments("disable-popup-blocking");
        chromeOptions.addArguments("--force-device-scale-factor=0.67");
        chromeOptions.setCapability("unexpectedAlertBehaviour", "ignore");
        chromeOptions.addArguments("--no-sandbox");
        chromeOptions.addArguments("--disable-dev-shm-usage");
        chromeOptions.setPageLoadStrategy(PageLoadStrategy.NONE);
        return chromeOptions;
    }

    //-----------------------------------------------
    //set FirefoxOptions by merging the Desired Capability
    //-----------------------------------------------
    public static FirefoxOptions getFirefoxOptions() throws Exception {
        FirefoxOptions oFirefoxOptions = new FirefoxOptions();
        oFirefoxOptions.merge(getCapability());

        return oFirefoxOptions;
    }

    //----------------------------------------
    //Define browserId
    //----------------------------------------
    public static int getBrowserId(String sBrowserName) throws Exception {
        if (sBrowserName.equalsIgnoreCase("ie")) return 1;
        if (sBrowserName.equalsIgnoreCase("firefox")) return 2;
        if (sBrowserName.equalsIgnoreCase("chrome")) return 3;
        if (sBrowserName.equalsIgnoreCase("htmlunit")) return 4;

        return -1;
    }

    public static WebDriver getDriver(String sBrowserName) throws Exception {

        switch (getBrowserId(sBrowserName)) {
            case 1:
                System.setProperty("webdriver.ie.driver", System.getProperty("user.dir") + AutomationConstants.sIEDriverPath);
                WebDriverManager.iedriver().setup();
                System.setProperty("webdriver.ie.driver", System.getProperty("user.dir") + AutomationConstants.sIEDriverPath);

                oDriver = new InternetExplorerDriver(getIEOptions());
                break;

            case 2:
                System.setProperty("webdriver.gecko.driver", System.getProperty("user.dir") + AutomationConstants.sGeckoDriverPath);
                WebDriverManager.firefoxdriver().setup();
                oDriver = new FirefoxDriver(getFirefoxOptions());
                break;

            case 3:
                //System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir") + AutomationConstants.sChromeDriverPath);
                WebDriverManager.chromedriver().setup();
                oDriver = new ChromeDriver(getChromeOptions());
                break;

            default:
                throw new Exception("Unknown browsername =" + sBrowserName +
                        " valid names are: ie,firefox,chrome,htmlunit");
        }

        oDriver.manage().deleteAllCookies();
        oDriver.manage().timeouts().pageLoadTimeout(AutomationConstants.lngPageLoadTimeout, TimeUnit.SECONDS);
        oDriver.manage().timeouts().implicitlyWait(AutomationConstants.lngImplicitWaitTimeout, TimeUnit.SECONDS);

        return oDriver;

    }

    //-------------------------------------------
    //Define remoteDriver type
    //-------------------------------------------
    public static WebDriver getRemoteDriver(String sHubUrl, String sBrowserName) throws Exception {
        WebDriver oDriver;
        DesiredCapabilities oCapability = getCapability();

        switch (getBrowserId(sBrowserName)) {
            case 1:
                oCapability.setBrowserName("internet explorer");
                break;

            case 2:
                oCapability.setBrowserName("firefox");
                break;

            case 3:
                oCapability.setBrowserName("chrome");
                break;

            case 4:
                oCapability.setBrowserName("htmlunit");

            default:
                throw new Exception("Unknown browsername = " + sBrowserName +
                        "  Valid names are: ie,firefox,chrome,htmlunit");
        }

        oCapability.setPlatform(Platform.WINDOWS);

        oDriver = new RemoteWebDriver(new URL(sHubUrl), oCapability);

        if (getBrowserId(sBrowserName) != 4) {
            oDriver.manage().window().maximize();
        }


        oDriver.manage().deleteAllCookies();
        oDriver.manage().timeouts().pageLoadTimeout(AutomationConstants.lngPageLoadTimeout, TimeUnit.SECONDS);
        oDriver.manage().timeouts().implicitlyWait(AutomationConstants.lngImplicitWaitTimeout, TimeUnit.SECONDS);

        return oDriver;
    }

    //-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
    //This method is used to set a particular attribute using JavaScript
    //-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
    public static boolean setAttribute(WebDriver oDriver, By identifier, String attribute, String value) {
        if (oDriver.findElements(identifier).size() > 0) {
            WebElement oElement = oDriver.findElement(identifier);
            if (oElement.isDisplayed() && oElement.isEnabled()) {
                JavascriptExecutor jsExec = (JavascriptExecutor) oDriver;
                jsExec.executeScript("arguments[0].setAttribute('" + attribute + "','" + value + "')", oElement);
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    //-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
    //This method is used to validate if an element is visible
    //Make sure the same method is used throughout the pages classes as well as other generic methods
    //-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
    public static boolean checkElementVisibility(WebDriver oDriver, By identifier) {
        boolean res = false;

        if (oDriver.findElements(identifier).size() > 0) {
            if (oDriver.findElement(identifier).isDisplayed()) {
                res = true;
            } else {
                return false;
            }
        }

        return res;
    }

    public static boolean checkElementDisplayed(WebDriver oDriver, By identifier) {
        boolean status = false;
        oDriver.manage().timeouts().implicitlyWait(AutomationConstants.lngImplicitWaitTimeout, TimeUnit.SECONDS);
        try {
            if (oDriver.findElement(identifier).isDisplayed()) {
                status = true;
            }
        } catch (NoSuchElementException e) {
            System.out.println("Element not found");
        }
        return status;
    }

    public static void navigateToURL(WebDriver oDriver, String URL) {
        oDriver.navigate().to(URL);
    }

    public static boolean waitElementVisible(WebDriver oDriver, WebElement element) {
        boolean flag = false;
        WebDriverWait wait = new WebDriverWait(oDriver, 60);
        try {
            wait.until(ExpectedConditions.visibilityOf(element));
            flag = true;
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    public static boolean checkElementVisibility(WebElement element) {
        boolean res = false;
        if (element.isDisplayed()) {
            res = true;
        } else {
            return res;
        }
        return res;
    }

    public boolean sendKeys(WebElement element, String text) {
        boolean flag = false;
        try {
            if (element.isDisplayed() && element.isEnabled()) {
                waitSeconds(1);
                element.click();
                if (element.getText().equals("")) {
                    element.clear();
                    waitSeconds(1);
                }
                element.sendKeys(text);
                allureReport(StepResultType.PASS, "A value has been entered in the " + element.getText() + " Input field.", true);
                return true;
            }
        } catch (Exception e) {
            allureReport(StepResultType.FAIL, "Could not enter value for " + element.getText() + " element.", true);
            flag = false;
        }
        return flag;
    }

    //It allows to wait on the page for as long as required.
    //-------------------------------------------------------------------------------------------------------------------------------
    public static void waitSeconds(int sec) {
        try {
            Thread.sleep(sec * 1000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }


    public void saveVariable(String key,String value){
        variables.put(key,value);


    }
    public String getVariable(String key){
       return variables.get(key);


    }
    public void saveGlobalVariable(String key,String value){
        AutomationConstants.globalVariables.put(key,value);


    }
    public String getGlobalVariable(String key){
        return AutomationConstants.globalVariables.get(key);


    }

    public WebElement findElement(By elementLocator) {

        WebElement object = null;


        try {

                object = oDriver.findElement(elementLocator);


            if (object == null) {
                System.out.println("Element not found: "+elementLocator.toString());

            }
            return object;
        } catch (Exception e) {
            System.out.println("Element not found: " + elementLocator.toString());
            allureReport(StepResultType.FAIL,"There is no such element.",true);


            return null;

        }
    }
    public static void allureReport(StepResultType result, String message, boolean ssFlag) {
        try {
            if (ssFlag) {
                Allure.addAttachment("Screenshot : " + message, new ByteArrayInputStream(((TakesScreenshot) oDriver).getScreenshotAs(OutputType.BYTES)));
            }
            if (result.toString().equalsIgnoreCase("PASS")) {
                Allure.step(message, Status.PASSED);
            } else if (result.toString().equalsIgnoreCase("INFO")) {
                Allure.step(message, Status.SKIPPED);
            } else if (result.toString().equalsIgnoreCase("FAIL")) {
                Allure.step(message, Status.FAILED);
                Assert.fail(message);
            } else {
                Allure.step(message);
            }

        } catch (Exception e) {
        }

    }
}
