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

public class AuditorServlet extends HttpServlet {
    public AuditorServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DB db = new DB();
        ResultSet rs = null;
        HttpSession session = request.getSession();
        List<Map> regulationList = new ArrayList<Map>();
        List<Map> courseList = new ArrayList<Map>();
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

        String name = (String) session.getAttribute("name");

        try {
            sql = "select * from regulations;";
            rs = db.query(sql);
            while (rs.next()) {
                Map map = new HashMap();
                if (rs.getString("subchapter_id").equals("0")) {
                    map.put("chapter_id", rs.getString("chapter_id"));
                } else {
                    map.put("chapter_id", rs.getString("chapter_id") + "." + rs.getString("subchapter_id"));
                }

                map.put("content", rs.getString("content"));
                regulationList.add(map);
            }


            sql = "select course_id,course_name,major_id,semester,student_number,time,classroom,teacher,class from course_data;";
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
                map.put("teacher", rs.getString("teacher"));
                map.put("classs", rs.getString("class"));
                courseList.add(map);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        session.setAttribute("regulationList", regulationList);
        session.setAttribute("courseList", courseList);
        response.sendRedirect("index_auditor.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
