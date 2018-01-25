<%--
  Created by IntelliJ IDEA.
  User: Cheng
  Date: 2018/1/25
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>请稍后</title>
    <link rel="stylesheet" type="text/css" href="weui.css">
</head>
<body>
<%=session.getAttribute("mySession")%>
<div class="weui-msg">
    <div class="weui-msg__icon-area"><i class="weui-icon-warn weui-icon_msg"></i></div>
    <div class="weui-msg__text-area">
        <h2 class="weui-msg__title">信息：</h2>
        <p class="weui-msg__desc">由于长时间未操作，需要刷新用户信息<a href="javascript:void(0);">文字链接</a></p>
    </div>
    <div class="weui-msg__opr-area">
        <p class="weui-btn-area">
            <a href="javascript:history.back();" class="weui-btn weui-btn_primary">页面没反应，</a>
            <a href="javascript:history.back();" class="weui-btn weui-btn_default">辅助操作</a>
        </p>
    </div>
    <div class="weui-msg__extra-area">
        <div class="weui-footer">
            <p class="weui-footer__links">
                <a href="javascript:void(0);" class="weui-footer__link">底部链接文本</a>
            </p>
            <p class="weui-footer__text">Copyright © 2008-2016 weui.io</p>
        </div>
    </div>
</div>
</body>
</html>
