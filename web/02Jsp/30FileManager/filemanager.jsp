<%--  oddWorld 网站文件管理系统(简体中文版) 2003年10月10日
 copy right by joard Ast
http://www.360doc.com/content/05/0924/01/73_14481.shtml
 filemanager.jsp 功能：网站文件后台管理页面。
 --%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.jspsmart.upload.SmartUpload" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="java.lang.reflect.*" %>

<% //中文字符转换%>
<%!

    public static String UnicodeToChinese(String s) {
        try {
            if (s == null || s.equals("")) return "";
            String newstring = null;
            newstring = new String(s.getBytes("ISO8859_1"), "gb2312");
            return newstring;
        } catch (UnsupportedEncodingException e) {
            return s;
        }
    }

    public static String ChineseToUnicode(String s) {
        try {
            if (s == null || s.equals("")) return "";
            String newstring = null;
            newstring = new String(s.getBytes("gb2312"), "ISO8859_1");
            return newstring;
        } catch (UnsupportedEncodingException e) {
            return s;
        }
    }
%>

<%
    //刷新问题
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);

//自定义登陆用密码和用户名
//正确的用户名
    String username = "lecheng";
//正确的密码
    String userpass = "123456";
//得到系统路径
    ServletContext app = (ServletContext) pageContext.getServletContext();
    String strSysPath = app.getRealPath("/");
//处理对象物理路径
    String strDealPath = "";
//显示错误信息
    String strErr = "";
//代表页面的显示状态，login 是显示登陆页面；show 是正常的显示文件信息；edit 是显示编辑文件的页面；editDo 是编辑文件的写入操作；createF 是显示创建文件夹的页面；createFDo 是创建文件夹的操作；renameFold 是显示更改文件夹名称的页面；renameFoldDo 是更改文
//    件夹名称的操作；delFoldDo 是删除文件夹的操作；renameFile 是显示更改文件名称的页面；renameFileDo 是更改文件名称的操作；
//    delFileDo 是删除文件的操作；uploadFile 是显示上传文件的页面；uploadFileDo 是上传文件的操作；
    String strStat = "login";

//用于show 状态下显示文件的数组
    File[] fileArr = null;

//根据传递的路径参数得到要处理对象的物理路径
    if (request.getParameter("path") == null || request.getParameter("path").equals("")) {
        strDealPath = strSysPath;
    } else {
        //得到路径参数
        strDealPath = UnicodeToChinese(request.getParameter("path"));
    }

//检查session 的值是否存在，如果不存在着显示错误信息
//HttpSession session = request.getSession(false);
    if (session.getValue("loginIn") == null || !session.getValue("loginIn").equals("pass")) {
        strStat = "login";
        strErr = "你还没有登陆或者登陆超时，请重新登陆！";
    }

//创建file 对象，检查目录是否存在
    File myFile = new File(strDealPath);

//检验文件夹是否存在
    if (!myFile.exists()) {
        strErr = "你选择的文件夹不存在，请重新选择！";
    }

