package com.lecheng.wexin.other;

public interface Configure {
    /* 请修改3处ip/域名
     * 1.微信公众平台-JS接口安全域名:http://192.168.0.193:8085/
     * 2.微信公众平台-授权回调页面域名:192.168.0.193:8085
     * 3.Configure.SITE = 192.168.0.193:8085/
     * */
    public static final String SITE = "192.168.0.193:8085/";
    public static final String APP_ID = "wx4a2e6272cdb36a00";//公众平台的appID
    public static final String APP_SECRET = "dadf7ae7bcea0978cbdabafcd5e8c35c";//公众平台的appsecret
}
