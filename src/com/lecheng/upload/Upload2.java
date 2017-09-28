package com.lecheng.upload;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
@WebServlet("/Upload2")
public class Upload2 extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //从request当中获取流信息
        InputStream fileSource = req.getInputStream();
        String tempFileName = "F:/UploadFile";
        //tempFile指向临时文件
        File tempFile = new File(tempFileName);
        //outputStram文件输出流指向这个临时文件
        FileOutputStream outputStream = new FileOutputStream(tempFile);
        byte b[] = new byte[1024];
        int n;
        while ((n = fileSource.read(b)) != -1) {
            outputStream.write(b, 0, n);
        }
        //关闭输出流、输入流
        outputStream.close();
        fileSource.close();

        //获取上传文件的名称
        RandomAccessFile randomFile = new RandomAccessFile(tempFile, "r");
//      l = new String(l.getBytes("8859_1"),"gbk");
        String str2 = randomFile.readLine();
        //编码转换
        str2 = new String(str2.getBytes("8859_1"), "utf-8");
        System.out.println(str2);
        String str = randomFile.readLine();
        str = new String(str.getBytes("8859_1"), "utf-8");
        System.out.println(str);
        int beginIndex = str.lastIndexOf("=") + 2;
        int endIndex = str.lastIndexOf("\"");
        String filename = str.substring(beginIndex, endIndex);
        System.out.println("filename:" + filename);

        //重新定位文件指针到文件头
        randomFile.seek(0);
        long startPosition = 0;
        int i = 1;
        //获取文件内容 开始位置
        while ((n = randomFile.readByte()) != -1 && i <= 4) {
            if (n == '\n') {
                startPosition = randomFile.getFilePointer();
                i++;
            }
        }
        startPosition = randomFile.getFilePointer() - 1;
        //获取文件内容 结束位置
        randomFile.seek(randomFile.length());
        long endPosition = randomFile.getFilePointer();
        int j = 1;
        while (endPosition >= 0 && j <= 2) {
            endPosition--;
            randomFile.seek(endPosition);
            if (randomFile.readByte() == '\n') {
                j++;
            }
        }
        endPosition = endPosition - 1;

        //设置保存上传文件的路径//路径可以自行设置
        String realPath = "F:\\myeclipse workplace\\css+js";
//      String realPath = getServletContext().getRealPath("/") + "images";
        File fileupload = new File(realPath);
        System.out.println(realPath);
        if (!fileupload.exists()) {
            fileupload.mkdir();
        }
        File saveFile = new File(realPath, filename);
        RandomAccessFile randomAccessFile = new RandomAccessFile(saveFile, "rw");
        //从临时文件当中读取文件内容（根据起止位置获取）
        randomFile.seek(startPosition);
        while (startPosition < endPosition) {
            randomAccessFile.write(randomFile.readByte());
            startPosition = randomFile.getFilePointer();
        }
        //关闭输入输出流、删除临时文件
        randomAccessFile.close();
        randomFile.close();
        tempFile.delete();


        resp.getWriter().print("上传成功！");
        /*请求重定向*/
        /*req.setAttribute("result", "上传成功！");
        RequestDispatcher dispatcher = req.getRequestDispatcher("test.jsp");
        dispatcher.forward(req, resp);*/
    }
}