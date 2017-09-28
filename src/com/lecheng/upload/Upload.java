package com.lecheng.upload;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/Upload")                              //17-9-28测试失效，可能由于servlet3.0问题
@MultipartConfig(location = "F:/")
public class Upload extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final String UPLOAD_PATH = "upload_file";

    public Upload() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        try {

            Part part = req.getPart("file");
            String fileName = System.currentTimeMillis() + "-" + part.getSubmittedFileName();
            part.write(fileName);
            resp.getWriter().print("{\"status\":1,\"data\": \"" + fileName + "\"}");
        } catch (Exception e) {
            resp.getWriter().print("{\"status\":0}");
            e.printStackTrace();
        }
    }

}
