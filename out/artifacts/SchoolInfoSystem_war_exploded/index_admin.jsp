<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Admin</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function validation() {
            var words = document.getElementById("words");
            if (words.value == "" || words.value == null)
                return false;
            return true;
        }
    </script>
</head>
<body>

<div>
    <img src="img/logo.gif">
    <h1 align="center">Information System</h1>
</div>

<div style="background:#0A9BE6; color:#FFF;position:fixed;left:0;bottom:0;width: 100%" align="right">
    2018 Beijing University of Posts and Telecommunications. All Rights Reserved.
</div>

<div align="right">
    Welcome
    <%
        out.print(" " + session.getAttribute("name") + "!  ");
    %>
    <a href="/SignoutServlet">
        <front color="GREEN">Sign out</front>
    </a>
</div>

<br>
<ul id="myTab" class="nav nav-tabs">
    <li class="active">
        <a href="#searchRegulation" data-toggle="tab">
            Search for Regulations and Curriculums
        </a>
    </li>
    <li>
        <a href="#regulation" data-toggle="tab">
            All Regulations
        </a>
    </li>
    <li>
        <a href="#course" data-toggle="tab">
            All Curriculums
        </a>
    </li>
    <li>
        <a href="#manage" data-toggle="tab">
            Management
        </a>
    </li>
</ul>

<div id="myTabContent" class="tab-content">
    <div class="tab-pane fade in active" id="searchRegulation">
        <br>
        <center>
            <form id="searchform" name="searchForm" onsubmit="return validation()" action="/SearchServlet"
                  method="get">
                <select id="type" name="type">
                    <option>Regulation</option>
                    <option>Curriculum</option>
                </select>
                <input style="width:50%" name="words" id="words">
                <input type="submit" value="Search" style="color:#BC8F8F;width:10%;height:5%;">
                <%--<input type="hidden" name="type" value="regulation">--%>
            </form>
            <nobr id="result"></nobr>

            <br><br>
            <%
                if (session.getAttribute("searchRegulationList") != null) {
                    List list = (List) session.getAttribute("searchRegulationList");
                    out.print("<table border=\"1\" width=\"90%\">\n" +
                            "    <tr>\n" +
                            "        <th> Chapter</th>\n" +
                            "        <th> Content</th>\n" +
                            "    </tr>");

                    for (int i = 0; i < list.size(); i++) {
                        Map map = (Map) list.get(i);
                        out.print("<tr>");
                        out.print("<td>" + map.get("chapter_id") + "</td>");
                        String content = "" + map.get("content");
                        if ((content.indexOf(".jpg") != -1) || (content.indexOf(".JPG") != -1)) {
                            out.print("<td><img src=" + content + " width=\"100%\" height=\"100%\"></td>");
                        } else {
                            out.print("<td>" + content + "</td>");
                        }
                        out.print("</tr>");
                    }
                    out.print("</table>");
                    session.removeAttribute("searchRegulationList");
                } else if (session.getAttribute("searchCourseList") != null) {
                    List list = (List) session.getAttribute("searchCourseList");
                    out.print("<table border=\"1\" width=\"90%\">\n" +
                            "    <tr>\n" +
                            "        <th> Curriculum ID</th>\n" +
                            "        <th> Curriculum Name</th>\n" +
                            "        <th> Major</th>\n" +
                            "        <th> Semester</th>\n" +
                            "        <th> Student Number</th>\n" +
                            "        <th> Class</th>\n" +
                            "        <th> Time</th>\n" +
                            "        <th> Classroom</th>\n" +
                            "        <th> Teacher</th>\n" +
                            "    </tr>");

                    for (int i = 0; i < list.size(); i++) {
                        Map map = (Map) list.get(i);
                        out.print("<tr>");
                        out.print("<td>" + map.get("course_id") + "</td>");
                        out.print("<td>" + map.get("course_name") + "</td>");
                        out.print("<td>" + map.get("major") + "</td>");
                        out.print("<td>" + map.get("semester") + "</td>");
                        out.print("<td>" + map.get("student_number") + "</td>");
                        out.print("<td>" + map.get("classs") + "</td>");
                        out.print("<td>" + map.get("time") + "</td>");
                        out.print("<td>" + map.get("classroom") + "</td>");
                        out.print("<td>" + map.get("teacher") + "</td>");
                        out.print("</tr>");
                    }
                    out.print("</table>");
                    session.removeAttribute("searchCourseList");
                } else
                    ;
            %>
        </center>
    </div>
    <div class="tab-pane fade" id="regulation">
        <br><br>
        <center>
            <table border="1" width="90%">
                <tr>
                    <th> Chapter</th>
                    <th> Content</th>
                </tr>

                <%
                    List list = (List) session.getAttribute("regulationList");
                    out.print(
                            "    <tr>\n" +
                                    "        <th> Chapter</th>\n" +
                                    "        <th> Content</th>\n" +
                                    "    </tr>");

                    for (int i = 0; i < list.size(); i++) {
                        Map map = (Map) list.get(i);
                        out.print("<tr>");
                        out.print("<td>" + map.get("chapter_id") + "</td>");
                        String content = "" + map.get("content");
                        if ((content.indexOf(".jpg") != -1) || (content.indexOf(".JPG") != -1)) {
                            out.print("<td><img src=" + content + " width=\"100%\" height=\"100%\"></td>");
                        } else {
                            out.print("<td>" + content + "</td>");
                        }
                        out.print("</tr>");
                    }
                %>


            </table>
        </center>
    </div>

    <div class="tab-pane fade" id="course">
        <br><br>
        <center>
            <table border="1" width="90%">
                <tr>
                    <th> Curriculum ID</th>
                    <th> Curriculum Name</th>
                    <th> Major</th>
                    <th> Semester</th>
                    <th> Student Number</th>
                    <th> Class</th>
                    <th> Time</th>
                    <th> Classroom</th>
                    <th> Teacher</th>
                </tr>

                <c:forEach items="${courseList}" var="courseList" varStatus="idx">
                    <tr>
                        <td>${courseList.course_id}</td>
                        <td>${courseList.course_name}</td>
                        <td>${courseList.major}</td>
                        <td>${courseList.semester}</td>
                        <td>${courseList.student_number}</td>
                        <td>${courseList.classs}</td>
                        <td>${courseList.time}</td>
                        <td>${courseList.classroom}</td>
                        <td>${courseList.teacher}</td>
                    </tr>
                </c:forEach>


            </table>
        </center>
    </div>

    <div class="tab-pane fade" id="manage">
        <a href="userInfo.jsp?type=student" target="_blank">Manage Student</a><br>
        <a href="userInfo.jsp?type=staff" target="_blank">Manage Staff</a><br>
        <a href="userInfo.jsp?type=admin" target="_blank">Manage Admin</a><br>
        <a href="userInfo.jsp?type=auditor" target="_blank">Manage Auditor</a><br>
        <a href="regulationInfo.jsp" target="_blank">Manage Regulation</a><br>
        <a href="courseInfo.jsp" target="_blank">Manage Curriculum</a><br>
    </div>
</div>
<div>
    <br>
</div>
</body>
</html>