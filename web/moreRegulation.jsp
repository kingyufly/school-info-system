<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Regulation Detail</title>
    <%
        String chapter = request.getParameter("chapter_id");
        String[] chapterSplit = chapter.split("\\.");
        String chapter_id = chapterSplit[0];
        ResultSet rst = null;
        Connection conn = null;
        Statement state = null;

        String subchapter_id = null;
        if (chapterSplit.length == 2) {
            subchapter_id = chapterSplit[1];
        }

        String connectString = "jdbc:mysql://123.56.8.117/school?useSSL=false";
        String user = "outeruser";
        String pwd = "Abcd1234!";

        String sql = "";
        if (subchapter_id == null) {
            sql = "select * from regulations where chapter_id=" + chapter_id + ";";
        } else {
            sql = "select * from regulations where chapter_id=" + chapter_id + " and subchapter_id=" + subchapter_id + ";";
        }


        Class.forName("com.mysql.jdbc.Driver");

        conn = DriverManager.getConnection(connectString, user, pwd);
        state = conn.createStatement();

        rst = state.executeQuery(sql);
    %>
</head>

<body>
<div>
    <img src="img/logo.gif">
    <h1 align="center">Regulation Detail</h1>
</div>

<div style="background:#0A9BE6; color:#FFF;position:fixed;left:0;bottom:0;width: 100%" align="right">
    2018 Beijing University of Posts and Telecommunications. All Rights Reserved.
</div>

<div class="tab-pane fade" id="regulation">
    <br><br>
    <center>
        <table border="1" width="90%">
            <%
                out.print(
                        "    <tr>\n" +
                                "        <th> Chapter</th>\n" +
                                "        <th> Content</th>\n" +
                                "    </tr>");


                if (subchapter_id != null) {
                    out.print("<tr>");
                    rst.next();
                    String content = rst.getString("content");
                    out.print("<td>" + chapter + "</td>");
                    if ((content.indexOf(".jpg") != -1) || (content.indexOf(".JPG") != -1) || (content.indexOf(".png") != -1) || (content.indexOf(".PNG") != -1)) {
                        out.print("<td><img src=" + content + " width=\"100%\" height=\"100%\"></td>");
                    } else {
                        out.print("<td>" + content + "</td>");
                    }
                    out.print("</tr>");
                } else {
                    while (rst.next()) {
                        out.print("<tr>");
                        String content = rst.getString("content");
                        String chapterStr = rst.getString("chapter_id");
                        String subchapterStr = rst.getString("subchapter_id");

                        out.print("<td>" + chapterStr + "." + subchapterStr + "</td>");
                        if ((content.indexOf(".jpg") != -1) || (content.indexOf(".JPG") != -1) || (content.indexOf(".png") != -1) || (content.indexOf(".PNG") != -1)) {
                            out.print("<td><img src=" + content + " width=\"100%\" height=\"100%\"></td>");
                        } else {
                            out.print("<td>" + content + "</td>");
                        }
                        out.print("</tr>");
                    }
                }
            %>
        </table>
    </center>
</div>

<div>
    <br><br>
</div>
</body>
</html>