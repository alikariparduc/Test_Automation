package com.saf.framework.databasemethods;

import com.saf.framework.Invoice;
import com.saf.framework.StepResultType;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class VDMtoSilverSaleDBMethods extends  DataBaseMethods{

    private static int paymentID;
    private static int customerID;
    private static int addresID;
    private static int orderItemID;

    public static void controlSaleOperationsInSALESDatabase_V2_SALES_ORDER_Table(Statement st, String sessionID) throws SQLException {

        try{
            //Session ID için kaydı getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_SALES_ORDER WHERE SESSION_ID = '"+sessionID+"'");

            //Kaydın geldiğini, gelen kayıtta ilgili sutünları kontrol et
            if(rs.next()) {
                if(rs.getString("SALES_SOURCE").equals("INVOICE") &&
                   rs.getString("STATUS").equals("INVOICED") &&
                   rs.getString("ERP_STATUS").equals("SAVED_ON_ERP_SERVICE"))
                {
                    System.out.println("Kayıt SALES Database'inde V2_SALES_ORDER tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt SALES Database'inde V2_SALES_ORDER tablosuna doğru bir şekilde eklendi.", true);
                }
                else {
                    System.out.println("Kayıt SALES Database'inde V2_SALES_ORDER tablosuna doğru eklenemedi, sutün içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt SALES Database'inde V2_SALES_ORDER tablosuna doğru eklenemedi, sutün içeriği yanlış.", true);
                }

                //payment id ve customer id'leri sonraki tablo kontrolleri için kaydet
                paymentID = rs.getInt("PAYMENT_ID");
                customerID = rs.getInt("CUSTOMER_ID");
            }
            else {
                System.out.println("Kayıt SALES Database'inde V2_SALES_ORDER tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt SALES Database'inde V2_SALES_ORDER tablosuna eklenemedi.", true);
            }
            rs.close();

        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void controlSaleOperationsInSALESDatabase_V2_PAYMENT_Table(Statement st, String cash) throws SQLException {

        try{
            //V2_SALES_ORDER tablosundan kaydedilen payment_id için kaydı getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_PAYMENT WHERE ID = '"+paymentID+"'");

            //Kaydın geldiğini, gelen kayıtta ilgili sutünları kontrol et
            if(rs.next()) {
                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getDouble("CASH") == (Double.parseDouble(cash)))
                {
                    System.out.println("Kayıt SALES Database'inde V2_PAYMENT tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt SALES Database'inde V2_PAYMENT tablosuna doğru bir şekilde eklendi.", true);
                }
                else {
                    System.out.println("Kayıt SALES Database'inde V2_PAYMENT tablosuna doğru eklenemedi, sutün içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt SALES Database'inde V2_PAYMENT tablosuna doğru eklenemedi, sutün içeriği yanlış.", true);
                }
            }
            else {
                System.out.println("Kayıt SALES Database'inde V2_PAYMENT tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt SALES Database'inde V2_PAYMENT tablosuna eklenemedi.", true);
            }
            rs.close();

        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void controlSaleOperationsInSALESDatabase_V2_CUSTOMER_Table(Statement st, Invoice invoice) throws SQLException {

        try{
            //V2_SALES_ORDER tablosundan kaydedilen customer_id için kaydı getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_CUSTOMER WHERE ID = '"+customerID+"'");

            //Kaydın geldiğini, gelen kayıtta ilgili sutünları kontrol et
            if(rs.next()) {
                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getString("PHONE_NUMBER").equals(invoice.getMusteriTel()))
                {
                    System.out.println("Kayıt SALES Database'inde V2_CUSTOMER tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt SALES Database'inde V2_CUSTOMER tablosuna doğru bir şekilde eklendi.", true);
                }
                else {
                    System.out.println("Kayıt SALES Database'inde V2_CUSTOMER tablosuna doğru eklenemedi, sutün içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt SALES Database'inde V2_CUSTOMER tablosuna doğru eklenemedi, sutün içeriği yanlış.", true);
                }

                //adress_id'yi sonraki tablo kontrolü için kaydet
                addresID = rs.getInt("ADDRESS_ID");
            }
            else {
                System.out.println("Kayıt SALES Database'inde V2_CUSTOMER tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt SALES Database'inde V2_CUSTOMER tablosuna eklenemedi.", true);
            }
            rs.close();

        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void controlSaleOperationsInSALESDatabase_V2_ADDRESS_Table(Statement st, Invoice invoice) throws SQLException {

        try{
            //V2_CUSTOMER tablosundan kaydedilen address_id için kaydı getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_ADDRESS WHERE ID = '"+addresID+"'");

            //Kaydın geldiğini, gelen kayıtta ilgili sutünları kontrol et
            if(rs.next()) {
                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getString("STREET").concat(" ").concat(rs.getString("DISTRICT"))
                                                   .concat(" ").concat(rs.getString("CITY"))
                                                   .equals(invoice.getMusteriAdresi()))
                {
                    System.out.println("Kayıt SALES Database'inde V2_ADDRESS tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt SALES Database'inde V2_ADDRESS tablosuna doğru bir şekilde eklendi.", true);
                }
                else {
                    System.out.println("Kayıt SALES Database'inde V2_ADDRESS tablosuna doğru eklenemedi, sutün içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt SALES Database'inde V2_ADDRESS tablosuna doğru eklenemedi, sutün içeriği yanlış.", true);
                }
            }
            else {
                System.out.println("Kayıt SALES Database'inde V2_ADDRESS tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt SALES Database'inde V2_ADDRESS tablosuna eklenemedi.", true);
            }
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void controlSaleOperationsInSALESDatabase_V2_FINANCIAL_PAPER_Table(Statement st, Invoice invoice) throws SQLException {

        try{
            //ettn(belge no) ile kaydı getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_FINANCIAL_PAPER WHERE ETTN = '"+ invoice.getBelgeNo()+"'");

            //Kaydın geldiğini, gelen kayıtta ilgili sutünları kontrol et
            if(rs.next()) {
                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getString("OPERATION_TYPE").equals("SALES") &&
                   rs.getString("FINANCIAL_PAPER_TYPE").equals("INVOICE") &&
                   rs.getString("DOCUMENT_NO").substring(rs.getString("DOCUMENT_NO").indexOf("=") + 1)
                           .equals(invoice.getFaturaNo()))
                {
                    System.out.println("Kayıt SALES Database'inde V2_FINANCIAL_PAPER tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt SALES Database'inde V2_FINANCIAL_PAPER tablosuna doğru bir şekilde eklendi.", true);
                }
                else {
                    System.out.println("Kayıt SALES Database'inde V2_FINANCIAL_PAPER tablosuna doğru eklenemedi, sutün içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt SALES Database'inde V2_FINANCIAL_PAPER tablosuna doğru eklenemedi, sutün içeriği yanlış.", true);
                }
            }
            else {
                System.out.println("Kayıt SALES Database'inde V2_FINANCIAL_PAPER tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt SALES Database'inde V2_FINANCIAL_PAPER tablosuna eklenemedi.", true);
            }
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void controlSaleOperationsInSALESDatabase_V2_ORDER_ITEM_Table(Statement st, String imei, Invoice invoice) throws SQLException {

        try{
            //IMEI'ye göre kaydı getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_ORDER_ITEM WHERE IMEI = '"+imei+"'");

            //Kaydın geldiğini, gelen kayıtta ilgili sutünları kontrol et
            if(rs.next()) {
                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getString("NAME").equals(invoice.getUrunIsmi()) &&
                   rs.getString("BARCODE").equals(invoice.getBarkod()) &&
                   rs.getInt("QUANTITY") == 1 &&
                   rs.getDouble("SALES_PRICE") == Double.parseDouble(invoice.getOdenecekTutar()))
                {
                    System.out.println("Kayıt SALES Database'inde V2_ORDER_ITEM tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt SALES Database'inde V2_ORDER_ITEM tablosuna doğru bir şekilde eklendi.", true);
                }
                else {
                    System.out.println("Kayıt SALES Database'inde V2_ORDER_ITEM tablosuna doğru eklenemedi, sutün içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt SALES Database'inde V2_ORDER_ITEM tablosuna doğru eklenemedi, sutün içeriği yanlış.", true);
                }

                //id bilgisini kaydet, sonraki tabloda kullanılacak
                orderItemID = rs.getInt("ID");
            }
            else {
                System.out.println("Kayıt SALES Database'inde V2_ORDER_ITEM tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt SALES Database'inde V2_ORDER_ITEM tablosuna eklenemedi.", true);
            }
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void controlSaleOperationsInSALESDatabase_V2_ITEM_TAX_Table(Statement st, Invoice invoice) throws SQLException {

        try{
            //v2_order_item'dan alınan id ile kaydı getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_ITEM_TAX WHERE ORDER_ITEM_ID = '"+orderItemID+"'");

            //Kaydın geldiğini, gelen kayıtta ilgili sutünları kontrol et
            if(rs.next()) {
                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getDouble("TAX_AMOUNT") == Double.parseDouble(invoice.getKDV()) &&
                   rs.getDouble("TAXABLE_AMOUNT") == Double.parseDouble(invoice.getMalHizmetToplamTutari()))
                {
                    System.out.println("Kayıt SALES Database'inde V2_ITEM_TAX tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt SALES Database'inde V2_ITEM_TAX tablosuna doğru bir şekilde eklendi.", true);
                }
                else {
                    System.out.println("Kayıt SALES Database'inde V2_ITEM_TAX tablosuna doğru eklenemedi, sutün içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt SALES Database'inde V2_ITEM_TAX tablosuna doğru eklenemedi, sutün içeriği yanlış.", true);
                }

                //id bilgisini kaydet, sonraki tabloda kullanılacak
                orderItemID = rs.getInt("ID");
            }
            else {
                System.out.println("Kayıt SALES Database'inde V2_ITEM_TAX tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt SALES Database'inde V2_ITEM_TAX tablosuna eklenemedi.", true);
            }
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void controlSaleOperationsInMEDIATORDatabase_V2_INVOICE_STATUS_Table(Statement st, String sessionID) throws SQLException {

        try{
            //SESSION_ID için kaydı getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_INVOICE_STATUS WHERE SESSION_ID = '"+sessionID+"'");

            //Kaydın geldiğini, gelen kayıtta ilgili sutünları kontrol et
            if(rs.next()) {
                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getString("STATUS").equals("ISLEM_BASARILI"))
                {
                    System.out.println("Kayıt MEDIATOR Database'inde V2_INVOICE_STATUS tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt MEDIATOR Database'inde V2_INVOICE_STATUS tablosuna doğru bir şekilde eklendi.", true);
                }
                else {
                    System.out.println("Kayıt MEDIATOR Database'inde V2_INVOICE_STATUS tablosuna doğru eklenemedi, sutün içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt MEDIATOR Database'inde V2_INVOICE_STATUS tablosuna doğru eklenemedi, sutün içeriği yanlış.", true);
                }

            }
            else {
                System.out.println("Kayıt MEDIATOR Database'inde V2_INVOICE_STATUS tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt MEDIATOR Database'inde V2_INVOICE_STATUS tablosuna eklenemedi.", true);
            }
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void controlSaleOperationsInERPDatabase_V2_ORDER_INFO_Table(Statement st, String sessionID, Invoice invoice) throws SQLException {

        try{
            //Session ID için kaydı getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_ORDER_INFO WHERE SESSION_ID = '"+sessionID+"'");

            //Kaydın geldiğini, gelen kayıtta ilgili sutünları kontrol et
            if(rs.next()) {
                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getString("ETTN").equals(invoice.getBelgeNo()) &&
                   rs.getString("ORDER_TYPE").equals("SATIS") &&
                   rs.getString("STATUS").equals("CREATED") &&
                   rs.getString("INVOICE_INTEGRATOR_NO").equals(invoice.getFaturaNo()))
                {
                    System.out.println("Kayıt ERP Database'inde V2_ORDER_INFO tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt ERP Database'inde V2_ORDER_INFO tablosuna doğru bir şekilde eklendi.", true);
                }
                else {
                    System.out.println("Kayıt ERP Database'inde V2_ORDER_INFO tablosuna doğru eklenemedi, sutün içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt ERP Database'inde V2_ORDER_INFO tablosuna doğru eklenemedi, sutün içeriği yanlış.", true);
                }

                //payment id ve customer id'leri sonraki tablo kontrolleri için kaydet
                paymentID = rs.getInt("PAYMENT_ID");
                customerID = rs.getInt("CUSTOMER_ID");
            }
            else {
                System.out.println("Kayıt ERP Database'inde V2_ORDER_INFO tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt ERP Database'inde V2_ORDER_INFO tablosuna eklenemedi.", true);
            }
            rs.close();

        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void controlSaleOperationsInERPDatabase_V2_PAYMENT_Table(Statement st, String cash) throws SQLException {

        try{
            //V2_ORDER_INFO tablosundan kaydedilen payment_id için kaydı getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_PAYMENT WHERE ID = '"+paymentID+"'");

            //Kaydın geldiğini, gelen kayıtta ilgili sutünları kontrol et
            if(rs.next()) {
                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getDouble("CASH") == (Double.parseDouble(cash)))
                {
                    System.out.println("Kayıt ERP Database'inde V2_PAYMENT tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt ERP Database'inde V2_PAYMENT tablosuna doğru bir şekilde eklendi.", true);
                }
                else {
                    System.out.println("Kayıt ERP Database'inde V2_PAYMENT tablosuna doğru eklenemedi, sutün içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt ERP Database'inde V2_PAYMENT tablosuna doğru eklenemedi, sutün içeriği yanlış.", true);
                }
            }
            else {
                System.out.println("Kayıt ERP Database'inde V2_PAYMENT tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt ERP Database'inde V2_PAYMENT tablosuna eklenemedi.", true);
            }
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void controlSaleOperationsInERPDatabase_V2_CUSTOMER_Table(Statement st, Invoice invoice) throws SQLException {

        try{
            //V2_ORDER_INFO tablosundan kaydedilen customer_id için kaydı getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_CUSTOMER WHERE ID = '"+customerID+"'");

            //Kaydın geldiğini, gelen kayıtta ilgili sutünları kontrol et
            if(rs.next()) {
                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getString("NAME").concat(" ").concat(rs.getString("SURNAME")).equals(invoice.getMusteriIsmi()) &&
                   rs.getString("PHONE_NUMBER").equals(invoice.getMusteriTel()) &&
                   rs.getString("TCKN").equals(invoice.getMusteriTCKN()))
                {
                    System.out.println("Kayıt ERP Database'inde V2_CUSTOMER tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt ERP Database'inde V2_CUSTOMER tablosuna doğru bir şekilde eklendi.", true);
                }
                else {
                    System.out.println("Kayıt ERP Database'inde V2_CUSTOMER tablosuna doğru eklenemedi, sutün içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt ERP Database'inde V2_CUSTOMER tablosuna doğru eklenemedi, sutün içeriği yanlış.", true);
                }

                //adress_id'yi sonraki tablo kontrolü için kaydet
                addresID = rs.getInt("ADDRESS_ID");
            }
            else {
                System.out.println("Kayıt ERP Database'inde V2_CUSTOMER tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt ERP Database'inde V2_CUSTOMER tablosuna eklenemedi.", true);
            }
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void controlSaleOperationsInERPDatabase_V2_ADDRESS_Table(Statement st, Invoice invoice) throws SQLException {

        try{
            //V2_CUSTOMER tablosundan kaydedilen address_id için kaydı getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_ADDRESS WHERE ID = '"+addresID+"'");

            //Kaydın geldiğini, gelen kayıtta ilgili sutünları kontrol et
            if(rs.next()) {
                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getString("STREET").concat(" ").concat(rs.getString("DISTRICT"))
                                                   .concat(" ").concat(rs.getString("CITY"))
                                                   .equals(invoice.getMusteriAdresi()))
                {
                    System.out.println("Kayıt ERP Database'inde V2_ADDRESS tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt ERP Database'inde V2_ADDRESS tablosuna doğru bir şekilde eklendi.", true);
                }
                else {
                    System.out.println("Kayıt ERP Database'inde V2_ADDRESS tablosuna doğru eklenemedi, sutün içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt ERP Database'inde V2_ADDRESS tablosuna doğru eklenemedi, sutün içeriği yanlış.", true);
                }
            }
            else {
                System.out.println("Kayıt ERP Database'inde V2_ADDRESS tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt ERP Database'inde V2_ADDRESS tablosuna eklenemedi.", true);
            }
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void controlSaleOperationsInERPDatabase_V2_ORDER_DETAIL_ITEM_Table(Statement st, String imei, Invoice invoice) throws SQLException {

        try{
            //IMEI'ye göre kaydı getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_ORDER_DETAIL_ITEM WHERE IMEI = '"+imei+"'");

            //Kaydın geldiğini, gelen kayıtta ilgili sutünları kontrol et
            if(rs.next()) {
                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getString("BARCODE").equals(invoice.getBarkod()) &&
                   rs.getInt("QUANTITY") == 1 &&
                   rs.getDouble("TOTAL_SALES_PRICE") == Double.parseDouble(invoice.getOdenecekTutar()))
                {
                    System.out.println("Kayıt ERP Database'inde V2_ORDER_DETAIL_ITEM tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt ERP Database'inde V2_ORDER_DETAIL_ITEM tablosuna doğru bir şekilde eklendi.", true);
                }
                else {
                    System.out.println("Kayıt ERP Database'inde V2_ORDER_DETAIL_ITEM tablosuna doğru eklenemedi, sutün içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt ERP Database'inde V2_ORDER_DETAIL_ITEM tablosuna doğru eklenemedi, sutün içeriği yanlış.", true);
                }
            }
            else {
                System.out.println("Kayıt ERP Database'inde V2_ORDER_DETAIL_ITEM tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt ERP Database'inde V2_ORDER_DETAIL_ITEM tablosuna eklenemedi.", true);
            }
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void controlSaleOperationsInSTOCKDatabase_V2_INVENTORY_IMEI_Table(Statement st, String imei) throws SQLException {

        try{
            //IMEI için IS_ACTIVE'I 1 ve IS_USED'I 1 olan en son kaydı getirir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_INVENTORY_IMEI WHERE IMEI = '"
                    + imei + "' and IS_ACTIVE = '"+1+"' and IS_USED = '"+1+"' ORDER BY CREATED_DATE DESC FETCH FIRST 1 ROWS ONLY");

            //Kaydın geldiğini kontrol et
            if(rs.next()) {
                System.out.println("Kayıt STOCK Database'inde V2_INVENTORY_IMEI tablosuna doğru bir şekilde eklendi");
                commonLib.allureReport(StepResultType.PASS, "Kayıt STOCK Database'inde V2_INVENTORY_IMEI tablosuna doğru bir şekilde eklendi.", true);
            }
            else {
                System.out.println("Kayıt STOCK Database'inde V2_INVENTORY_IMEI tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt STOCK Database'inde V2_INVENTORY_IMEI tablosuna eklenemedi ya da kaydın sütun içeriği yanlış.", true);
            }
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void controlSaleOperationsInSTOCKDatabase_V2_INVENTORY_QUANTITY_RAW_Table(Statement st, String sessionID, String SKU, String barkod) throws SQLException {

        try{
            //Session ID ile kaydı getir(W koddan satış ile ilgili kayıt)
            ResultSet rs = st.executeQuery("SELECT * FROM V2_INVENTORY_QUANTITY_RAW WHERE SESSION_ID = '"+sessionID+"'");

            //Kaydın geldiğini ve gelen kayıtta ilgili sutünları kontrol et
            if(rs.next()) {

                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getString("SKU").equals(SKU) &&
                   rs.getString("BARCODE").equals(barkod) &&
                   rs.getString("IO_TYPE").equals("OUT"))
                {
                    System.out.println("Kayıt STOCK Database'inde V2_INVENTORY_QUANTITY_RAW tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt STOCK Database'inde V2_INVENTORY_QUANTITY_RAW tablosuna doğru bir şekilde eklendi.", true);
                }
                else{
                    System.out.println("Kayıt STOCK Database'inde V2_INVENTORY_QUANTITY_RAW tablosuna doğru eklenemedi, sütun içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt STOCK Database'inde V2_INVENTORY_QUANTITY_RAW tablosuna doğru eklenemedi, sütun içeriği yanlış.", true);
                }
            }
            else {
                System.out.println("Kayıt STOCK Database'inde V2_INVENTORY_QUANTITY_RAW tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt STOCK Database'inde V2_INVENTORY_QUANTITY_RAW tablosuna eklenemedi.", true);
            }
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void controlSaleOperationsInSTOCKDatabase_V2_INVENTORY_TRANSACTION_Table(Statement st, String sessionID) throws SQLException {

        try{
            //Session Id ile kaydı getir (W koddan satış ile ilgili kayıt)
            ResultSet rs = st.executeQuery("SELECT * FROM V2_INVENTORY_TRANSACTION WHERE SESSION_ID = '"+sessionID+"'");

            //Kaydın geldiğini ve gelen kayıtta ilgili sutünları kontrol et
            if(rs.next()) {
                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getString("STATE").equals("DONE") &&
                   rs.getString("FINANCIAL_PAPER_TYPE").equals("INVOICE") &&
                   rs.getString("ACTION_TYPE").equals("NORMAL") &&
                   rs.getString("OPERATION_TYPE").equals("SALES") &&
                   rs.getString("IO_TYPE").equals("OUT"))
                {
                    System.out.println("Kayıt STOCK Database'inde V2_INVENTORY_TRANSACTION tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt STOCK Database'inde V2_INVENTORY_TRANSACTION tablosuna doğru bir şekilde eklendi.", true);
                }
                else{
                    System.out.println("Kayıt STOCK Database'inde V2_INVENTORY_TRANSACTION tablosuna doğru eklenemedi, sütun içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt STOCK Database'inde V2_INVENTORY_TRANSACTION tablosuna doğru eklenemedi, sütun içeriği yanlış.", true);
                }
            }
            else {
                System.out.println("Kayıt STOCK Database'inde V2_INVENTORY_TRANSACTION tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt STOCK Database'inde V2_INVENTORY_TRANSACTION tablosuna eklenemedi.", true);
            }
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void controlSaleOperationsInSTOCKDatabase_V2_VDM_SILVER_RELATION_TABLE_Table(Statement st, String sessionID, String storeCode) throws SQLException {

        try{
            //Session Id ile kaydı getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_VDM_SILVER_RELATION_TABLE WHERE FROM_SESSION_ID = '"+sessionID+"'");

            //Kaydın geldiğini ve gelen kayıtta ilgili sutünları kontrol et
            if(rs.next()) {
                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getString("FROM_STORE").equals(storeCode))
                {
                    System.out.println("Kayıt STOCK Database'inde V2_VDM_SILVER_RELATION_TABLE tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt STOCK Database'inde V2_VDM_SILVER_RELATION_TABLE tablosuna doğru bir şekilde eklendi.", true);
                }
                else{
                    System.out.println("Kayıt STOCK Database'inde V2_VDM_SILVER_RELATION_TABLE tablosuna doğru eklenemedi, sütun içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt STOCK Database'inde V2_VDM_SILVER_RELATION_TABLE tablosuna doğru eklenemedi, sütun içeriği yanlış.", true);
                }
            }
            else {
                System.out.println("Kayıt STOCK Database'inde V2_VDM_SILVER_RELATION_TABLE tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt STOCK Database'inde V2_VDM_SILVER_RELATION_TABLE tablosuna eklenemedi.", true);
            }
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }
}