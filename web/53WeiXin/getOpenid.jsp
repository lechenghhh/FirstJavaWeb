<%@ page import="java.net.InetAddress" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>👀获取openid</title>
    <script type="text/javascript" src="jweixin-1.2.0.js"></script>
</head>
<body>
<%
    InetAddress addr = InetAddress.getLocalHost();
    String localIp = addr.getHostAddress().toString();
%>
<div style="display: flex;font-size:14px;flex-direction: column;">
    本机ip：<%=localIp%><br>
    请填写接口配置信息，此信息需要你有自己的服务器资源，
    填写的URL需要正确响应微信发送的Token验证，请阅读消息接口使用指南。
    <a style="background: #2da7b2;color: #fff;padding: 8px;"
       href="http://<%=localIp%>:8085/10WeiXin/getOpenid.jsp">本页URL</a>
    <a style="background: #0BB20C;color: #fff;padding: 8px;"
       onclick="getOpenId('')">点击此处获取openid</a>
    <img style="height: 100px;width: 100px;"
         src="http://qr.liantu.com/api.php?text=http://<%=localIp%>:8085/10WeiXin/getOpenid.jsp">
</div>
<script>
    /* 写cookie */
    function setCookie(name, value) {
        var Days = 30;
        var exp = new Date();
        exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
        document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString() + ";path=/";
    }

    /* 读cookie */
    function getCookie(name) {
        var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
        if (arr != null) {
            return unescape(arr[2]);
        }
        return null;
    }

    /* 获取URL参数 */
    function getUrlParams(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) {
            return unescape(r[2]);
        }
        return null;
    }

    /* 获取openid */
    function getOpenId(url) {
        var openid = getCookie("usropenid");
        if (openid == null) {
            openid = getUrlParams('openid');
            // alert("openid=" + openid);
            if (openid == null) {
                window.location.href = "http://<%=localIp%>:8085/wxcode?url=" + url;
                // window.location.href = "wxcode?url=" + url;
            } else {
                setCookie("usropenid", openid);
            }
        }
    }
</script>
</body>
</html>