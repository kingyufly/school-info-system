<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
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
    <a href="signin.jsp">
        <front color="GREEN">Sign in</front>
    </a>
    or
    <a href="signup.jsp">
        <front color="GREEN">Registration</front>
    </a>
</div>

<br>
<ul id="myTab" class="nav nav-tabs">
    <li class="active">
        <a href="#home" data-toggle="tab">
            Search for Regulations
        </a>
    </li>
    <li><a href="#ios" data-toggle="tab">Regulation</a></li>
</ul>
<div id="myTabContent" class="tab-content">
    <div class="tab-pane fade in active" id="home">
        <br>
        <center>
            <form id="searchform" name="searchForm" onsubmit="return validation()" action="/SearchRegulationServlet"
                  method="get">
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
                } else
                    ;
            %>


        </center>
    </div>
    <div class="tab-pane fade" id="ios">
        <br><br>
        <center>
            <table border="1" width="90%">
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
                        out.print("<td><a href=\"moreRegulation.jsp?chapter_id=" + map.get("chapter_id") + "\" target=\"_blank\">" + map.get("chapter_id") + "</a></td>");
                        String content = "" + map.get("content");
                        if (content.equals("view picture")) {
                            out.print("<td><a href=\"moreRegulation.jsp?chapter_id=" + map.get("chapter_id") + "\" target=\"_blank\">View Picture</a></td>");
                        } else {
                            int beginIndex = content.indexOf("...");
                            if (beginIndex == -1) {
                                out.print("<td>" + content + "</td>");
                            } else {
                                out.print("<td>" + content.substring(0, beginIndex) + "<a href=\"moreRegulation.jsp?chapter_id=" + map.get("chapter_id") + "\" target=\"_blank\">...</a></td>");
                            }
                        }
                        out.print("</tr>");
                    }
                %>
            </table>
        </center>
    </div>
</div>

<div>
    <br><br>
</div>

</body>
</html>