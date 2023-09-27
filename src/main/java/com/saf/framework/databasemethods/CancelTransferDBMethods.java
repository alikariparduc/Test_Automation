package com.saf.framework.databasemethods;

import com.saf.framework.StepResultType;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CancelTransferDBMethods extends DataBaseMethods{

    public static void controlCancelTransferOperationsInTRANSFERDatabase_V2_TRANSACTION_Table(Statement st, String sessionID) throws SQLException {

        try{
            //Session ID için kaydı getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_TRANSACTION WHERE SESSION_ID = '"+sessionID+"'");

            //Kaydın geldiğini, gelen kayıtta ilgili sutünları kontrol et
            if(rs.next()) {
                if(rs.getInt("IS_ACTIVE") == 1 &&
                   rs.getString("OPERATION_TYPE").equals("CANCEL") &&
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

    public static void controlCancelTransferOperationsInSTOCKDatabase_V2_INVENTORY_TRANSFER_PENDING_Table(Statement st, String sessionID) throws SQLException {

        try{
            //Session ID için kaydı getir
            ResultSet rs = st.executeQuery("SELECT * FROM V2_INVENTORY_TRANSFER_PENDING WHERE SESSION_ID = '"+sessionID+"'");

            //Transfer iptal edildiği için kayıt gelmemesi gerekiyor.
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
}
