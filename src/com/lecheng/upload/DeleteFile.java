package com.lecheng.upload;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@WebServlet("/DeleteFile")                              //http://blog.csdn.net/lihaiyun718/article/details/6280297
public class DeleteFile extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.addHeader("Access-Control-Allow-Origin", "*");
        try {
            String name = req.getParameter("name");
            name = name.replace("http://139.159.226.94:8080/MyWeb//upload_file/", "");
            File file = new File(MyPath.UPLOAD_PATH + name);
            if (file.delete())
                resp.getWriter().print("{\"status\":1,\"data\":\"删除成功\"}");
            else resp.getWriter().print("{\"status\":0,\"data\":\"删除失败\"}");
        } catch (Exception e) {
            resp.getWriter().print("{\"status\":0}");
            e.printStackTrace();
        }
    }
}
