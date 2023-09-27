package com.saf.framework.databasemethods;

import com.saf.framework.StepResultType;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

public class ProductDeleteDBMethods extends DataBaseMethods {

    public static void controlDeleteOperationsIn_StockDB(Statement st ,String imei , String storeCode) {
        try{

            ResultSet rs = st.executeQuery("SELECT * " +
                    "FROM v2_inventory_transaction a," +
                    "v2_inventory_transaction_sub_item b," +
                    "v2_inventory_transaction_imei c " +
                    "WHERE a.id = b.transaction_id " +
                    "and b.id = c.transaction_item_id " +
                    "and c.imei = '" + imei + "' " +
                    "AND a.IS_ACTIVE=1 " +
                    "AND b.IS_ACTIVE=1 " +
                    "AND c.IS_ACTIVE=1 " +
                    "AND SESSION_ID like 'MR%' " +
                    "AND a.STORE_CODE like '" + storeCode + "' " +
                    "AND IO_TYPE like 'OUT' " +
                    "ORDER BY a.created_date DESC FETCH FIRST 1 ROWS ONLY ");


            //Kaydın geldiğini kontrol et
            if(rs.next()) {
                System.out.println("kayıt oluşturulma tarihi:" + rs.getTimestamp("CREATED_DATE"));
                Timestamp createdDate = rs.getTimestamp("CREATED_DATE");
                if(testUtils.getDifferenceInSecondsWithCurrentDate(createdDate) > maxDifferenceInSeconds) {
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt eklenemedi, gelen kaydın oluşturulma tarihi eski.", true);
                }

                System.out.println("Kayıt Stock DB'ye  doğru bir şekilde eklendi");
                commonLib.allureReport(StepResultType.PASS, "Kayıt Stock DB'ye doğru bir şekilde eklendi.", true);
            }
            else {
                System.out.println("Kayıt Stock DB'ye eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt Stock DB'ye eklenemedi ya da kaydın sütun içeriği yanlış.", true);
            }
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void controlDeleteOperationsIn_V2_INVENTORY_IMEI_Table(Statement st, String imei) throws SQLException {

        try{
            //IMEI için IS_ACTIVE'I 0 ve IS_USED'I 0 olan en son kaydı getirir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_INVENTORY_IMEI WHERE IMEI = '"
                    + imei + "' and IS_ACTIVE = '"+0+"' and IS_USED = '"+0+"' ORDER BY CREATED_DATE DESC FETCH FIRST 1 ROWS ONLY");

            //Kaydın geldiğini ve yeni güncellendiğini kontrol et
            if(rs.next()) {
                Timestamp lastUpdatedDate = rs.getTimestamp("LAST_UPDATED");
                if(testUtils.getDifferenceInSecondsWithCurrentDate(lastUpdatedDate) > maxDifferenceInSeconds){
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt güncellenemedi, gelen kaydın oluşturulma tarihi eski.", true);
                }
                System.out.println("Kayıt V2_INVENTORY_IMEI tablosunda doğru bir şekilde güncellendi");
                commonLib.allureReport(StepResultType.PASS, "Kayıt V2_INVENTORY_IMEI tablosunda doğru bir şekilde güncellendi.", true);
            }
            else {
                System.out.println("Kayıt V2_INVENTORY_IMEI tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt V2_INVENTORY_IMEI tablosunda güncellenemedi ya da kaydın sütun içeriği yanlış.", true);
            }
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void controlDeleteOperationsIn_V2_INVENTORY_QUANTITY_RAW_Table(Statement st, String storeCode, String SKU, String barkod) throws SQLException {
        try{
            //Store code için en son eklenen kaydı getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_INVENTORY_QUANTITY_RAW WHERE STORE_CODE = '"
                    + storeCode + "' ORDER BY CREATED_DATE DESC FETCH FIRST 1 ROWS ONLY");

            //Kaydın geldiğini, yeni oluşturulduğunu ve gelen kayıtta ilgili sutünları kontrol et
            if(rs.next()) {

                Timestamp createdDate = rs.getTimestamp("CREATED_DATE");
                if(testUtils.getDifferenceInSecondsWithCurrentDate(createdDate) > maxDifferenceInSeconds) {
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt eklenemedi, gelen kaydın oluşturulma tarihi eski.", true);
                }

                if(rs.getInt("IS_ACTIVE") == 1 &&
                        rs.getString("SKU").equals(SKU) &&
                        rs.getString("BARCODE").equals(barkod) &&
                        rs.getString("IO_TYPE").equals("OUT") &&
                        rs.getString("SESSION_ID").startsWith("MR"))
                {
                    System.out.println("Kayıt V2_INVENTORY_QUANTITY_RAW tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt V2_INVENTORY_QUANTITY_RAW tablosuna doğru bir şekilde eklendi.", true);
                }
                else{
                    System.out.println("Kayıt V2_INVENTORY_QUANTITY_RAW tablosuna doğru eklenemedi, sütun içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt V2_INVENTORY_QUANTITY_RAW tablosuna doğru eklenemedi, sütun içeriği yanlış.", true);
                }
            }
            else {
                System.out.println("Kayıt V2_INVENTORY_QUANTITY_RAW tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt V2_INVENTORY_QUANTITY_RAW tablosuna eklenemedi.", true);
            }
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void controlDeleteOperationsIn_V2_INVENTORY_TRANSACTION_Table(Statement st, String storeCode) throws SQLException {
        try{
            //Store code için en son eklenen kaydı getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_INVENTORY_TRANSACTION WHERE STORE_CODE = '"
                    + storeCode + "' ORDER BY CREATED_DATE DESC FETCH FIRST 1 ROWS ONLY");

            //Kaydın geldiğini, yeni oluşturulduğunu ve gelen kayıtta ilgili sutünları kontrol et
            if(rs.next()) {

                Timestamp createdDate = rs.getTimestamp("CREATED_DATE");
                if(testUtils.getDifferenceInSecondsWithCurrentDate(createdDate) > maxDifferenceInSeconds) {
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt eklenemedi, gelen kaydın oluşturulma tarihi eski.", true);
                }

                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getString("STATE").equals("DONE") &&
                   rs.getString("FINANCIAL_PAPER_TYPE").equals("STOCK_OUT_WITHOUT_PAPER") &&
                   rs.getString("ACTION_TYPE").equals("NORMAL") &&
                   rs.getString("OPERATION_TYPE").equals("MANUAL_REMOVE_FROM_INVENTORY") &&
                   rs.getString("IO_TYPE").equals("OUT") &&
                   rs.getString("SESSION_ID").startsWith("MR"))
                {
                    System.out.println("Kayıt V2_INVENTORY_TRANSACTION tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt V2_INVENTORY_TRANSACTION tablosuna doğru bir şekilde eklendi.", true);
                }
                else{
                    System.out.println("Kayıt V2_INVENTORY_TRANSACTION tablosuna doğru eklenemedi, sütun içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt V2_INVENTORY_TRANSACTION tablosuna doğru eklenemedi, sütun içeriği yanlış.", true);
                }
            }
            else {
                System.out.println("Kayıt V2_INVENTORY_TRANSACTION tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt V2_INVENTORY_TRANSACTION tablosuna eklenemedi.", true);
            }
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }
}
