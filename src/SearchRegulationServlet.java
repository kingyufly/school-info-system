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


public class SearchRegulationServlet extends HttpServlet {
    public SearchRegulationServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DB db = new DB();
        ResultSet rs = null;
        HttpSession session = request.getSession();
        List<Map> list = new ArrayList<Map>();
        String words = request.getParameter("words");

        try {
            String sql = "select chapter_id from regulations where subchapter_id=0 and content like \'%" + words + "%\';";
            System.out.println(sql);
            rs = db.query(sql);
            while (rs.next()) {
                int chapter_id = rs.getInt("chapter_id");
                sql = "select * from regulations where chapter_id=" + chapter_id + ";";
                System.out.println(sql);
                ResultSet tmpSet = db.query(sql);
                while (tmpSet.next()) {
                    String chapter_id_tmp = "" + tmpSet.getInt("chapter_id");
                    String subchapter_id_tmp = "" + tmpSet.getInt("subchapter_id");
                    String content_tmp = tmpSet.getString("content");
                    System.out.println(chapter_id_tmp + ", " + subchapter_id_tmp + ", " + content_tmp);
                    Map map = new HashMap();
                    if (subchapter_id_tmp.equals("0")) {
                        map.put("chapter_id", chapter_id_tmp);
                    } else {
                        map.put("chapter_id", chapter_id_tmp + "." + subchapter_id_tmp);
                    }

                    map.put("content", content_tmp);
                    list.add(map);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        session.setAttribute("searchRegulationList", list);
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
