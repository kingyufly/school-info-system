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

</head>

<body>
<%
    String id = request.getParameter("id");

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

        sql = "select * from course_data where id=" + id + ";";
        rst = state.executeQuery(sql);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>


<div>
    <img src="img/logo.gif">
    <h1 align="center">Add Curriculum</h1>
</div>

<div style="background:#0A9BE6; color:#FFF;position:fixed;left:0;bottom:0;width: 100%" align="right">
    2018 Beijing University of Posts and Telecommunications. All Rights Reserved.
</div>

<div align="center">
    <form action="doAddCourse.jsp" method="get">
        <table border="0">
            <tr>
                <td>Curriculum ID</td>
                <td><input name="course_id" id="course_id"></td>
            </tr>
            <tr>
                <td>Curriculum Name</td>
                <td><input name="course_name" id="course_name"></td>
            </tr>
            Major:<select name="major">
            <option value="1"><%=major[1]%>
            </option>
            <option value="2"><%=major[2]%>
            </option>
            <option value="3"><%=major[3]%>
            </option>
            <option value="4"><%=major[4]%>
            </option>
        </select>
            Semester:<select name="semester">
            <option value="1">1
            </option>
            <option value="2">2
            </option>
            <option value="3">3
            </option>
            <option value="4">4
            </option>
            <option value="5">5
            </option>
            <option value="6">6
            </option>
            <option value="7">7
            </option>
            <option value="8">8
            </option>
        </select>

            <tr>
                <td>Student Number</td>
                <td><input name="student_number" id="student_number"></td>
            </tr>
            <tr>
                <td>Classroom</td>
                <td><input name="classroom" id="classroom"></td>
            </tr>
            <tr>
                <td>Time</td>
                <td><input name="time" id="time"></td>
            </tr>
            <tr>
                <td>Teacher</td>
                <td><input name="teacher" id="teacher"></td>
            </tr>
            <tr>
                <td>Class</td>
                <td><input name="class" id="class"></td>
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