//根据参数的不同，进行对应的操作
    if (request.getParameter("act") == null || request.getParameter("act").equals("") ||

            request.getParameter("act").equals("login")) {
        if (request.getParameter("username") != null && request.getParameter("userpass") != null) {

            //正确的经过MD5 加密的密码
            //String userpass="OEEO99107DC8C1EE2E06666B965601EF";

            if (request.getParameter("username").equals(username) && (request.getParameter("userpass")).equals(userpass)) {
                session.putValue("loginIn", "pass");
                response.sendRedirect(request.getRequestURI() + "?act=show");
            }
        } else {
            strStat = "login";
            strErr = "你还没有登陆或者登陆超时，请重新登陆！";
        }
    } else if (request.getParameter("act").equals("show")) {
        //缺省，页面正常显示文件的信息 statStat="show"
        strStat = "show";

        //创建文件列表数组
        fileArr = myFile.listFiles();

    } else if (request.getParameter("act").equals("edit")) {
        //编辑文件内容的页面
        //根据是否有request.getParameter("file")，以及相应文件是否存在，如果有，则进行编辑操作，如果没有，则显示错误提示信息
        if (!(request.getParameter("file") == null || request.getParameter("file").equals(""))) {

            File fileEdit = new

                    File(UnicodeToChinese(request.getParameter("path")) + UnicodeToChinese(request.getParameter("file")));

            if (fileEdit.exists())
                //文件编辑操作，实际就是更改页面的显示，用一个textarea 显示文件的信息，来做编辑
                strStat = "edit";
            else
                //显示错误信息
                strErr = "你选择的文件不存在，请重新选择！";

        } else {
            strErr = "你没有选择要编辑的文件，请重新选择！";
        }
    } else if (request.getParameter("act").equals("editDo")) {
        //把修改的内容写入文件，并且返回修改页面
        if (!(request.getParameter("file") == null || request.getParameter("file").equals(""))) {
            File fileEdit = new

                    File(UnicodeToChinese(request.getParameter("path")) + UnicodeToChinese(request.getParameter("file")));

            if (fileEdit.exists()) {
                //文件编辑操作，实际就是在修改文件内容以后，再于页面上用一个textarea 显示文件的内容，继续来做编辑或者
//                查看修改的效果
                if (!(request.getParameter("fileData") == null)) {

                    try {
                        PrintWriter pwEdit = null;
                        pwEdit = new PrintWriter(new

                                FileOutputStream(UnicodeToChinese(request.getParameter("path")) + UnicodeToChinese(request.getParameter("file"))));
                        pwEdit.println(UnicodeToChinese(request.getParameter("fileData")));
                        pwEdit.close();

                        response.sendRedirect(request.getRequestURI() + "?path=" +

                                UnicodeToChinese(request.getParameter("path")) + "&file=" + UnicodeToChinese(request.getParameter("file")) + "&act=edit");
                        return;
                    } catch (Exception e) {
                        strErr = "文件写入错误，请重新选择！";
                    }
                } else {
                    strErr = "缺少修改文件内容的参数，请重新选择！";
                }
            } else
                //显示错误信息
                strErr = "你选择的文件不存在，请重新选择！";
        } else {
            strErr = "你没有选择要编辑的文件，请重新选择！";
        }
    } else if (request.getParameter("act").equals("createF")) {
        //创建新的文件夹的页面显示
        strStat = "createF";
    } else if (request.getParameter("act").equals("createFDo")) {
        //创建新的文件夹
        String strFoldName = strDealPath + UnicodeToChinese(request.getParameter("foldName")).trim() + "\\";

        //out.println(strFoldName);
        //out.close();

        File fileCreateF = new File(strFoldName);

        if (!fileCreateF.exists()) {
            try {
                fileCreateF.mkdir();
                response.sendRedirect(request.getRequestURI() + "?path=" + strDealPath + "&act=show");
                return;
            } catch (Exception e) {
                strErr = "创建新文件夹失败！";
            }
        } else

        {
            strErr = "指定的文件夹名称和现有的文件夹名称重复，请重新指定一个新的文件夹名称！";
        }
    } else if (request.getParameter("act").equals("delFoldDo")) {
        //删除操作
        try {
            String strFileDelF = strDealPath + UnicodeToChinese(request.getParameter("fold")) + "\\";
            File fileDelF = new File(strFileDelF);

            if (fileDelF.exists()) {
                File[] fileArrCheck = fileDelF.listFiles();
                if (!(fileArrCheck.length > 0)) {
                    fileDelF.delete();
                    response.sendRedirect(request.getRequestURI() + "?path=" + strDealPath + "&act=show");
                    return;
                } else {
                    strErr = "文件夹下面还包含着文件，请把文件都删除，再删除文件夹";
                }
            } else {
                strErr = "要删除的文件夹不存在，请重新选择";
            }

        } catch (Exception e) {
            strErr = "文件夹删除操作错误！";
        }
    } else if (request.getParameter("act").equals("renameFold")) {
        strStat = "renameFold";
    } else if (request.getParameter("act").equals("renameFoldDo")) {
        //文件夹更名操作
        //根据参数判断是否对于文件夹名称有更改动作发生
        if (request.getParameter("changeDo").equals("true")) {
            //有文件名，更名发生
            try {
                String strFileRenameF = strDealPath + UnicodeToChinese(request.getParameter("fold")) + "\\";
                File fileRenameF = new File(strFileRenameF);

                String strFileRenameToF = strDealPath + UnicodeToChinese(request.getParameter("newFoldName")) + "\\";
                File fileRenameToF = new File(strFileRenameToF);

                //判断更名的文件夹是否存在
                if (fileRenameF.exists()) {
                    //判断新的文件夹名称是否与现存的文件夹重名
                    if (!fileRenameToF.exists()) {
                        fileRenameF.renameTo(fileRenameToF);
                        response.sendRedirect(request.getRequestURI() + "?path=" + strDealPath + "&act=show");
                        return;
                    } else {
                        strErr = "指定的文件夹名称和现有的文件夹名称重复，请重新指定一个文件夹名称！";
                    }
                } else {
                    strErr = "要更名的文件夹不存在，请重新选择";
                }

            } catch (Exception e) {
                strErr = "文件夹更名操作错误！";
            }
        }
    } else if (request.getParameter("act").equals("renameFile")) {
        strStat = "renameFile";
    } else if (request.getParameter("act").equals("renameFileDo")) {
        //文件更名操作
        //根据参数判断是否对于文件名称有更改动作发生
        if (request.getParameter("changeDo").equals("true")) {
            //有文件名，更名发生
            try {
                String strFileRenameFi = strDealPath + UnicodeToChinese(request.getParameter("file"));
                File fileRenameFi = new File(strFileRenameFi);

                String strFileRenameToFi = strDealPath + UnicodeToChinese(request.getParameter("newFileName"));
                File fileRenameToFi = new File(strFileRenameToFi);

                //判断更名的文件是否存在
                if (fileRenameFi.exists()) {
                    //判断新的文件名称是否与现存的文件重名
                    if (!fileRenameToFi.exists()) {
                        fileRenameFi.renameTo(fileRenameToFi);
                        response.sendRedirect(request.getRequestURI() + "?path=" + strDealPath + "&act=show");
                        return;
                    } else {
                        strErr = "指定的文件名称和现有的文件名称重复，请重新指定一个文件名称！";
                    }
                } else {
                    strErr = "要更名的文件不存在，请重新选择";
                }

            } catch (Exception e) {
                strErr = "文件更名操作错误！";
            }
        }
    } else if (request.getParameter("act").equals("delFileDo")) {
        //删除操作
        try {
            String strFileDelFi = strDealPath + UnicodeToChinese(request.getParameter("file"));
            File fileDelFi = new File(strFileDelFi);

            if (fileDelFi.exists()) {
                fileDelFi.delete();
                response.sendRedirect(request.getRequestURI() + "?path=" + strDealPath + "&act=show");
                return;
            } else {
                strErr = "要删除的文件不存在，请重新选择";
            }

        } catch (Exception e) {
            strErr = "文件删除操作错误！";
        }
    } else if (request.getParameter("act").equals("uploadFile")) {
        strStat = "uploadFile";
    } else if (request.getParameter("act").equals("uploadFileDo")) {
%>
<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload"/>
<%
        //上传文件操作
        mySmartUpload.initialize(pageContext);
        mySmartUpload.setTotalMaxFileSize(1000000);

        try {
            mySmartUpload.upload();
            mySmartUpload.save(strDealPath);

            response.sendRedirect(request.getRequestURI() + "?path=" + strDealPath + "&act=show");
            return;
        } catch (Exception e) {
            strErr = "文件上传出错，请检查是否超过1M 的文件大小限制！";
        }

    }

