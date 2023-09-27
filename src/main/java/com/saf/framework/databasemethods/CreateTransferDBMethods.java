package com.saf.framework.databasemethods;

import com.saf.framework.StepResultType;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CreateTransferDBMethods extends DataBaseMethods {

    private static int transactionID;

    public static void controlCreateTransferOperationsInTRANSFERDatabase_V2_TRANSACTION_Table(Statement st, String sessionID) throws SQLException {

        try{
            //Session ID için kaydı getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_TRANSACTION WHERE SESSION_ID = '"+sessionID+"'");

            //Kaydın geldiğini, gelen kayıtta ilgili sutünları kontrol et
            if(rs.next()) {
                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getString("OPERATION_TYPE").equals("CREATE") &&
                   rs.getString("STATE").equals("DONE") &&
                   rs.getString("ACTION_TYPE").equals("NORMAL"))
                {
                    System.out.println("Kayıt TRANSFER Database'inde V2_TRANSACTION tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt TRANSFER Database'inde V2_TRANSACTION tablosuna doğru bir şekilde eklendi.", true);
                }
                else {
                    System.out.println("Kayıt TRANSFER Database'inde V2_TRANSACTION tablosuna doğru eklenemedi, sutün içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt TRANSFER Database'inde V2_TRANSACTION tablosuna doğru eklenemedi, sutün içeriği yanlış.", true);
                }

                transactionID = rs.getInt("ID");
            }
            else {
                System.out.println("Kayıt TRANSFER Database'inde V2_TRANSACTION tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt TRANSFER Database'inde V2_TRANSACTION tablosuna eklenemedi.", true);
            }
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void controlCreateTransferOperationsInTRANSFERDatabase_V2_TRANSACTION_ITEM_Table(Statement st, String imei) throws SQLException {

        try{
            //V2_TRANSACTION tablosundan gelen ID için kaydı getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_TRANSACTION_ITEM WHERE TRANSACTION_ID = '"+transactionID+"'");

            //Kaydın geldiğini, gelen kayıtta ilgili sutünları kontrol et
            if(rs.next()) {
                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getString("IMEI").equals(imei) &&
                   rs.getInt("QUANTITY") == 1)
                {
                    System.out.println("Kayıt TRANSFER Database'inde V2_TRANSACTION_ITEM tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt TRANSFER Database'inde V2_TRANSACTION_ITEM tablosuna doğru bir şekilde eklendi.", true);
                }
                else {
                    System.out.println("Kayıt TRANSFER Database'inde V2_TRANSACTION_ITEM tablosuna doğru eklenemedi, sutün içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt TRANSFER Database'inde V2_TRANSACTION_ITEM tablosuna doğru eklenemedi, sutün içeriği yanlış.", true);
                }
            }
            else {
                System.out.println("Kayıt TRANSFER Database'inde V2_TRANSACTION_ITEM tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt TRANSFER Database'inde V2_TRANSACTION_ITEM tablosuna eklenemedi.", true);
            }
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void controlCreateTransferOperationsInSTOCKDatabase_V2_INVENTORY_TRANSFER_PENDING_Table(Statement st, String sessionID, String imei) throws SQLException {

        try{
            //Session ID için kaydı getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_INVENTORY_TRANSFER_PENDING WHERE SESSION_ID = '"+sessionID+"'");

            //Kaydın geldiğini, gelen kayıtta ilgili sutünları kontrol et
            if(rs.next()) {
                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getString("IMEI").equals(imei) &&
                   rs.getInt("QUANTITY") == 1)
                {
                    System.out.println("Kayıt STOCK Database'inde V2_INVENTORY_TRANSFER_PENDING tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt STOCK Database'inde V2_INVENTORY_TRANSFER_PENDING tablosuna doğru bir şekilde eklendi.", true);
                }
                else {
                    System.out.println("Kayıt STOCK Database'inde V2_INVENTORY_TRANSFER_PENDING tablosuna doğru eklenemedi, sutün içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt STOCK Database'inde V2_INVENTORY_TRANSFER_PENDING tablosuna doğru eklenemedi, sutün içeriği yanlış.", true);
                }
            }
            else {
                System.out.println("Kayıt STOCK Database'inde V2_INVENTORY_TRANSFER_PENDING tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt STOCK Database'inde V2_INVENTORY_TRANSFER_PENDING tablosuna eklenemedi.", true);
            }
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }
}
