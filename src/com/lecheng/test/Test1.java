package com.lecheng.test;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import static java.lang.System.out;

/**
 * Created by Cheng on 2017/1/5.
 */
@WebServlet(name = "Test1", urlPatterns = "/Test1")
//@WebServlet("/Test1")
public class Test1 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        out.println("dopost++++++++++++++++++++++++++++");
//        String forward = "/20/success.jsp";
//        RequestDispatcher rd = request.getRequestDispatcher(forward);
//        rd.forward(request, response);
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String content = request.getParameter("content");
        response.setContentType("text/html");
//设置逻辑实现
        PrintWriter out = response.getWriter();
        out.println("<h3>" + "Test1!!!" + content + "</h3>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
