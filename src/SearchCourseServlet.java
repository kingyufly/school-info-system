import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class SearchCourseServlet extends HttpServlet {
    public SearchCourseServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DB db = new DB();
        ResultSet rs = null;
        HttpSession session = request.getSession();
        List<Map> list = new ArrayList<Map>();
        String words = request.getParameter("words");
        String userType = (String) session.getAttribute("userType");
        String[] majorName = new String[5];

        String sql = "select name from major_data";
        try {
            rs = db.query(sql);
            for (int i = 0; i < 5; i++) {
                rs.next();
                majorName[i] = rs.getString("name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        if (userType.equals("student")) {
            String major = (String) session.getAttribute("major");
            String semester = (String) session.getAttribute("semester");

            try {
                sql = "select course_id,course_name,time,classroom from course_data where major_id=" + major + " and semester<" + semester + " and (course_name like \'%" + words + "%\' or course_id like \'%" + words + "%\');";
                System.out.println(sql);
                rs = db.query(sql);
                while (rs.next()) {
                    Map map = new HashMap();
                    map.put("course_id", rs.getString("course_id"));
                    map.put("course_name", rs.getString("course_name"));
                    map.put("time", rs.getString("time"));
                    map.put("classroom", rs.getString("classroom"));
                    list.add(map);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (userType.equals("staff")) {
            String name = (String) session.getAttribute("name");

            try {
                sql = "select course_id,course_name,student_number,time,classroom,class from course_data where teacher=\'" + name + "\' and (course_name like \'%" + words + "%\' or course_id like \'%" + words + "%\');";
                System.out.println(sql);
                rs = db.query(sql);
                while (rs.next()) {
                    Map map = new HashMap();
                    map.put("course_id", rs.getString("course_id"));
                    map.put("course_name", rs.getString("course_name"));
                    map.put("student_number", rs.getString("student_number"));
                    map.put("time", rs.getString("time"));
                    map.put("classroom", rs.getString("classroom"));
                    map.put("classs", rs.getString("class"));
                    list.add(map);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            try {
                sql = "select course_id,course_name,major_id,semester,student_number,time,classroom,teacher,class from course_data where course_name like \'%" + words + "%\' or course_id like \'%" + words + "%\';";
                System.out.println(sql);
                rs = db.query(sql);
                while (rs.next()) {
                    Map map = new HashMap();
                    map.put("course_id", rs.getString("course_id"));
                    map.put("course_name", rs.getString("course_name"));
                    map.put("major", majorName[rs.getInt("major_id")]);
                    map.put("semester", rs.getString("semester"));
                    map.put("student_number", rs.getString("student_number"));
                    map.put("time", rs.getString("time"));
                    map.put("classroom", rs.getString("classroom"));
                    map.put("classs", rs.getString("class"));
                    map.put("teacher", rs.getString("teacher"));
                    list.add(map);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        session.setAttribute("searchCourseList", list);
        if (session.getAttribute("userType") != null) {
            if (session.getAttribute("userType").equals("student")) {
                response.sendRedirect("index_student.jsp");
            } else if (session.getAttribute("userType").equals("staff")) {
                response.sendRedirect("index_staff.jsp");
            } else if (session.getAttribute("userType").equals("admin")) {
                response.sendRedirect("index_admin.jsp");
            } else if (session.getAttribute("userType").equals("auditor")) {
                response.sendRedirect("index_auditor.jsp");
            } else
                response.sendRedirect("index.jsp");
        } else response.sendRedirect("index.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
