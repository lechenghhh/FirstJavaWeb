package com.lecheng.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/Upload")
@MultipartConfig(location = "F:\\")
public class Upload extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Upload() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String filename = req.getParameter("filename");
        Part part = req.getPart("file");
        part.write(filename);
        resp.setCharacterEncoding("UTF-8");
        PrintWriter outPrintWriter = resp.getWriter();
        outPrintWriter.print("图片上传成功！！！");


    }

}
