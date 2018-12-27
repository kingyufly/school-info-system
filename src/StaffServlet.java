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

public class StaffServlet extends HttpServlet {
    public StaffServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DB db = new DB();
        ResultSet rs = null;
        HttpSession session = request.getSession();
        List<Map> regulationList = new ArrayList<Map>();
        List<Map> myCourseList = new ArrayList<Map>();
        List<Map> allCourseList = new ArrayList<Map>();

        String name = (String) session.getAttribute("name");

        try {
            String sql = "select * from regulations;";
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

            sql = "select course_id,course_name,student_number,time,classroom,class from course_data where teacher=\'" + name + "\';";
            rs = db.query(sql);
            while (rs.next()) {
                Map map = new HashMap();
                map.put("course_id", rs.getString("course_id"));
                map.put("course_name", rs.getString("course_name"));
                map.put("student_number", rs.getString("student_number"));
                map.put("time", rs.getString("time"));
                map.put("classroom", rs.getString("classroom"));
                map.put("classs", rs.getString("class"));
                myCourseList.add(map);
            }

            sql = "select course_id,course_name,semester,major_id from course_info;";
            rs = db.query(sql);
            while (rs.next()) {
                Map map = new HashMap();
                map.put("course_id", rs.getString("course_id"));
                map.put("course_name", rs.getString("course_name"));
                int semester = rs.getInt("semester");
                int major_id = rs.getInt("major_id");
                String major = null;

                switch (major_id) {
                    case 0: {
                        major = "Telecommunications Engineering with Management (No Stream)";
                        break;
                    }
                    case 1: {
                        if (semester <= 4)
                            major = "Telecommunications Engineering with Management (No Stream)";
                        else
                            major = "Telecommunications Engineering with Management (Communication Stream)";
                        break;
                    }
                    case 2: {
                        if (semester <= 4)
                            major = "Telecommunications Engineering with Management (No Stream)";
                        else
                            major = "Telecommunications Engineering with Management (Multimedia Stream)";
                        break;
                    }
                    case 3: {
                        major = "E-Commerce Engineering with Law";
                        break;
                    }
                    case 4: {
                        major = "Internet of Things Engineering";
                        break;
                    }
                }
                map.put("semester", semester);
                map.put("major", major);
                allCourseList.add(map);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        session.setAttribute("regulationList", regulationList);
        session.setAttribute("myCourseList", myCourseList);
        System.out.println("mycourselist" + myCourseList);
        session.setAttribute("allCourseList", allCourseList);
        response.sendRedirect("index_staff.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
