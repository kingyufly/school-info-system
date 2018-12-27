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


<div>
    <img src="img/logo.gif">
    <h1 align="center">Add Regulation</h1>
</div>

<div style="background:#0A9BE6; color:#FFF;position:fixed;left:0;bottom:0;width: 100%" align="right">
    2018 Beijing University of Posts and Telecommunications. All Rights Reserved.
</div>

<div align="center">
    <form action="doAddRegulation.jsp" method="get">
        <table border="0">
            <tr>
                <td>Chapter ID:</td>
                <td><input name="chapter" id="chapter"></td>
            </tr>
            <tr>
                <td>SubChapter ID:</td>
                <td><input name="subchapter" id="subchapter"></td>
            </tr>
            <tr>
                <td>Content:</td>
                <td><input name="content" id="content"></td>
            </tr>
            <td colspan="2"><input type="submit" value="Add"></td>
        </table>
    </form>
</div>
<div>
    <br><br>
</div>

</body>
</html>
