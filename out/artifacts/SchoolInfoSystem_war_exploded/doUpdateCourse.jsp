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
    String course_id = request.getParameter("course_id");
    String course_name = request.getParameter("course_name");
    String major_id = request.getParameter("major");
    String semester = request.getParameter("semester");
    String student_number = request.getParameter("student_number");
    String classroom = request.getParameter("classroom");
    String time = request.getParameter("time");
    String teacher = request.getParameter("teacher");
    String classs = request.getParameter("class");
    String id = request.getParameter("id");


    Connection conn = null;
    Statement state = null;
    try {
        String connectString = "jdbc:mysql://123.56.8.117/school?useSSL=false";
        String user = "outeruser";
        String pwd = "Abcd1234!";
        String sql = "update course_data set course_id=\'" + course_id + "\'," +
                "course_name=\'" + course_name + "\'," +
                "major_id=\'" + major_id + "\'," +
                "semester=\'" + semester + "\'," +
                "student_number=\'" + student_number + "\'," +
                "classroom=\'" + classroom + "\'," +
                "time=\'" + time + "\'," +
                "teacher=\'" + teacher + "\'," +
                "class=\'" + classs + "\' where id=" + id + ";";
        Class.forName("com.mysql.jdbc.Driver");
        
        conn = DriverManager.getConnection(connectString, user, pwd);
        state = conn.createStatement();

        state.execute(sql);
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect("courseInfo.jsp");
%>