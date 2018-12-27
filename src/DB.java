import java.sql.*;

public class DB {
    private static final String url = "jdbc:mysql://123.56.8.117/school?useSSL=false";
    private static final String driver = "com.mysql.jdbc.Driver";
    private static final String user = "outeruser";
    private static final String password = "Abcd1234!";

    private Connection conn = null;

    public DB() {
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void close() {
        try {
            this.conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ResultSet query(String sql) throws SQLException {
        Statement stmt = conn.createStatement();
        return stmt.executeQuery(sql);
    }

    public ResultSet signIn(String username, String userType) throws SQLException {
        Statement stmt = conn.createStatement();
        String sql = "select password from user_" + userType + " where username=\'" + username + "\';";
        return stmt.executeQuery(sql);
    }

    public ResultSet getStudentData(String studentId) throws SQLException {
        Statement stmt = conn.createStatement();
        String sql = "select * from student_data where student_id=" + studentId + ";";
        return stmt.executeQuery(sql);
    }

    public ResultSet getUsername(String username, String userType) throws SQLException {
        Statement stmt = conn.createStatement();
        String sql = "select username from user_" + userType + " where username=\'" + username + "\';";
        return stmt.executeQuery(sql);
    }

    public ResultSet getName(String name, String userType) throws SQLException {
        Statement stmt = conn.createStatement();
        String sql = "select name from user_" + userType + " where name=\'" + name + "\';";
        return stmt.executeQuery(sql);
    }

    public void insertData(String sql) throws SQLException {
        Statement stmt = conn.createStatement();
        stmt.execute(sql);
    }

    public void signUp(String username, String password, String name, String student_id, String userType) throws SQLException {
        String sql = "";
        if (userType.equals("student")) {
            sql = "insert into user_student values(\'" + student_id + "\',\'" + username + "\',\'" + password + "\');";
            insertData(sql);
        } else {
            sql = "insert into user_" + userType + " values(\'" + name + "\',\'" + username + "\',\'" + password + "\');";
            insertData(sql);
        }
    }
}
