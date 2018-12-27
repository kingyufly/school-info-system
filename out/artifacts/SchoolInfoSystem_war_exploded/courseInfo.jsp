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

    <title>Curriculum Info</title>

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
    String[] major = new String[5];
    try {
        String connectString = "jdbc:mysql://123.56.8.117/school?useSSL=false";
        String user = "outeruser";
        String pwd = "Abcd1234!";
        String sql = "select * from major_data;";
        Class.forName("com.mysql.jdbc.Driver");

        conn = DriverManager.getConnection(connectString, user, pwd);
        state = conn.createStatement();

        rst = state.executeQuery(sql);

        rst.next();
        major[0] = rst.getString("name");
        rst.next();
        major[1] = rst.getString("name");
        rst.next();
        major[2] = rst.getString("name");
        rst.next();
        major[3] = rst.getString("name");
        rst.next();
        major[4] = rst.getString("name");

        sql = "select * from course_data;";
        rst = state.executeQuery(sql);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<div>
    <img src="img/logo.gif">
    <h1 align="center">Edit Curriculum</h1>
</div>

<div style="background:#0A9BE6; color:#FFF;position:fixed;left:0;bottom:0;width: 100%" align="right">
    2018 Beijing University of Posts and Telecommunications. All Rights Reserved.
</div>

<div>
<table border=1>
    <tr>
        <td>Curriculum ID</td>
        <td>Curriculum Name</td>
        <td>Major</td>
        <td>Semester</td>
        <td>Student Number</td>
        <td>Classroom</td>
        <td>Time</td>
        <td>Teacher</td>
        <td>Class</td>
        <td colspan="2" align="center">Operation</td>
    </tr>
    <%
        while (rst.next()) {
    %>
    <tr>
        <td><%=rst.getString("course_id") %>
        </td>
        <td><%=rst.getString("course_name") %>
        </td>
        <td><%=major[rst.getInt("major_id")]%>
        </td>
        <td><%=rst.getString("semester") %>
        </td>
        <td><%=rst.getString("student_number") %>
        </td>
        <td><%=rst.getString("classroom") %>
        </td>
        <td><%=rst.getString("time") %>
        </td>
        <td><%=rst.getString("teacher") %>
        </td>
        <td><%=rst.getString("class") %>
        </td>
        <td>
            <a href="deleteCourse.jsp?id=<%=rst.getString("id")%>">Delete</a>
        </td>
        <td><a href="updateCourse.jsp?id=<%=rst.getString("id")%>">Update</a></td>
    </tr>
    <%}%>
</table>
<a href="addcourse.jsp">Add more Curriculums</a></td><br>
</div>
<div>
    <br><br>
</div>
</body>
</html>