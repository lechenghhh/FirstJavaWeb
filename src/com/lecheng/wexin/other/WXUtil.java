package com.lecheng.wexin.other;

import com.alibaba.fastjson.JSON;

import java.io.InputStream;
import java.net.HttpURLConnection;

public class WXUtil {
    public static AuthToken getAuthToken(String code) {
        AuthToken vo = null;
        try {
            String uri = "https://api.weixin.qq.com/sns/oauth2/access_token?";
            StringBuffer url = new StringBuffer(uri);
            url.append("appid=").append(Configure.APP_ID);
            url.append("&secret=").append(Configure.APP_SECRET);
            url.append("&code=").append(code);
            url.append("&grant_type=").append("authorization_code");
            HttpURLConnection conn = HttpClientUtil.CreatePostHttpConnection(url.toString());
            InputStream input = null;
            if (conn.getResponseCode() == 200) {
                input = conn.getInputStream();
            } else {
                input = conn.getErrorStream();
            }
            vo = JSON.parseObject(new String(HttpClientUtil.readInputStream(input), "utf-8"), AuthToken.class);
        } catch (Exception e) {
            System.out.println("getAuthToken error=" + e);
        }
        return vo;
    }
}
