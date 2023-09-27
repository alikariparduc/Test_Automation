package com.saf.framework.databasemethods;

import com.saf.framework.StepResultType;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AcceptTransferDBMethods extends DataBaseMethods {

    public static void controlAcceptTransferOperationsInTRANSFERDatabase_V2_TRANSACTION_Table(Statement st, String sessionID) throws SQLException {

        try{
            //Session ID için kaydı getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_TRANSACTION WHERE SESSION_ID = '"+sessionID+"'");

            //Kaydın geldiğini, gelen kayıtta ilgili sutünları kontrol et
            if(rs.next()) {
                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getString("OPERATION_TYPE").equals("ACCEPT") &&
                   rs.getString("STATE").equals("DONE") &&
                   rs.getString("ACTION_TYPE").equals("NORMAL"))
                {
                    System.out.println("Kayıt TRANSFER Database'inde V2_TRANSACTION tablosunda doğru bir şekilde güncellendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt TRANSFER Database'inde V2_TRANSACTION tablosunda doğru bir şekilde güncellendi.", true);
                }
                else {
                    System.out.println("Kayıt TRANSFER Database'inde V2_TRANSACTION tablosunda doğru güncellenemedi, sutün içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt TRANSFER Database'inde V2_TRANSACTION tablosunda doğru güncellenemedi, sutün içeriği yanlış.", true);
                }
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

    public static void controlAcceptTransferOperationsInSTOCKDatabase_V2_INVENTORY_TRANSFER_PENDING_Table(Statement st, String sessionID) throws SQLException {

        try{
            //Session ID için kaydı getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_INVENTORY_TRANSFER_PENDING WHERE SESSION_ID = '"+sessionID+"'");

            //Transfer kabul edildiği için kayıt gelmemesi gerekiyor.
            if(!rs.next()) {
               System.out.println("Kayıt STOCK Database'inde V2_INVENTORY_TRANSFER_PENDING tablosundan doğru bir şekilde silindi");
               commonLib.allureReport(StepResultType.PASS, "Kayıt STOCK Database'inde V2_INVENTORY_TRANSFER_PENDING tablosundan doğru bir şekilde silindi.", true);
            }
            else {
                System.out.println("Kayıt STOCK Database'inde V2_INVENTORY_TRANSFER_PENDING tablosundan silinemedi");
                commonLib.allureReport(StepResultType.FAIL, "Kayıt STOCK Database'inde V2_INVENTORY_TRANSFER_PENDING tablosundan silinemedi.", true);
            }
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void controlAcceptTransferOperationsInSTOCKDatabase_V2_INVENTORY_QUANTITY_RAW_Table(Statement st, String sessionID) throws SQLException {

        try{
            //Session ID için kayıtları getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_INVENTORY_QUANTITY_RAW WHERE SESSION_ID = '"+sessionID+"' ORDER BY IO_TYPE ASC");

            //İki farklı kayıt gelmesi gerekiyor, iki kez next yaparak kayıtları kontrol et, ilki "in" ikincisi "out"
            if(rs.next()) {
                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getString("IO_TYPE").equals("IN"))
                {
                    System.out.println("İlk Kayıt STOCK Database'inde V2_INVENTORY_QUANTITY_RAW tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "İlk Kayıt STOCK Database'inde V2_INVENTORY_QUANTITY_RAW tablosuna doğru bir şekilde eklendi.", true);
                }
                else {
                    System.out.println("İlk Kayıt STOCK Database'inde V2_INVENTORY_QUANTITY_RAW tablosuna doğru eklenemedi, sutün içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "İlk Kayıt STOCK Database'inde V2_INVENTORY_QUANTITY_RAW tablosunda doğru eklenemedi, sutün içeriği yanlış.", true);
                }
            }
            else {
                System.out.println("İlk Kayıt STOCK Database'inde V2_INVENTORY_QUANTITY_RAW tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "İlk Kayıt STOCK Database'inde V2_INVENTORY_QUANTITY_RAW tablosuna eklenemedi.", true);
            }

            if(rs.next()) {
                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getString("IO_TYPE").equals("OUT"))
                {
                    System.out.println("İkinci Kayıt STOCK Database'inde V2_INVENTORY_QUANTITY_RAW tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "İkinci Kayıt STOCK Database'inde V2_INVENTORY_QUANTITY_RAW tablosuna doğru bir şekilde eklendi.", true);
                }
                else {
                    System.out.println("İkinci Kayıt STOCK Database'inde V2_INVENTORY_QUANTITY_RAW tablosuna doğru eklenemedi, sutün içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "İkinci Kayıt STOCK Database'inde V2_INVENTORY_QUANTITY_RAW tablosunda doğru eklenemedi, sutün içeriği yanlış.", true);
                }
            }
            else {
                System.out.println("İkinci Kayıt STOCK Database'inde V2_INVENTORY_QUANTITY_RAW tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "İkinci Kayıt STOCK Database'inde V2_INVENTORY_QUANTITY_RAW tablosuna eklenemedi.", true);
            }
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void controlAcceptTransferOperationsInSTOCKDatabase_V2_INVENTORY_TRANSACTION_Table(Statement st, String sessionID) throws SQLException {

        try{
            //Session ID için kayıtları getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_INVENTORY_TRANSACTION WHERE SESSION_ID = '"+sessionID+"' ORDER BY IO_TYPE ASC");

            //İki farklı kayıt gelmesi gerekiyor, iki kez next yaparak kayıtları kontrol et, ilki "in" ikincisi "out"
            if(rs.next()) {
                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getString("STATE").equals("DONE") &&
                   rs.getString("FINANCIAL_PAPER_TYPE").equals("DISPATCH") &&
                   rs.getString("ACTION_TYPE").equals("NORMAL") &&
                   rs.getString("OPERATION_TYPE").equals("TRANSFER_IN"))
                {
                    System.out.println("İlk Kayıt STOCK Database'inde V2_INVENTORY_TRANSACTION tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt STOCK Database'inde V2_INVENTORY_TRANSACTION tablosuna doğru bir şekilde eklendi.", true);
                }
                else {
                    System.out.println("İlk Kayıt STOCK Database'inde V2_INVENTORY_TRANSACTION tablosuna doğru eklenemedi, sutün içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt STOCK Database'inde V2_INVENTORY_TRANSACTION tablosunda doğru eklenemedi, sutün içeriği yanlış.", true);
                }
            }
            else {
                System.out.println("İlk Kayıt STOCK Database'inde V2_INVENTORY_TRANSACTION tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "İlk Kayıt STOCK Database'inde V2_INVENTORY_TRANSACTION tablosuna eklenemedi.", true);
            }

            if(rs.next()) {
                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getString("STATE").equals("DONE") &&
                   rs.getString("FINANCIAL_PAPER_TYPE").equals("DISPATCH") &&
                   rs.getString("ACTION_TYPE").equals("NORMAL") &&
                   rs.getString("OPERATION_TYPE").equals("TRANSFER_OUT"))
                {
                    System.out.println("İkinci Kayıt STOCK Database'inde V2_INVENTORY_TRANSACTION tablosuna doğru bir şekilde eklendi");
                    commonLib.allureReport(StepResultType.PASS, "Kayıt STOCK Database'inde V2_INVENTORY_TRANSACTION tablosuna doğru bir şekilde eklendi.", true);
                }
                else {
                    System.out.println("İkinci Kayıt STOCK Database'inde V2_INVENTORY_TRANSACTION tablosuna doğru eklenemedi, sutün içeriği yanlış.");
                    commonLib.allureReport(StepResultType.FAIL, "Kayıt STOCK Database'inde V2_INVENTORY_TRANSACTION tablosunda doğru eklenemedi, sutün içeriği yanlış.", true);
                }
            }
            else {
                System.out.println("İkinci Kayıt STOCK Database'inde V2_INVENTORY_TRANSACTION tablosuna eklenemedi");
                commonLib.allureReport(StepResultType.FAIL, "İkinci Kayıt STOCK Database'inde V2_INVENTORY_TRANSACTION tablosuna eklenemedi.", true);
            }
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }
}
