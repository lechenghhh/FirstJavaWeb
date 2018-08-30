package com.lecheng.servlet;

import com.lecheng.dao.Conn;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

//http://localhost:8085/furiapi?phone=123&sdk_version=1.1&mac=23123&login_time=123&verify=de13fd6f03f33b89
@WebServlet("/furiapi")
public class FuriServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String phone = req.getParameter("phone");
        String sdk_version = req.getParameter("sdk_version");
        String mac = req.getParameter("mac");
        String login_time = req.getParameter("login_time");
        String verify = req.getParameter("verify");
        if (verify == null || !verify.equals("de13fd6f03f33b89")) {
            resp.getWriter().print("0 record added");
            return;
        }

        try {
            Connection connection = Conn.getConnection();
            PreparedStatement pstm = connection.prepareStatement
                    ("INSERT INTO furible_user(phone,sdk_version,mac,login_time,test1) VALUE (?,?,?,?,?)");
            pstm.setString(1, phone);
            pstm.setString(2, sdk_version);
            pstm.setString(3, mac);
            pstm.setString(4, login_time);
            pstm.setString(5, "");
            int i = pstm.executeUpdate();//提交操作
            pstm.close();
            connection.close();
            if (i > 0) {
                System.out.println("插入数据成功！");
                resp.getWriter().print("1 record added");
            } else {
                System.out.println("插入数据失败！");
                resp.getWriter().print("0 record added");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().print("0 record added");
            return;
        }
    }


}