%>
<%
    out.println(strStat);
%>

<HTML>
<HEAD><TITLE>Directory Listing For /</TITLE>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
    <META content="MSHTML 5.00.2920.0" name=GENERATOR>
</HEAD>
<BODY bgColor=white>
<div align="center">
    <table border=0 cellpadding=5 cellspacing=0 width="90%">
        <tbody>
        <tr>
            <td align=left bgcolor=#000066 valign=bottom><font color=#ffffff face=宋体
                                                               size=4 Roman? New ,?times><b>&nbsp;网站文件管理器</b></font>
            </td>
            <td align=right bgcolor=#000066 valign=bottom><font color=#ffffff face=宋体
                                                                size=4 Roman? New
                                                                ,?times><b>&nbsp;<strong><%=request.getContextPath()%>
            </strong></b></font></td>
        </tr>
        </tbody>
    </table>
    <table width="90%" border="0" cellspacing="0" cellpadding="5">
        <tr>
            <td><font size="2"><b>物理路径：</b><%=strDealPath%>
            </font></td>
        </tr>
    </table>
    <br>
    <% if (strStat.equals("login")) {%>
    <table width="300" border="0" cellspacing="1" cellpadding="0">
        <tr>
            <td height="200" valign="top" align="center">
                <p align="center">
                <table width="100%" border="0" cellspacing="1" cellpadding="5" bgcolor=#999999 class=a9px>
                    <tr>
                        <td bgcolor="#cccccc"><font size=+2>登录</font></td>
                    </tr>
                    <tr>
                        <td bgcolor="#FFFFFF" valign="top" align="center">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <form name="dataform" method="post"
                                      action="<%=request.getRequestURI()%>?act=login">
                                    <tr>
                                        <td width="100"><b><font size="-1">登录名：</font></b></td>
                                        <td>
                                            <input maxlength=16
                                                   name="username" value="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="100"><b><font size="-1">密码：</font></b></td>
                                        <td>
                                            <input class=stedit maxlength=16
                                                   name="userpass" value="">
                                        </td>
                                    </tr>
                                </form>
                            </table>
                            <br>
                            <table border=0 cellpadding=0 cellspacing=0>
                                <tbody>
                                <tr>
                                    <td>
                                        <input name=update onClick="javascript:if (checkform()==false);" type=button
                                               value="登    录">
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                </tbody>
                            </table>
                            <br>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <% //错误信息显示
    } else if (strErr != "") {
    %>
    <table width="90%" border="0" cellspacing="0" cellpadding="5">
        <tr>
            <td><font size=+2><strong>操作错误</strong></font></td>
        </tr>
    </table>
    <table align=center cellpadding=5 cellspacing=0 width="90%">
        <form name=dataForm2
              action="<%=request.getRequestURI()%>?path=<%=UnicodeToChinese(request.getParameter("path"))%>&fold=<%=UnicodeToChinese(request.getParameter("fold"))%>&act=renameFoldDo"
        <%--action="filemanager.jsp"--%>
              method="post">
            <tbody>
            <tr bgcolor=#cccccc>
                <td align=left bgcolor="#cccccc"><strong><font size="-1">错误原因：</font></strong></td>
            </tr>
            <tr>
                <td align=left><TT><font color="red"><%=strErr%>
                </font></TT>
                </td>
            </tr>
            <tr>
                <td bgcolor=#cccccc align="center"><TT>[ <a href="javascript:history.go(-1);">返回操作</a> ]</TT>&nbsp;&nbsp;<tt>[
                    <a

                            href="<%=request.getRequestURI()%>?path=<%=UnicodeToChinese(request.getParameter("path"))%>&act=show">返回目录</a>
                    ]<input type=hidden name="changeDo" value="false"></tt></td>
            </tr>
            </tbody>
        </form>
    </table>

    <%
    } else if (strStat.equals("show")) {
        //正常显示页面
    %>
    <table width="90%" border="0" cellspacing="0" cellpadding="5">
        <tr>
            <td><font size=+2><strong>目录列表：</strong></font></td>
        </tr>
    </table>
    <table align=center cellpadding=5 cellspacing=0 width="90%">
        <tbody>
        <tr bgcolor=#cccccc>
            <td align=left><font size=+1><strong><font size="-1">名称</font></strong></font><TT>（单击进入相应目录）</TT></td>
            <td align=center><font size=+1><strong><font size="-1">修改时间</font></strong></font></td>
            <td align=center><b><font size="-1">重命名</font></b></td>
            <td align=center><b><font size="-1">删除</font></b></td>
        </tr>
        <%
            //显示表格行的初始颜色
            String bgColor = "";
            //如果不是根目录，则显示一个回到上层目录的连接
            if (!(strDealPath.equals(strSysPath))) {%>
        <tr bgcolor=<%=bgColor%>>
            <td align=left>&nbsp;&nbsp;<tt><font color=#000066 face=WingDings
                                                 size=4>0</font><a title="单击进入上层目录"

                                                                   href="<%=request.getRequestURI()%>?path=<%=(myFile.getParent())+"\\"%>&act=show">上层目录</a></tt>
            </td>
            <td align=right>&nbsp;</td>
            <td align=center>&nbsp;</td>
            <td align=center>&nbsp;</td>
        </tr>
        <% }
            for (int i = 0; i < fileArr.length; i++) {
                //如果是文件夹则显示
                if (fileArr[i].isDirectory()) {
                    //颜色隔行变换
                    bgColor = bgColor.equals("#eeeeee") ? "" : "#eeeeee";
        %>
        <tr bgcolor=<%=bgColor%>>
            <td align=left>&nbsp;&nbsp;<tt><FONT color=#000066 face=WingDings
                                                 size=4>0</FONT><a title="单击进入相应目录"

                                                                   href="<%=request.getRequestURI()%>?path=<%=strDealPath+fileArr[i].getName()+"\\"%>&act=show"><%=fileArr[i].getName()%>
            </a></tt></td>
            <td align=center><tt><%=(new Date(fileArr[i].lastModified()))%>
            </tt></td>
            <td align=center><TT><a

                    href="<%=request.getRequestURI()%>?path=<%=strDealPath%>&fold=<%=fileArr[i].getName()%>&act=renameFold">重命名</a></TT>
            </td>
            <form name="dataFormFold<%=i%>" method="post"

                  action="<%=request.getRequestURI()%>?path=<%=strDealPath%>&fold=<%=fileArr[i].getName()%>&act=delFoldDo">
                <td

                        align=center><TT><a
                        href="javascript:if(confirm('确实要删除该文件夹，所有的内容将不能继续使用？')){window.dataFormFold<%=i%>.submit();}">删除</a></TT>
                </td>
            </form>
        </tr>
        <% }
        } %>
        <tr align="center">
            <td bgcolor=#cccccc colspan=4><TT>[ <a
                    href="<%=request.getRequestURI()%>?path=<%=strDealPath%>&act=createF">新建文件夹

            </a>
                ]</TT></td>
        </tr>
        </tbody>
    </table>
    <table width="90%" border="0" cellspacing="0" cellpadding="5">
        <tr>
            <td><font size=+2><strong>文件列表：</strong></font></td>
        </tr>
    </table>
    <TABLE align=center cellPadding=5 cellSpacing=0 width="90%">
        <TBODY>
        <TR bgColor=#cccccc>
            <TD align=left><FONT size=+1><STRONG><font size="-1">名称</font></STRONG></FONT><TT>（单击编辑相应文件）</TT></TD>
            <TD align=center><FONT size=+1><strong><font size="-1">大小</font></strong></FONT></TD>
            <TD align=center><FONT size=+1><STRONG><font size="-1">修改时间</font></STRONG></FONT></TD>
            <TD align=center><b><font size="-1">重命名</font></b></TD>
            <TD align=center><b><font size="-1">删除</font></b></TD>
        </TR>
        <%
            bgColor = "#eeeeee";
            if (fileArr.length != 0) {
                for (int i = 0; i < fileArr.length; i++) {
                    //如果是文件则显示
                    if (fileArr[i].isFile()) {
                        bgColor = bgColor.equals("#eeeeee") ? "" : "#eeeeee";
        %>
        <TR bgColor=<%=bgColor%>>
            <TD align=left>&nbsp;&nbsp; <TT><FONT color=#000066 face=WingDings
                                                  size=4>3</FONT><a title="单击编辑相应文件"

                                                                    href="<%=request.getRequestURI()%>?path=<%=strDealPath%>&file=<%=fileArr[i].getName()%>&act=edit"><%=fileArr[i].getName()%>
            </

                a></TT></TD>
            <TD align=center><TT><%=fileArr[i].length()%>
            </TT></TD>
            <TD align=center><TT><%=(new Date(fileArr[i].lastModified()))%>
            </TT></TD>
            <TD align=center><TT><a

                    href="<%=request.getRequestURI()%>?path=<%=strDealPath%>&file=<%=fileArr[i].getName()%>&act=renameFile">重命名</a></TT>
            </TD>
            <form name="dataFormFile<%=i%>" method="post"

                  action="<%=request.getRequestURI()%>?path=<%=strDealPath%>&file=<%=fileArr[i].getName()%>&act=delFileDo">
                <TD

                        align=center><TT><a
                        href="javascript:if(confirm('确实要删除该文件，内容将不能继续使用？')){window.dataFormFile<%=i%>.submit();}">删除</a></TT>
                </TD>
            </form>
        </TR>
        <% }
        }
        } else {%>
        <TR>
            <TD align=left>&nbsp;&nbsp; <TT>没有文件</TT></TD>
            <TD align=right>&nbsp;</TD>
            <TD align=right>&nbsp;</TD>
            <TD align=center>&nbsp;</TD>
            <TD align=center>&nbsp;</TD>
        </TR>
        <%}%>
        <TR align="center">
            <TD bgColor=#cccccc colSpan=5><TT>[ <a
                    href="<%=request.getRequestURI()%>?path=<%=strDealPath%>&act=uploadFile">上传文

                件</a> ]</TT></TD>
        </TR>
        </TBODY>
    </TABLE>
    <%
        //正常显示状态结束
    } else if (strStat.equals("edit")) {
        //文件编辑状态
        BufferedReader bufReadIn = new BufferedReader(new

                FileReader(UnicodeToChinese(request.getParameter("path")) + UnicodeToChinese(request.getParameter("file"))));
        String strContext = "";
        String strReadLine = "";
    %>
    <table width="90%" border="0" cellspacing="0" cellpadding="5">
        <tr>
            <td><font size=+2><strong>编辑文件：</strong></font></td>
        </tr>
    </table>

    <table align=center cellpadding=5 cellspacing=0 width="90%">
        <form name=dataForm

              action="<%=request.getRequestURI()%>?path=<%=UnicodeToChinese(request.getParameter("path"))%>&file=<%=UnicodeToChinese(request.getParameter("file"))%>&act=editDo"
              method="post">
            <tbody>
            <tr bgcolor=#cccccc>
                <td align=left><font size=+1><strong><font size="-1">文件名称</font></strong></font><tt><font color=#000066

                                                                                                          face=WingDings


                                                                                                          size=4>3</font><%=(UnicodeToChinese(request.getParameter("path")) + UnicodeToChinese(request.getParameter("file")))%>
                </tt></td>
            </tr>
            <tr>
                <td align=center><textarea name="fileData" rows=18 cols=70 wrap="OFF">
                        <%
                            while ((strReadLine = bufReadIn.readLine()) != null)
                                out.println(strReadLine);

                            bufReadIn.close();
                        %>
                </textarea></td>
            </tr>
            <tr>
                <td bgcolor=#cccccc align="center">
                    <TT>[ <a href="javascript:window.dataForm.submit();">提交内容</a> ]</TT>&nbsp;&nbsp;<TT>[ <a

                        href="<%=request.getRequestURI()%>?path=<%=UnicodeToChinese(request.getParameter("path"))%>&act=show">返回目录</a>
                    ]</TT>
                </td>
            </tr>
            </tbody>
        </form>
    </table>
    <%
    } else if (strStat.equals("createF")) {
    %>
    <table width="90%" border="0" cellspacing="0" cellpadding="5">
        <tr>
            <td><font size=+2><strong>创建文件夹：</strong></font></td>
        </tr>
    </table>
    <table align=center cellpadding=5 cellspacing=0 width="90%">
        <form name=dataForm

              action="<%=request.getRequestURI()%>?path=<%=UnicodeToChinese(request.getParameter("path"))%>&act=createFDo"
              method="post">
            <tbody>
            <tr bgcolor=#cccccc>
                <td align=left><font size=+1><strong><font size="-1">你要创建的文件夹在</font></strong></font><font color=#000066

                                                                                                           face=WingDings
                                                                                                           size=4>0</font><tt><%=(UnicodeToChinese(request.getParameter("path")))%>
                </tt><font size=+1><strong><font size="-1">下

                </font></strong></font></td>
            </tr>
            <tr>
                <td align=left>
                    <TT>新建文件夹名称：</TT><input type=text name=foldName value="" maxlength="50" size="50">
                </td>
            </tr>
            <tr>
                <td bgcolor=#cccccc align="center"><tt>[ <a href="javascript:if (checkForm()==false);">提交内容</a>
                    ]</tt>&nbsp;&nbsp;<tt>[ <a

                        href="<%=request.getRequestURI()%>?path=<%=UnicodeToChinese(request.getParameter("path"))%>&act=show">返回目录</a>
                    ]</tt></td>
            </tr>
            </tbody>
        </form>
    </table>
    <%
    } else if (strStat.equals("renameFold")) { %>
    <table width="90%" border="0" cellspacing="0" cellpadding="5">
        <tr>
            <td><font size=+2><strong>重命名文件夹：</strong></font></td>
        </tr>
    </table>
    <table align=center cellpadding=5 cellspacing=0 width="90%">
        <form name=dataForm2

              action="<%=request.getRequestURI()%>?path=<%=UnicodeToChinese(request.getParameter("path"))%>&fold=<%=UnicodeToChinese(request.getParameter("fold"))%>&act=renameFoldDo"
              method="post">
            <tbody>
            <tr bgcolor=#cccccc>
                <td align=left><font size=+1><strong><font size="-1">你要重命名的文件夹</font></strong></font><font color=#000066

                                                                                                           face=WingDings


                                                                                                           size=4>0</font><tt><%=(UnicodeToChinese(request.getParameter("path"))+UnicodeToChinese(request.getParameter("fold"))+"\\")%><

                    /tt></td>
            </tr>
            <tr>
                <td align=left><tt>重命名的文件夹名称：</tt>
                    <input type=text name=newFoldName value="<%=UnicodeToChinese(request.getParameter("fold"))%>"
                           maxlength="50"

                           size="50">
                </td>
            </tr>
            <tr>
                <td bgcolor=#cccccc align="center"><tt>[ <a href="javascript:if (checkForm2()==false);">提交内容</a>
                    ]</tt>&nbsp;&nbsp;<tt>[ <a

                        href="<%=request.getRequestURI()%>?path=<%=UnicodeToChinese(request.getParameter("path"))%>&act=show">返回目录</a>
                    ]<input type=hidden name="changeDo" value="false"></tt></td>
            </tr>
            </tbody>
        </form>
    </table>
    <%
    } else if (strStat.equals("renameFile")) {%>
    <table width="90%" border="0" cellspacing="0" cellpadding="5">
        <tr>
            <td><font size=+2><strong>重命名文件：</strong></font></td>
        </tr>
    </table>
    <table align=center cellpadding=5 cellspacing=0 width="90%">
        <form name=dataForm3

              action="<%=request.getRequestURI()%>?path=<%=UnicodeToChinese(request.getParameter("path"))%>&file=<%=UnicodeToChinese(request.getParameter("file"))%>&act=renameFileDo"
              method="post">
            <tbody>
            <tr bgcolor=#cccccc>
                <td align=left><font size=+1><strong><font size="-1">你要重命名的文件</font></strong></font><font color=#000066
                                                                                                          face=WingDings
                                                                                                          size=4>3</font><tt><%=(UnicodeToChinese(request.getParameter("path")) + UnicodeToChinese(request.getParameter("file")))%>
                </tt></td>
            </tr>
            <tr>
                <td align=left><tt>重命名的文件名称：</tt>
                    <input type=text name=newFileName value="<%=UnicodeToChinese(request.getParameter("file"))%>"
                           maxlength="50"

                           size="50">
                </td>
            </tr>
            <tr>
                <td bgcolor=#cccccc align="center"><tt>[ <a href="javascript:if (checkForm3()==false);">提交内容</a>
                    ]</tt>&nbsp;&nbsp;<tt>[ <a

                        href="<%=request.getRequestURI()%>?path=<%=UnicodeToChinese(request.getParameter("path"))%>&act=show">返回目录</a>
                    ]
                    <input type=hidden name="changeDo" value="false">
                </tt></td>
            </tr>
            </tbody>
        </form>
    </table>
    <%
    } else if (strStat.equals("uploadFile")) {
    %>
    <table width="90%" border="0" cellspacing="0" cellpadding="5">
        <tr>
            <td><font size=+2><strong>上传文件：</strong></font></td>
        </tr>
    </table>
    <table align=center cellpadding=5 cellspacing=0 width="90%">
        <form name=dataForm4

              action="<%=request.getRequestURI()%>?path=<%=UnicodeToChinese(request.getParameter("path"))%>&act=uploadFileDo"
              method="post"

              ENCTYPE="multipart/form-data">
            <tbody>
            <tr bgcolor=#cccccc>
                <td align=left><font size=+1><strong><font size="-1">你要上传的文件在</font></strong></font><font color=#000066
                                                                                                          face=WingDings
                                                                                                          size=4>0</font><tt><%=(UnicodeToChinese(request.getParameter("path")))%>
                </tt><font size=+1><strong><font size="-1">下

                </font></strong></font></td>
            </tr>
            <tr>
                <td align=left><tt>选择上传的文件：</tt>
                    <INPUT TYPE="FILE" NAME="fileName" SIZE="30"></td>
            </tr>
            <tr>
                <td bgcolor=#cccccc align="center"><tt>[ <a href="javascript:if (checkForm4()==false);">提交内容</a>
                    ]</tt>&nbsp;&nbsp;<tt>[ <a

                        href="<%=request.getRequestURI()%>?path=<%=UnicodeToChinese(request.getParameter("path"))%>&act=show">返回目录</a>
                    ]
                </tt></td>
            </tr>
            </tbody>
        </form>
    </table>
    <%
        }
    %>
    <br>
    <br>
    <hr>
    <TT>&copy;版权所有：Joard·Ast　 版本： 简体中文1.00</TT>
    <br><TT>任何意见或建议请联络：<a href="mailto:ebony_mzb@hotmail.com"><font color=red>ebony_mzb@hotmail.com</font></a></TT>

