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


public class IndexServlet extends HttpServlet {
    public IndexServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DB db = new DB();
        ResultSet rs = null;
        HttpSession session = request.getSession();
        List<Map> list = new ArrayList<Map>();

        try {
            String sql = "select * from regulations;";
            rs = db.query(sql);
            while (rs.next()) {
                String chapter_id = rs.getString("chapter_id");
                String subchapter_id = rs.getString("subchapter_id");
                String content = rs.getString("content");
                //获取用循环接收数据库的表格信息

                Map map = new HashMap();
                if (subchapter_id.equals("0")) {
                    map.put("chapter_id", chapter_id);
                } else {
                    map.put("chapter_id", chapter_id + "." + subchapter_id);
                }
                if (content.indexOf(".jpg") != -1 || content.indexOf(".JPG") != -1 || content.indexOf(".png") != -1 || content.indexOf(".PNG") != -1)
                    map.put("content", "view picture");
                else {
                    if (content.length() < 100)
                        map.put("content", content);
                    else
                        map.put("content", content.substring(0, 100) + "...");
                }
                list.add(map);
                for (Map map_1 : list) {
                    System.out.println(map_1);
                }
            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        session.setAttribute("regulationList", list);
        response.sendRedirect("index.jsp");
        //request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
