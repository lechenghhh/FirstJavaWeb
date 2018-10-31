<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<html>
<head>
    <base href="<%=basePath%>">

    <title>确认账号信息</title>
    <script type="text/ecmascript" src="views/common/js/jquery-1.10.2.js"></script>
    <script type="text/ecmascript" src="views/common/js/jqgrid/grid.locale-zh_CN.js"></script>
    <script type="text/ecmascript" src="views/common/js/jqgrid/jquery.jqGrid.min.js"></script>
    <%-- <jsp:include page="/views/common/jsp/common.jsp"></jsp:include> --%>
    <!-- 当前jsp对应的js脚本 -->
    <!--   <script type="text/ecmascript" src="views/wechat/js/wxMYZJ.js"></script> -->
    <link rel="stylesheet" type="text/css" media="screen" href="views/wechat/css/wxConfirmAccInfo.css"/>
    <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0;">
    <meta charset="utf-8"/>


</head>
<body>
<div class="logo" style="width:100%;"><img style="width:100%;" src="views/wechat/img/title.png" alt=""/></div>
<section class="containner">
    <!--    导航部分-->

    <!--  主体部分  	-->
    <article class="clearfix">
        <h3>个人信息变更-- <span>账号确认</span></h3>
        <form action="">
            <ul class="formbox clearfix">
                <li>
                    <p>公积金账号</p>
                    <input type="text" value="<%=request.getAttribute("gjjaccount") %>" id="gjjaccount" readonly>
                </li>
                <li>
                    <p>姓名</p>
                    <input type="text" value="<%=request.getAttribute("name") %>" id="name" readonly>
                </li>

                <li>
                    <p>证件类型</p>
                    <input type="text" value="<%=request.getAttribute("credit_type") %>" id="credit_type" readonly>
                </li>
                <li>
                    <p>证件号码</p>
                    <input type="text" value="<%=request.getAttribute("credit_code") %>" id="credit_code" readonly>
                </li>
                <li>
                    <p>手机号码</p>
                    <input type="text" value="<%=request.getAttribute("mobile") %>" id="mobile" readonly>
                </li>
                <!-- <li>
                    <p>第三方认证机构<span class="redstart">*</span></p>
                    <select name="" id="" >
                        <option value="">1</option>
                        <option value="">2</option>
                        <option value="">3</option>
                    </select>
                </li>
                <li>
                    <p>手机号<span class="redstart">*</span></p>
                    <input type="text" placeholder="手机号码" readonly>
                </li>
                 <li>
                    <p class="">验证码<span class="redstart">*</span></p>
                    <div>
                        <input type="text" placeholder="验证码">
                        <div class="yzm">6529</div>
                    </div>
                </li> -->
                <!-- <li>
                    <p>手机验证码<span class="redstart">*</span></p>
                    <div>
                        <input type="text" placeholder="手机验证码">
                        <div class="postmobile">发送验证码</div>
                    </div>
                </li> -->
                <li><p style="font-size:14px;text-align:center;font-family:黑体;">请确认以上信息是否为您希望操作的账号信息</p></li>
                <li>
                    <div id="messagecheck" style="margin-top:0px;">
                        <img src="views/wechat/img/yes.png" alt="">
                        账号确认
                    </div>
                </li>
            </ul>
        </form>
    </article>
    <input type="hidden" value="<%=request.getAttribute("openid")%>" id="openid"/>
    <div class="footer" style="">

        <em>版权所有：福建省直住房公积金管理中心</em>
        <em>备案/许可证编号：闽ICP备05036605号</em>
        <em>地址： 福州市鼓屏路142号 </em></div>
</section>
</body>
<style>
    em {

        font-style: normal;
        color: #666A74

    }

    .footer em {
        display: block;
        font-style: normal;
    }

    .footer {
        text-align: center;
        color: #222121;
        font-size: 0.9rem;
        padding: 0.4rem 0 0.2rem;
        line-height: 32px;
        background: #fbfbfb;
        margin-top: 30px;
    }
</style>
</html>