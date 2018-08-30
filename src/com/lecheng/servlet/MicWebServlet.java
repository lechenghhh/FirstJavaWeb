package com.lecheng.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecheng.test.JDBCMysqltest;

@WebServlet("/MicWebServlet")
public class MicWebServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String uname = req.getParameter("uname");
        uname = new String(uname.getBytes("iso-8859-1"), "utf-8");
        String upwd = req.getParameter("upwd");
        System.out.println(uname + "\n" + upwd);
    }
}