</div>
</BODY>
</HTML>
<SCRIPT LANGUAGE=javascript>
    <!--

    <%
    //根据参数不同，显示不同的检测参数的函数
    if(strStat.equals("login")) {%>

    function checkform() {
        var Checkblank = /^(\s*|(\　)|(\.))*$/;

        if (Checkblank.test(dataform.username.value)) {
            alert("登录名不能为空!");
            return false;
        }

        if (Checkblank.test(dataform.userpass.value)) {
            alert("密码不能为空!");
            return false;
        }


        window.dataform.submit();

    }

    <%}else if(strStat.equals("createFold")) {%>

    function checkForm() {
        var Checkblank = /^(\s*|(\　)|(\.))*$/;
        if (Checkblank.test(dataForm.foldName.value)) {
            alert("新建文件夹名称不能为空！");
            dataForm.foldName.focus();
            return false;
        }

        var SPECIAL_STR = "\\/:*?\"><|";
        for (i = 0; i < (dataForm.foldName.value).length; i++) {
            if (SPECIAL_STR.indexOf((dataForm.foldName.value).charAt(i)) != -1) {
                alert("文件夹名称不能含有如下字符\\/:*?\"><|");
                dataForm.foldName.focus();
                return false;
            }
        }

        window.dataForm.submit();
    }

    <%}else if(strStat.equals("renameFold")) {%>

    function checkForm2() {
        var Checkblank = /^(\s*|(\　)|(\.))*$/;
        if (Checkblank.test(dataForm2.newFoldName.value)) {
            alert("重命名的文件夹名称不能为空！");
            dataForm2.newFoldName.focus();
            return false;
        }

        var SPECIAL_STR = "\\/:*?\"><|";
        for (i = 0; i < (dataForm2.newFoldName.value).length; i++) {
            if (SPECIAL_STR.indexOf((dataForm2.newFoldName.value).charAt(i)) != -1) {
                alert("文件夹名称不能含有如下字符\\/:*?\"><|");
                dataForm2.newFoldName.focus();
                return false;
            }
        }
        //如果文件更名后和原文件名不同，则标示一个参数，表明确实有更名动作发生
        if (dataForm2.newFoldName.value != "<%=UnicodeToChinese(request.getParameter("fold"))%>") {
            window.dataForm2.changeDo.value = "true";
        }
        else {
            alert("请输入一个新的文件夹名称！");
            dataForm2.newFoldName.focus();
            return false;
        }

        window.dataForm2.submit();

    }

    <%}else if(strStat.equals("renameFile"))
    {%>

    function checkForm3() {
        var Checkblank = /^(\s*|(\　)|(\.))*$/;
        if (Checkblank.test(dataForm3.newFileName.value)) {
            alert("重命名的文件夹名称不能为空！");
            dataForm3.newFileName.focus();
            return false;
        }

        var SPECIAL_STR = "\\/:*?\"><|";
        for (i = 0; i < (dataForm3.newFileName.value).length; i++) {
            if (SPECIAL_STR.indexOf((dataForm3.newFileName.value).charAt(i)) != -1) {
                alert("文件名称不能含有如下字符\\/:*?\"><|");
                dataForm3.newFileName.focus();
                return false;
            }
        }
        //如果文件更名后和原文件名不同，则标示一个参数，表明确实有更名动作发生
        if (dataForm3.newFileName.value != "<%=UnicodeToChinese(request.getParameter("file"))%>") {
            window.dataForm3.changeDo.value = "true";
        }
        else {
            alert("请输入一个新的文件名称！");
            dataForm3.newFileName.focus();
            return false;
        }

        window.dataForm3.submit();

    }

    <%}else if(strStat.equals("uploadFile")){%>

    function checkForm4() {
        var Checkblank = /^(\s*|(\　)|(\.))*$/;
        if (Checkblank.test(dataForm4.fileName.value)) {
            alert("重命名的文件夹名称不能为空！");
            dataForm4.fileName.focus();
            return false;
        }

        window.dataForm4.submit();

    }

    <%}%>
    //-->
</SCRIPT>