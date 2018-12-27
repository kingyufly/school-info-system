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

    <title>User Info</title>

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
    String usertype = request.getParameter("type");
    ResultSet rst = null;
    Connection conn = null;
    Statement state = null;
    try {
        String connectString = "jdbc:mysql://123.56.8.117/school?useSSL=false";
        String user = "outeruser";
        String pwd = "Abcd1234!";
        String sql = "select * from user_" + usertype + ";";
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
    <h1 align="center">Edit Users</h1>
</div>

<div style="background:#0A9BE6; color:#FFF;position:fixed;left:0;bottom:0;width: 100%" align="right">
    2018 Beijing University of Posts and Telecommunications. All Rights Reserved.
</div>

<div align="center">
<table border=1 width="100%">
    <tr>
        <td>Username</td>
        <td>Password</td>
        <td colspan="2" align="center">Operation</td>
    </tr>
    <%while (rst.next()) {%>
    <tr>
        <td><%=rst.getString("username") %>
        </td>
        <td><%=rst.getString("password") %>
        </td>
        <td><a href="deleteBean.jsp?id=<%=rst.getString("id")%>&type=<%=usertype%>">Delete</a></td>
        <td><a href="updateBean.jsp?id=<%=rst.getString("id")%>&type=<%=usertype%>">Update</a></td>
    </tr>
    <%}%>
</table>
</div>
<a href="add<%=usertype%>.jsp?type=<%=usertype%>">Add more user</a></td><br>
<div>
    <br><br>
</div>
</body>
</html>