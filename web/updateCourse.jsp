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
    <script type="jscript">
        function checkValid() {
            var course_id = document.getElementById("course_id");
            var course_name = document.getElementById("course_name");
            var major = document.getElementById("major");
            var student_number = document.getElementById("student_number");
            var classroom = document.getElementById("classroom");
            var time = document.getElementById("time");
            var teacher = document.getElementById("teacher");
            var classs = document.getElementById("class");

            if (course_id.value == "" || course_id.value == null) {
                alert("Please identify Curriculum ID!");
                course_id.focus();
                return false;
            } else if (course_name.value == "" || course_name.value == null) {
                alert("Please identify Curriculum Name!");
                course_name.focus();
                return false;
            } else if (major.value == "" || major.value == null) {
                alert("Please identify Major!");
                major.focus();
                return false;
            } else if (student_number.value == "" || student_number.value == null) {
                alert("Please identify Student Number!");
                student_number.focus();
                return false;
            } else if (classroom.value == "" || classroom.value == null) {
                alert("Please identify Classroom!");
                classroom.focus();
                return false;
            } else if (time.value == "" || time.value == null) {
                alert("Please identify Time!");
                time.focus();
                return false;
            } else if (teacher.value == "" || teacher.value == null) {
                alert("Please identify Teacher!");
                teacher.focus();
                return false;
            } else if (classs.value == "" || classs.value == null) {
                alert("Please identify class!");
                classs.focus();
                return false;
            }
            return true;
        }
    </script>
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
        rst.next();
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
<form action="doUpdateCourse.jsp?id=<%=id%>" method="post" onsubmit="return checkValid()">
    Curriculum ID:<input type="text" value="<%=rst.getString("course_id") %>" name="course_id" id="course_id"><br>
    Curriculum Name:<input type="text" value="<%=rst.getString("course_name") %>" name="course_name" id="course_name"><br>
    Major:<select name="major" id="major">
    <option value="1" <%if (rst.getString("major_id").equals("1")) out.print("selected=\"selected\"");%>><%=major[1]%>
    </option>
    <option value="2" <%if (rst.getString("major_id").equals("2")) out.print("selected=\"selected\"");%>><%=major[2]%>
    </option>
    <option value="3" <%if (rst.getString("major_id").equals("3")) out.print("selected=\"selected\"");%>><%=major[3]%>
    </option>
    <option value="4" <%if (rst.getString("major_id").equals("4")) out.print("selected=\"selected\"");%>><%=major[4]%>
    </option>
</select>
    Semester:<select name="semester">
    <option value="1" <%if (rst.getString("semester").equals("1")) out.print("selected=\"selected\"");%>>1</option>
    <option value="2" <%if (rst.getString("semester").equals("2")) out.print("selected=\"selected\"");%>>2</option>
    <option value="3" <%if (rst.getString("semester").equals("3")) out.print("selected=\"selected\"");%>>3</option>
    <option value="4" <%if (rst.getString("semester").equals("4")) out.print("selected=\"selected\"");%>>4</option>
    <option value="5" <%if (rst.getString("semester").equals("5")) out.print("selected=\"selected\"");%>>5</option>
    <option value="6" <%if (rst.getString("semester").equals("6")) out.print("selected=\"selected\"");%>>6</option>
    <option value="7" <%if (rst.getString("semester").equals("7")) out.print("selected=\"selected\"");%>>7</option>
    <option value="8" <%if (rst.getString("semester").equals("8")) out.print("selected=\"selected\"");%>>8</option>
</select>
    Student Number:<input type="text" value="<%=rst.getString("student_number") %>" id="student_number"
                          name="student_number"><br>
    Classroom:<input type="text" value="<%=rst.getString("classroom") %>" id="classroom" name="classroom"><br>
    Time:<input type="text" value="<%=rst.getString("time") %>" name="time" id="time"><br>
    Teacher:<input type="text" value="<%=rst.getString("teacher") %>" name="teacher" id="teacher"><br>
    Class:<input type="text" value="<%=rst.getString("class") %>" name="class" id="class"><br>
    <input type="submit" value="Submit">
</form>
<form action="courseInfo.jsp">
    <input type="submit" value="Cancel">
</form>
</div>
<div>
    <br><br>
</div>
</body>
</html>