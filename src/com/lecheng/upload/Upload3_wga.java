/*
package com.lecheng.upload;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import conn.Dao;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import utils.MyUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

*/
/**
 * Servlet implementation class UploadServlet 1
 * 菜鸟教程：http://www.runoob.com/servlet/servlet-file-uploading.html
 *//*

@WebServlet("/Upload3")
public class Upload3_wga extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "upload";    // 上传文件存储目录
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB    // 上传配置
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 10; // 10MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 20; // 20MB

    //上传数据及保存文件
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String img_url = "";
        String time = System.currentTimeMillis() + "-";
//        String requestUrl = req.getScheme() //当前链接使用的协议//获取当前服务器地址
//                + "://" + req.getServerName()//服务器地址 +"39.39.108.101.219"
//                + ":" + req.getServerPort(); //端口号
        String requestUrl = req.getRequestURL() + "";
        //System.out.println(req.getSession().getServletContext().getRealPath("upload") +"-filepath");
        DBCollection dbColl = Dao.getDBColl("tb_img");
        if (!ServletFileUpload.isMultipartContent(req)) {        // 检测是否为多媒体上传// 如果不是则停止
            resp.getWriter().print(MyUtil.s("Error: 表单必须包含(include:) enctype=multipart/form-data"));
            return;
        }
        DiskFileItemFactory factory = new DiskFileItemFactory();        // 配置上传参数
        factory.setSizeThreshold(MEMORY_THRESHOLD);        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));// 设置临时存储目录
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setFileSizeMax(MAX_FILE_SIZE);        // 设置最大文件上传值
        upload.setSizeMax(MAX_REQUEST_SIZE);         // 设置最大请求值 (包含文件和表单数据)
        upload.setHeaderEncoding("UTF-8");           // 中文处理
        // 构造临时路径来存储上传的文件// 这个路径相对当前应用的目录
        String uploadPath = req.getServletContext().getRealPath("./") + File.separator + UPLOAD_DIRECTORY;
        if (!new File(uploadPath).exists())        // 如果目录不存在则创建
            new File(uploadPath).mkdir();
        List<String> imgList = new ArrayList<String>();
        try {
            @SuppressWarnings("unchecked")            // 解析请求的内容提取文件数据
                    List<FileItem> formItems = upload.parseRequest(req);
            if (formItems != null && formItems.size() > 0) {
                for (FileItem item : formItems) {                // 迭代表单数据
                    if (!item.isFormField()) {                        // 处理不在表单中的字段
                        String fileName = new File(item.getName()).getName();
//                        String filePath = uploadPath + File.separator + System.currentTimeMillis() +"-"+ fileName;
                        String filePath = uploadPath + File.separator + time + fileName;
                        File storeFile = new File(filePath);
                        System.out.println("上传路径是：" + filePath); // 在控制台输出文件的上传路径
                        item.write(storeFile);                        // 保存文件到硬盘
                        img_url = requestUrl + "/upload/" + time + fileName;
                        imgList.add(img_url = img_url.replace("/Upload", ""));
                        dbColl.insert(new BasicDBObject().append("url", img_url));
                    }
                }
            }
        } catch (Exception ex) {
            System.out.println("错误信息Error: " + ex.getMessage());
            resp.getWriter().print(MyUtil.e());
        }
        resp.getWriter().print(MyUtil.s("\"" + img_url + "\""));
//        resp.getWriter().print(StrUtil.r(imgList + ""));
    }
}*/
