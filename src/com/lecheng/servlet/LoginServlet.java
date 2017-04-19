package com.lecheng.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


//@WebServlet(name = "LoginServlet", urlPatterns = "/LoginServlet")
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    /**
     * JSP文件放在 webcontent/20 目录下了
     */
//    private static final long serialVersionUID = -5267213221663627011L;

//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp)
//			throws ServletException, IOException {
//		req.setCharacterEncoding("UTF-8");
//		resp.setCharacterEncoding("UTF-8");
//	}

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String userName = req.getParameter("uname");
        String passWord = req.getParameter("upwd");

        System.out.println("用户名：" + userName);
        System.out.println("密码：" + passWord);

//		//欢迎语句
//		PrintWriter pw = resp.getWriter();    //输出流，用于处理文字
//		pw.println("Hello World !");
//		pw.close();

        String forward = null;
        if (userName.equals("lecheng") && passWord.equals("123456")) {
            //请求转发
            forward = "/20/success.jsp";
            RequestDispatcher rd = req.getRequestDispatcher(forward);//请求调度器，转发到指定地址
            rd.forward(req, resp);

            //请求重定向
			resp.sendRedirect(req.getContextPath()+"/20/success.jsp");
        } else {
            forward = "/20/error.jsp";
            RequestDispatcher rd = req.getRequestDispatcher(forward);
            rd.forward(req, resp);

            //请求重定向
			resp.sendRedirect(req.getContextPath()+"/20/error.jsp");

        }

    }

    private void loginFunc(HttpServletRequest req, HttpServletResponse resp) {


    }

}
