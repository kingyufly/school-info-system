<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>Regulation Info</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body>
<%
    ResultSet rst = null;
    Connection conn = null;
    Statement state = null;
    try {
        String connectString = "jdbc:mysql://123.56.8.117/school?useSSL=false";
        String user = "outeruser";
        String pwd = "Abcd1234!";
        String sql = "select * from regulations;";
        Class.forName("com.mysql.jdbc.Driver");

        conn = DriverManager.getConnection(connectString, user, pwd);
        state = conn.createStatement();

        rst = state.executeQuery(sql);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<div>
    <img src="img/logo.gif">
    <h1 align="center">Edit Regulations</h1>
</div>

<div style="background:#0A9BE6; color:#FFF;position:fixed;left:0;bottom:0;width: 100%" align="right">
    2018 Beijing University of Posts and Telecommunications. All Rights Reserved.
</div>

<div>
    <table border=1>
        <tr>
            <td>Chapter</td>
            <td>Content</td>
            <td colspan="2" align="center">Operation</td>
        </tr>
        <%
            while (rst.next()) {
                String chapterid = null;
                if (rst.getString("subchapter_id").equals("0")) {
                    chapterid = rst.getString("chapter_id");
                } else {
                    chapterid = rst.getString("chapter_id") + "." + rst.getString("subchapter_id");
                }
        %>
        <tr>
            <td><%=chapterid %>
            </td>
            <td><%=rst.getString("content") %>
            </td>
            <td>
                <a href="deleteRegulation.jsp?id=<%=rst.getString("id")%>&chapter=<%=rst.getString("chapter_id")%>&subchapter=<%=rst.getString("subchapter_id")%>">Delete</a>
            </td>
            <td><a href="updateRegulation.jsp?id=<%=rst.getString("id")%>">Update</a></td>
        </tr>
        <%}%>
    </table>
</div>
<a href="addregulation.jsp">Add more regulation</a></td><br>
<div>
    <br><br>
</div>
</body>
</html>