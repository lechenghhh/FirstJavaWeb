package com.lecheng.wexin;

import com.lecheng.wexin.other.Configure;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

//参数详情：http://blog.csdn.net/qq_24800377/article/details/53437040
//此套代码教程地址：http://blog.csdn.net/xfei365/article/details/52749418?locationNum=2&fps=1
@WebServlet("/wxcode")                              //http://blog.csdn.net/lihaiyun718/article/details/6280297
public class WxCode extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String state = req.getParameter("url");
        System.out.println("state=" + state);
        //WxOpenIdServlet的地址
        String redirect = "http://" + Configure.SITE + "wxopenid";
        redirect = URLEncoder.encode(redirect, "utf-8");
        StringBuffer url = new StringBuffer("https://open.weixin.qq.com/connect/oauth2/authorize?appid=")
                .append(Configure.APP_ID).append("&redirect_uri=").append(redirect)
                .append("&response_type=code&scope=snsapi_base&state=").append(state).append("#wechat_redirect");
        resp.sendRedirect(url.toString());

    }
}
