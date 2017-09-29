package com.lecheng.upload;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet("/FileList")                              //http://blog.csdn.net/lihaiyun718/article/details/6280297
public class FileList extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        try {

            File file = new File(MyPath.UPLOAD_PATH);
            File[] tempList = file.listFiles();
            System.out.println(req.getRequestURL() + "该目录下对象个数：" + tempList.length);
            String strArr = "[";
            for (int i = 0; i < tempList.length; i++) {
                if (tempList[i].isFile()) {
//                    System.out.println("文件：" + tempList[i].getName());
                    if (i + 1 == tempList.length) {
                        strArr = strArr + "{\"img\":\"" +
                                MyPath.ABS_URL + MyPath.UPLOAD_DIRECTORY + tempList[i].getName() + "\"}";
                        break;
                    }
                    strArr = strArr + "{\"img\":\"" +
                            MyPath.ABS_URL + MyPath.UPLOAD_DIRECTORY + tempList[i].getName() + "\"},";
                }
                if (tempList[i].isDirectory()) {
//                    System.out.println("文件夹：" + tempList[i]);
                }
            }
            resp.getWriter().print("{\"status\":1,\"data\": " + strArr + "]}");
        } catch (Exception e) {
            resp.getWriter().print("{\"status\":0}");
            e.printStackTrace();
        }
    }

}
