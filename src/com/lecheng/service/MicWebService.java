package com.lecheng.service;

import com.lecheng.dao.Conn;

import java.sql.*;

/**
 * Created by Cheng on 2017/1/6.
 */
public class MicWebService {

    public boolean add(String title, String content) {//    添加功能
        try {
            Connection connection = Conn.getConnection();
            PreparedStatement pstm = connection.prepareStatement
                    ("INSERT INTO news(title,content) VALUE (?,?)");
            pstm.setString(1, title);
            pstm.setString(2, content);
            int i = pstm.executeUpdate();//提交操作
            pstm.close();
            connection.close();
            if (i > 0) {
                System.out.println("插入数据成功！");
                return true;
            } else {
                System.out.println("插入数据失败！");
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean delete(int id) {
        try {
            Connection connection = Conn.getConnection();
            PreparedStatement pstm = connection.prepareStatement
                    ("DELETE FROM news WHERE id=?");
            pstm.setInt(1, id);
            pstm.executeUpdate();
            pstm.close();
            connection.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateById(int id, String title, String content) {
        try {
            Connection connection = Conn.getConnection();
            Statement statement = connection.createStatement();
            String sql1 = "update news set title = '" + title + "'  where id = " + id;
            String sql2 = "update news set content = '" + content + "'  where id = " + id;
            int r = statement.executeUpdate(sql1);
            int r2 = statement.executeUpdate(sql2);
            statement.close();
            connection.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    public void findAll() {     //查询全部
        try {
            Connection connection = Conn.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM news");
            while (resultSet.next()) {
                System.out.println(resultSet.getString(2));
            }
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
