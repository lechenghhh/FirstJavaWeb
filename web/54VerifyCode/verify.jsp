<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2018/10/11
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>验证码页面</title>
</head>
<body>
<form action="verifyCode.jsp" method="post">
    请输入验证码：
    <input type="text" name="code" style="width: 80px;"/>
    <img id="imgObj" alt="验证码" height="32px" width="120px" onclick="changeImg()"
         src="verifyCode.jsp">
    <%--src="${pageContext.request.contextPath}/verifyCode">--%><%--servlet--%>
    <input type="submit" value="提交"/>
</form>

<script type="text/javascript">


    function changeImg() {
        var imgSrc = document.getElementById("imgObj");
        // var imgSrc = $("#imgObj");
        var src = imgSrc.getAttribute("src");
        imgSrc.setAttribute("src", chgUrl(src));
    }

    // 时间戳
    // 为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
    function chgUrl(url) {
        var timestamp = (new Date()).valueOf();
        url = url.substring(0, 20);
        if ((url.indexOf("&") >= 0)) {
            url = url + "×tamp=" + timestamp;
        } else {
            url = url + "?timestamp=" + timestamp;
        }
        return url;
    }

</script>
</body>
</html>