package com.lecheng.wexin;


import com.lecheng.wexin.other.AuthToken;
import com.lecheng.wexin.other.WXUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/wxopenid")                              //http://blog.csdn.net/lihaiyun718/article/details/6280297
public class WxOpenid extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        try {


            String code = req.getParameter("code");
            String state = req.getParameter("state");
//        Result ret = new Result();
            AuthToken token = WXUtil.getAuthToken(code);
            if (null != token.getOpenid()) {
//            ret.setCode(0);
                System.out.println("====openid==" + token.getOpenid());
                Map<String, String> map = new HashMap<String, String>();
                map.put("openid", token.getOpenid());
                map.put("state", state);
//            ret.setData(map);
            } else {
//            ret.setCode(-1);
//            ret.setMsg("登录错误");
            }
            String redUrl = "10WeiXin/callback.jsp" + "?openid=" + token.getOpenid();
//            String redUrl = state + "?openid=" + token.getOpenid();
            resp.sendRedirect(redUrl);
        } catch (Exception e) {
            resp.getWriter().println("错误：" + e);
        }
    }
}
