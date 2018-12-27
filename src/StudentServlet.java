import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class StudentServlet extends HttpServlet {
    public StudentServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DB db = new DB();
        ResultSet rs = null;
        HttpSession session = request.getSession();
        List<Map> regulationList = new ArrayList<Map>();
        List<Map> courseList = new ArrayList<Map>();

        String major = (String) session.getAttribute("major");
        String semester = (String) session.getAttribute("semester");

        try {
            String sql = "select * from regulations;";
            rs = db.query(sql);
            while (rs.next()) {
                String chapter_id = rs.getString("chapter_id");
                String subchapter_id = rs.getString("subchapter_id");
                String content = rs.getString("content");

                Map map = new HashMap();
                if (subchapter_id.equals("0")) {
                    map.put("chapter_id", chapter_id);
                } else {
                    map.put("chapter_id", chapter_id + "." + subchapter_id);
                }

                map.put("content", content);
                regulationList.add(map);
            }

            session.setAttribute("regulation_list", regulationList);

            sql = "select course_id,course_name,time,classroom from course_data where major_id=" + major + " and semester <=" + semester + ";";
            rs = db.query(sql);
            while (rs.next()) {
                String course_id = rs.getString("course_id");
                String course_name = rs.getString("course_name");
                String time = rs.getString("time");
                String classroom = rs.getString("classroom");

                Map map = new HashMap();
                map.put("course_id", course_id);
                map.put("course_name", course_name);
                map.put("time", time);
                map.put("classroom", classroom);
                courseList.add(map);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        session.setAttribute("regulationList", regulationList);
        session.setAttribute("courseList", courseList);
        response.sendRedirect("index_student.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
