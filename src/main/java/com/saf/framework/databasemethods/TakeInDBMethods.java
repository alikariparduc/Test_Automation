package com.saf.framework.databasemethods;

import com.saf.framework.StepResultType;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;


public class TakeInDBMethods extends  DataBaseMethods{

    public static  void controlTakeInOperationsIn_StockDB(Statement st ,String imei , String storeCode)
    {
        try{

            System.out.println("SELECT * " +
                    "FROM v2_inventory_transaction a," +
                    "v2_inventory_transaction_sub_item b," +
                    "v2_inventory_transaction_imei c " +
                    "WHERE a.id = b.transaction_id " +
                    "and b.id = c.transaction_item_id " +
                    "and c.imei = '" + imei + "' " +
                    "AND a.IS_ACTIVE=1 " +
                    "AND b.IS_ACTIVE=1 " +
                    "AND c.IS_ACTIVE=1 " +
                    "AND SESSION_ID like 'WEB%' " +
                    "AND a.STORE_CODE like ' " + storeCode + "' " +
                    "AND IO_TYPE like'IN' " +
                    "ORDER BY a.created_date DESC FETCH FIRST 1 ROWS ONLY ");

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
                    "AND SESSION_ID like 'WEB%' " +
                    "AND a.STORE_CODE like '" + storeCode + "' " +
                    "AND IO_TYPE like'IN' " +
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

}