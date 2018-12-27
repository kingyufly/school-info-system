<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>


<%
    String id = request.getParameter("id");
    String chapter = request.getParameter("chapter");
    String subchapter = request.getParameter("subchapter");

    Connection conn = null;
    Statement state = null;
    ResultSet rst = null;
    try {
        String connectString = "jdbc:mysql://123.56.8.117/school?useSSL=false";
        String user = "outeruser";
        String pwd = "Abcd1234!";
        String sql = null;
        if (subchapter.equals("0"))
            sql = "delete from regulations where chapter_id=" + chapter + ";";
        else
            sql = "delete from regulations where id=" + id + ";";
        Class.forName("com.mysql.jdbc.Driver");

        conn = DriverManager.getConnection(connectString, user, pwd);
        state = conn.createStatement();

        state.execute(sql);


//        if (subchapter.equals("0")) {
//            sql = "select id from regulations where chapter_id <" + chapter + ";";
//            rst = state.executeQuery(sql);
//            while (rst.next()) {
//                sql = "select chapter_id from regulations where id=" + rst.getString("id");
//                ResultSet rst2 = state.executeQuery(sql);
//                rst2.next();
//                sql = "update regulations set chapter_id=" + (rst2.getInt("chapter_id") - 1) + " where id=" + id + ";";
//                state.execute(sql);
//            }
//        } else {
//            sql = "select id from regulations where subchapter_id <" + subchapter + ";";
//            rst = state.executeQuery(sql);
//            while (rst.next()) {
//                sql = "select subchapter_id from regulations where id=" + rst.getString("id");
//                ResultSet rst2 = state.executeQuery(sql);
//                rst2.next();
//                sql = "update regulations set subchapter_id=" + (rst2.getInt("subchapter_id") - 1) + " where id=" + id + ";";
//                state.execute(sql);
//            }
//        }
    } catch (Exception e) {
        e.printStackTrace();
    }


    response.sendRedirect("regulationInfo.jsp");
%>