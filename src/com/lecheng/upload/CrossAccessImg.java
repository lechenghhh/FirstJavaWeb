package com.lecheng.upload;

import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CrossAccessImg")
public class CrossAccessImg extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.addHeader("Access-Control-Allow-Origin", "*");
        String filePath = MyPath.UPLOAD_PATH + Thread.currentThread().getName() + "img.jpg";
//        String filePath = "D:\\" + Thread.currentThread().getName() + "img.jpg";

        //读取要浏览的文件
        String imgUrl = req.getParameter("imgUrl");//图片地址
        if (imgUrl == null) resp.getWriter().print("请传入 imgUrl");
        try {
            URL url = new URL(imgUrl);            // 构造URL
            URLConnection con = url.openConnection();            // 打开连接
            InputStream is = con.getInputStream();            // 输入流
            byte[] bs = new byte[1024];            // 1K的数据缓冲
            int len;            // 读取到的数据长度
            OutputStream os = new FileOutputStream(filePath);//输出的文件流,保存路径
            while ((len = is.read(bs)) != -1) {            // 开始读取
                os.write(bs, 0, len);
            }
            os.close();            // 完毕，关闭所有链接
            is.close();
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().print("获取url图片失败");
        }

        //返回已经存储到硬盘上的图片
        try {
            FileInputStream fis = new FileInputStream(filePath);
            int size = fis.available(); //得到文件大小
            byte data[] = new byte[size];
            fis.read(data);  //读数据
            fis.close();
            resp.setContentType("image/jpeg"); //设置返回的文件类型
            OutputStream os = resp.getOutputStream();
            os.write(data);
            os.flush();
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().print("返回图片失败");
        }
    }
}