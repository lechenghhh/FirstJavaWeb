<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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

    <title>用户须知</title>
    <script type="text/ecmascript" src="views/common/js/jquery-1.10.2.js"></script> 
    <script type="text/ecmascript" src="views/common/js/jqgrid/grid.locale-zh_CN.js"></script>
    <script type="text/ecmascript" src="views/common/js/jqgrid/jquery.jqGrid.min.js"></script>
	<%-- <jsp:include page="/views/common/jsp/common.jsp"></jsp:include> --%>
    <!-- 当前jsp对应的js脚本 -->
     <!-- <script type="text/ecmascript" src="views/wechat/js/wxMYZJ.js"></script>  -->
    <link rel="stylesheet" type="text/css" media="screen" href="views/wechat/css/wxReadIns.css" />
    <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0;">
	<meta charset="utf-8" />

    
</head>
<body>
 <section class="containner">
<!--    导航部分-->
    	<!-- <nav>
    		<div class="logo">
    			<img src="views/wechat/img/logo.png" alt="">
    			<div class="title">
    				<p>省直公积金</p>
    				<p>后台管理系统</p>
    			</div>
    		</div>
    		<div class="navbar">
    			<span></span>
    			<span></span>
    			<span></span>
    		</div>
    	</nav> -->
    	<div class="logo" style="width:100%;"><img style="width:100%;" src="views/wechat/img/title.png" alt="" /></div>
<!--  主体部分  	-->
       <article class="clearfix">
       	    <h3>个人信息变更-- <span>用户须知</span></h3>
       	    <div class="textcontent clearfix">
       	        <h4>个人信息变更用户须知</h4>
       	    	<p>1.首先。。。</p>
       	    	<p>2.其次。。。</p>
       	    	<p>3.最后。。。</p>
       	    </div>
       	    <div class="chekbtn" >
				<input type="checkbox" id="agreed" >
				<label for="agreed" >我已经认真阅读并同意遵守上述须知内容</label>
		   </div>
           <div id="messagecheck">
			   <img src="views/wechat/img/yes.png" alt="">
				确认提交
           </div>
       </article>
       <%-- <input type="hidden" value="<%=request.getAttribute("openid")%>" id="openid"/> --%>
       <input type="hidden" value="123" id="openid"/>
        <div class="footer" style="">
        	
        		<em>版权所有：福建省直住房公积金管理中心</em>  
        	<em>备案/许可证编号：闽ICP备05036605号</em>  
        	<em>地址： 福州市鼓屏路142号 </em></div>
    </section>
    
	</body>
	<script type="text/javascript">
    	$("#messagecheck").click(function(){
    		if($("#agreed").is(":checked")){
    			window.location.href="wxBusManage/toConfirm?openid="+$("#openid").val();
    		}
    	});
    </script>
	<style>
	em{
	
    font-style: normal;
    color:#666A74

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