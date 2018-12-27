import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AddUserServlet {
    public AddUserServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");

        DB db = new DB();
        ResultSet rs = null;
        HttpSession session = request.getSession();
        try {
            rs = db.signIn(username, userType);
            if (rs.next()) {
                if (password.equals(rs.getString("password"))) {
                    if (userType.equals("student")) {
                        String sql = "select student_id from user_student where username=\'" + username + "\';";
                        rs = db.query(sql);
                        rs.next();
                        sql = "select name,major,semester from student_data where student_id=\'" + rs.getString("student_id") + "\';";
                        rs = db.query(sql);
                        rs.next();
                        session.setAttribute("userType", userType);
                        session.setAttribute("name", rs.getString("name"));
                        session.setAttribute("major", rs.getString("major"));
                        session.setAttribute("semester", rs.getString("semester"));
                        response.sendRedirect("/StudentServlet");
                    } else if (userType.equals("staff")) {
                        String sql = "select name from user_staff where username=\'" + username + "\';";
                        rs = db.query(sql);
                        rs.next();
                        session.setAttribute("userType", userType);
                        session.setAttribute("name", rs.getString("name"));
                        response.sendRedirect("/StaffServlet");
                    } else if (userType.equals("admin")) {
                        String sql = "select name from user_admin where username=\'" + username + "\';";
                        rs = db.query(sql);
                        rs.next();
                        session.setAttribute("userType", userType);
                        session.setAttribute("name", rs.getString("name"));
                        response.sendRedirect("/AdminServlet");
                    } else if (userType.equals("auditor")) {
                        String sql = "select name from user_auditor where username=\'" + username + "\';";
                        rs = db.query(sql);
                        rs.next();
                        session.setAttribute("userType", userType);
                        session.setAttribute("name", rs.getString("name"));
                        response.sendRedirect("/AuditorServlet");
                    }


                } else {
                    // Error: Login failed, please check the username or password
                    session.setAttribute("error", "true");
                    response.sendRedirect("signin.jsp");
                }
            } else {
                // Error: Login failed, please check the username or password
                session.setAttribute("error", "true");
                response.sendRedirect("signin.jsp");
            }
        } catch (SQLException e) {
            // Error: Login failed, please check the username or password
            session.setAttribute("error", "true");
            response.sendRedirect("signin.jsp");
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
