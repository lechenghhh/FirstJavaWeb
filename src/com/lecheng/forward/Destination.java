package com.lecheng.forward;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Destination")
public class Destination extends HttpServlet {

    private static final long serialVersionUID = 7412912720309987937L;

    @Override
    public void service(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String message = (String) req.getAttribute("msg");

        PrintWriter out = res.getWriter();
        out.println(message);
        out.close();
    }

}  