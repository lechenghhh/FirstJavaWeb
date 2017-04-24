package com.lecheng.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Conn {
    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/microweb";
        return DriverManager.getConnection(url, "root", "123456");
    }

    public static void close(ResultSet rs, Statement sta, Connection con) throws Exception {
        if (rs != null)
            rs.close();                   //关闭结果集
        if (sta != null)
            sta.close();                   //关闭操作句柄
        if (con != null)
            con.close();                  //关闭链接
    }
} 