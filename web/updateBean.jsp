<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>

<%@ page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="jscript">
        function checkValid() {
            var username = document.getElementById("username");
            var password = document.getElementById("password");

            if (username.value == "" || username.value == null) {
                alert("Please identify username!");
                username.focus();
                return false;
            } else if (password.value == "" || password.value == null) {
                alert("Please identify password!");
                password.focus();
                return false;
            }
            return true;
        }
    </script>
</head>

<body>
<%
    String usertype = request.getParameter("type");
    String id = request.getParameter("id");
    ResultSet rst = null;
    Connection conn = null;
    Statement state = null;
    try {
        String connectString = "jdbc:mysql://123.56.8.117/school?useSSL=false";
        String user = "outeruser";
        String pwd = "Abcd1234!";
        String sql = "select * from user_" + usertype + " where id=" + id + ";";

        Class.forName("com.mysql.jdbc.Driver");

        conn = DriverManager.getConnection(connectString, user, pwd);
        state = conn.createStatement();

        rst = state.executeQuery(sql);
    } catch (Exception e) {
        e.printStackTrace();
    }
    rst.next();
%>

<div>
    <img src="img/logo.gif">
    <h1 align="center">Edit Users</h1>
</div>

<div style="background:#0A9BE6; color:#FFF;position:fixed;left:0;bottom:0;width: 100%" align="right">
    2018 Beijing University of Posts and Telecommunications. All Rights Reserved.
</div>

<div>
<form action="doUpdateBean.jsp?type=<%=usertype%>&id=<%=id%>" method="post" onsubmit="return checkValid()">
    Username:<input type="text" value="<%=rst.getString("username") %>" id="username" name="username"><br>
    Password:<input type="text" value="<%=rst.getString("password") %>" id="password" name="password"><br>
    </select><br>
    <input type="submit" value="Submit">
</form>
<form action="userInfo.jsp?type=<%=usertype%>">
    <input type="submit" value="Cancel">
</form>
</div>
<div>
    <br><br>
</div>
</body>
</html>