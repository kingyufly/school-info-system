public class Student {
    private String studentId;
    private String name;
    private String gender;
    private String telephone;
    private int major;
    private int semester;

    public Student() {
    }

    public Student(String studentId, String name, String gender, String telephone, int major, int semester) {
        this.studentId = studentId;
        this.name = name;
        this.gender = gender;
        this.telephone = telephone;
        this.major = major;
        this.semester = semester;
    }

    public String getStudent_id() {
        return studentId;
    }

    public void setStudent_id(String student_id) {
        this.studentId = student_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public int getMajor() {
        return major;
    }

    public void setMajor(int major) {
        this.major = major;
    }

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }

    public String toString() {
        return this.studentId + this.name + this.gender + this.telephone + this.major + this.semester;
    }
}
