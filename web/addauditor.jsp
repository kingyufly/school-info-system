<%--
  Created by IntelliJ IDEA.
  User: Wang Yufei
  Date: 2018/3/17
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>

<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<html>
<head>
</head>

<body>

<%
    String usertype = request.getParameter("type");
%>
<div>
    <img src="img/logo.gif">
    <h1 align="center">Add Auditor</h1>
</div>

<div style="background:#0A9BE6; color:#FFF;position:fixed;left:0;bottom:0;width: 100%" align="right">
    2018 Beijing University of Posts and Telecommunications. All Rights Reserved.
</div>

<div align="center">
    <form action="doAddUser.jsp" method="get">
        <table border="0">
            <tr>
                <td>Name:</td>
                <td><input name="name" id="name"></td>
            </tr>
            <tr>
                <td>Username:</td>
                <td><input name="username" id="username"></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input name="password" id="password" type="password"></td>
            </tr>
            <td colspan="2"><input type="submit" value="Registration"></td>
        </table>
        <input type="hidden" name="type" id="type" value="<%=usertype%>">
    </form>
</div>
<div>
    <br><br>
</div>

</body>
</html>
