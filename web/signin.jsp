<%--
  Created by IntelliJ IDEA.
  User: Wang Yufei
  Date: 2018/3/22
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>登录界面</title>
    <script type="text/javascript">
        function validation() {
            var usr_check = document.getElementById("username");
            var pwd_check = document.getElementById("password");
            if (usr_check.value == "" || usr_check.value == null) {
                alert("Please identify the Username!");
                usr_check.focus();
                document.getElementById("alert").innerHTML = "Please enter the Username!";
                return false;
            } else if (pwd_check.value == "" || pwd_check.value == null) {
                alert("Please identify the Password!");
                pwd_check.focus();
                document.getElementById("alert").innerHTML = "Please enter the Password!";
                return false;
            }

            return true;
        }
    </script>
</head>


<body>

<div>
    <img src="img/logo.gif">
    <h1 align="center">Sign in</h1>
</div>

<div style="background:#0A9BE6; color:#FFF;position:fixed;left:0;bottom:0;width: 100%" align="right">
    2018 Beijing University of Posts and Telecommunications. All Rights Reserved.
</div>

<div align="center">
    <%
        if (session.equals(null) || session.getAttribute("error") == null)
            ;
        else if (session.getAttribute("error").equals("true")) {
            out.print("<font color=\"red\">Wrong Username and Password! Please try again!</font>");
            session.invalidate();
        } else
            ;
    %>
    <td><font color="red">
        <nobr name="alert" id="alert"></nobr>
    </font></td>
    <form id="indexform" name="indexForm" onsubmit="return validation()" action="/SigninServlet" method="get">
        <table border="0">
            <tr>
                <td>Username:</td>
                <td><input type="text" name="username" id="username"></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="password" id="password">
                </td>
            </tr>
            <tr></tr>
            <tr>
                <td>User Type：</td>
                <td>
                    <select name="userType" id="userType">
                        <option>student</option>
                        <option>staff</option>
                        <option>admin</option>
                        <option>auditor</option>
                    </select>
                </td>
            </tr>
        </table>
        <br>
        <input type="submit" value="Sign in" style="color:#BC8F8F;width:10%;height:5%;">
    </form>
    <form action="signup.jsp">
        <input type="submit" value="Registration" style="color:#BC8F8F;width:10%;height:5%;">
    </form>
</div>

</body>
</html>