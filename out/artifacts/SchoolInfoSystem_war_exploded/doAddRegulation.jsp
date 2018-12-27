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
    String chapter = request.getParameter("chapter");
    String subchapter = request.getParameter("subchapter");
    String content = request.getParameter("content");


    Connection conn = null;
    Statement state = null;
    try {
        String connectString = "jdbc:mysql://123.56.8.117/school?useSSL=false";
        String user = "outeruser";
        String pwd = "Abcd1234!";

        String sql = null;

        sql = "insert into regulations (chapter_id,subchapter_id,content) values (\'" + chapter + "\',\'" + subchapter + "\',\'" + content + "\');";


        Class.forName("com.mysql.jdbc.Driver");

        conn = DriverManager.getConnection(connectString, user, pwd);
        state = conn.createStatement();

        state.execute(sql);
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect("regulationInfo.jsp");
%>