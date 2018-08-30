package com.lecheng.forward;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletContext;
import javax.servlet.RequestDispatcher;

@WebServlet("/ForwardSource")
public class ForwardSource extends HttpServlet {

    private static final long serialVersionUID = 7412912720309987937L;

    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String username = req.getParameter("username");
        String message = null;
        if (username == null) {
            message = "Please input username.";
        } else {
            message = "Hello " + username;
        }

        // add attribute to request  
        req.setAttribute("msg", message);

        // forward the request to Destination
        ServletContext context = getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher("/Destination");

        // try to output something into response  
        PrintWriter out = res.getWriter();
        out.println("Output from ForwardSource before forwarding request");

        if (dispatcher != null) {
            dispatcher.forward(req, res);
        }

        out.println("Output from ForwardSource after forwarding request");
        out.close();
    }

}  