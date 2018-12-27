<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>


<%
    String id = request.getParameter("id");


    Connection conn = null;
    Statement state = null;

    try {
        String connectString = "jdbc:mysql://123.56.8.117/school?useSSL=false";
        String user = "outeruser";
        String pwd = "Abcd1234!";
        String sql = "delete from course_data where id=" + id + ";";

        Class.forName("com.mysql.jdbc.Driver");

        conn = DriverManager.getConnection(connectString, user, pwd);
        state = conn.createStatement();

        state.execute(sql);
    } catch (Exception e) {
        e.printStackTrace();
    }


    response.sendRedirect("courseInfo.jsp");
%>