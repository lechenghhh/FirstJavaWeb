<%--
  Created by IntelliJ IDEA.
  User: Cheng
  Date: 2017/1/7
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%
    String uname = (String) session.getAttribute("uname");
    if (uname == null) {
%>
<jsp:forward page="login.jsp"/>
<%
    }
%>