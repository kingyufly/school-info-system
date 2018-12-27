import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SignupServlet extends HttpServlet{
    public SignupServlet(){
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        DB db = new DB();
        ResultSet rs = null;
        HttpSession session = request.getSession();

        String userType = request.getParameter("userType");
        if (userType.equals("student")){
            String studentId = request.getParameter("studentId");
            String studentName = request.getParameter("studentName");
            String gender = request.getParameter("gender");
            int semester = Integer.parseInt(request.getParameter("semester"));
            int major = Integer.parseInt(request.getParameter("major"));
            String telephone = request.getParameter("telephone");
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            Student recordedStudent = new Student(studentId, studentName, gender, telephone, major, semester);
            try {
                rs = db.getStudentData(studentId);
                if(rs.next()){ // There is a result
                    Student requestStudent = new Student(rs.getString("student_id"), rs.getString("name"), rs.getString("gender"), rs.getString("telephone"), rs.getInt("major"), rs.getInt("semester"));
                    if (requestStudent.toString().equals(recordedStudent.toString())){ // The student pass the id check
                        rs = db.getUsername(username, userType);
                        if(!rs.next()){
                            db.signUp(username, password, "", studentId, userType);
                            response.sendRedirect("signin.jsp");
                        }else { // Duplicate username
                            session.setAttribute("error", "1");
                            response.sendRedirect("signup.jsp");
                        }
                    } else { // failed
                        session.setAttribute("error", "2");
                        response.sendRedirect("signup.jsp");
                    }
                }else{ // No result (No such student id)
                    session.setAttribute("error", "2");
                    response.sendRedirect("signup.jsp");
            }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else{
            String name = request.getParameter("name");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            try {
                rs = db.getUsername(username, userType);
                if(!rs.next()){
                    rs = db.getName(name, userType);
                    if(!rs.next()){
                        //db.signIn(username, password,name, "", userType);
                    }else{
                        // duplicate name(already registed)
                    }
                }else { // Duplicate username
                    // to be updated
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        doGet(request, response);
    }
}
