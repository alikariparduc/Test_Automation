package com.saf.framework;

import java.sql.*;

import com.relevantcodes.extentreports.ExtentReports;
import com.relevantcodes.extentreports.ExtentTest;
import com.saf.framework.HashMapNew;

public class DataBase {

    public ExtentReports oExtentReports;
    public ExtentTest oExtentTest;
    public HashMapNew dictionary;

    public DataBase(DBType oDBType) {
        this.oDBType = oDBType;
    }

    public enum DBType {
        ORACLE, MYSQL, MSACCESS;
    }

    DBType oDBType;
    static Connection con = null;

    public DataBase(ExtentReports oExtentReports, ExtentTest oExtentTest, HashMapNew dictionary, DBType oDBType) {
        this.oExtentReports = oExtentReports;
        this.oExtentTest = oExtentTest;
        this.dictionary = dictionary;
        this.oDBType = oDBType;
    }

    public Statement DataBaseConn(String connection, String username, String password) {

        switch (oDBType) {
            case ORACLE:
                try {
                    //Load the driver class
                    String DBClass = "oracle.jdbc.driver.OracleDriver";
                    Class.forName(DBClass).newInstance();

                    //Create the connection object
                    con = DriverManager.getConnection(connection, username, password);

                    //Create the statement object
                    Statement stmt = con.createStatement();
                    return stmt;
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;

            case MYSQL:
                try {
                    //Load the driver class
                    String DBClass = "com.mysql.jdbc.Driver";
                    Class.forName(DBClass).newInstance();

                    //Create the connection object
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:port/ServiceName", "UserID", "Password");

                    //Create the statement object
                    Statement stmt = con.createStatement();
                    return stmt;

                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;

            case MSACCESS:
                try {
                    //Load the driver class
                    String DBClass = "oracle.jdbc.driver.OracleDriver";
                    Class.forName(DBClass).newInstance();

                    //Create the connection object
                    Connection con = DriverManager.getConnection("connection details", "UserId", "Password");

                    //Create the statement object
                    Statement stmt = con.createStatement();
                    return stmt;
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
        }
        return null;
    }

    public void closeDatabaseConnection() {
        try {
            con.close();
            //System.out.println("Connection closed successfully!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }




}


