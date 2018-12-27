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
    <title>Registration</title>
    <meta name="content-type" content="text/html; charset=UTF-8">
    <script type="text/javascript">
        function validation() {
            var studentId = document.getElementById("studentId");
            var studentName = document.getElementById("studentName");
            var telephone = document.getElementById("telephone");

            var username = document.getElementById("username");
            var password = document.getElementById("password");
           ame.value == null) {
                alert("Please identify the Student Name!");
                studentName.focus();
                document.getElementById("alert1").innerHTML = "Please enter the Student Name!";
                return false;
            } else if (telephone.value == "" || telephone.value == null) {
                alert("Please identify the Telephone Number!");
                studentId.focus();
                document.getElementById("alert1").innerHTML = "Please enter the Telephone Number!";
                return false;
            } else if (telephone.value.length != 11) {
                alert("Please identify the Telephone Number Correctly!");
                telephone.focus();
                telephone.value = "";
                document.getElementById("alert1").innerHTML = "Please enter the Telephone Number Correctly!";
                return false;
            } else if (username.value == "" || username.value == null) {
                alert("Please identify the Username!");
                username.focus();
                document.getElementById("alert2").innerHTML = "Please enter the Username!";
                return false;
            } else if (password.value == "" || password.value == null) {
                alert("Please identify the Password!");
                password.focus();
                document.getElementById("alert2").innerHTML = "Please enter the Password!";
                return false;
            } else if (conPassword.value != password.value) {
                alert("Please Reconfirm the Password!");
                conPassword.focus();
                conPassword.value = "";
                document.getElementById("alert2").innerHTML = "Please Reconfirm the Password!";
                return false;
            }
            return true;
        }
    </script>
</head>

<body>

<div>
    <img src="img/logo.gif">
    <h1 align="center">Registration</h1>
</div>

<div style="background:#0A9BE6; color:#FFF;position:fixed;left:0;bottom:0;width: 100%" align="right">
    2018 Beijing University of Posts and Telecommunications. All Rights Reserved.
</div>

<div align="center">
    <h2>Please first fill in the blanks to identify yourself</h2>
    <font color="red">
        <nobr name="alert1" id="alert1"></nobr>
    </font>
    <form action="/SignupServlet" onsubmit="return validation()" method="get">
        <table border="0">
            <tr>
                <td>Student ID:</td>
                <td><input name="studentId" id="studentId"></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><input name="studentName" id="studentName"></td>
            </tr>
            <tr>
                <td>Gender:</td>
                <td><select name="gender" id="gender">
                    <option>Male</option>
                    <option>Female</option>
                </select></td>
            </tr>
            <tr>
                <td>Telephone:</td>
                <td><input name="telephone" id="telephone"></td>
            </tr>
            <tr>
                <td>Major:</td>
                <td><select name="major" id="major">
                    <option value="0">Telecommunications Engineering with Management (No Stream)</option>
                    <option value="1">Telecommunications Engineering with Management (Communication Stream)</option>
                    <option value="2">Telecommunications Engineering with Management (Multimedia Stream)</option>
                    <option value="3">E-Commerce Engineering with Law</option>
                    <option value="4">Internet of Things Engineering</option>
                </select></td>
            </tr>
            <tr>
                <td>Semester:</td>
                <td><select name="semester" id="semester">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                </select></td>
            </tr>
        </table>

        <input type="hidden" name="userType" id="userType" value="student">
        <br>
        <h2>Please set your username and password</h2>
        <font color="red">
            <nobr name="alert2" id="alert2"></nobr>
        </font>
        <table border="0">
            <tr>
                <td>Username:</td>
                <td><input name="username" id="username"></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input name="password" id="password" type="password"></td>
            </tr>
            <tr>
                <td>Confirm:</td>
                <td><input name="conPassword" id="conPassword" type="password"></td>
            </tr>

            <tr>
                <td><br></td>
            </tr>
            <tr align="center">
                <td colspan="2"><input type="submit" value="Registration"></td>
            </tr>
        </table>
    </form>

    You already have an account?<a href="signin.jsp">
    <front color="GREEN">Click to Sign in</front>
</a>
</div>
<div>
    <br><br>
</div>

</body>
<%
    if (session.equals(null) || session.getAttribute("error") == null)
        ;
    else if (session.getAttribute("error").equals("1")) {
        out.print("<script>\n" +
                "    !function(){\n" +
                "        document.getElementById(\"username\").focus();\n" +
                "        document.getElementById(\"alert2\").innerHTML=\"The Username has been registered! Please try again!\";\n" +
                "    }();\n" +
                "</script>");

        session.invalidate();
    } else if (session.getAttribute("error").equals("2")) {
        out.print("<script>\n" +
                "    !function () {\n" +
                "        document.getElementById(\"username\").focus();\n" +
                "        document.getElementById(\"alert1\").innerHTML = \"Cannot identify! Please try again!\";\n" +
                "    }();\n" +
                "</script>");
        session.invalidate();
    } else
        ;
%>
</html>