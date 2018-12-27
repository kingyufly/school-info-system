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
            var content = document.getElementById("content");

            if (content.value == "" || content.value == null) {
                alert("Please identify content!");
                content.focus();
                return false;
            }
            return true;
        }
    </script>

</head>

<body>
<%
    String id = request.getParameter("id");
    ResultSet rst = null;
    Connection conn = null;
    Statement state = null;
    try {
        String connectString = "jdbc:mysql://123.56.8.117/school?useSSL=false";
        String user = "outeruser";
        String pwd = "Abcd1234!";
        String sql = "select * from regulations where id=" + id + ";";
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
    <h1 align="center">Edit Regulations</h1>
</div>

<div style="background:#0A9BE6; color:#FFF;position:fixed;left:0;bottom:0;width: 100%" align="right">
    2018 Beijing University of Posts and Telecommunications. All Rights Reserved.
</div>

<div align="center">
    <form action="doUpdateRegulation.jsp?id=<%=id%>" method="post" onsubmit="return checkValid()">
        Content:<input type="text" value="<%=rst.getString("content") %>" id="content" name="content"><br>
        </select><br>
        <input type="submit" value="Submit">
    </form>
    <form action="regulationInfo.jsp">
        <input type="submit" value="Cancel">
    </form>
</div>
<div>
    <br><br>
</div>
</body>
</html>