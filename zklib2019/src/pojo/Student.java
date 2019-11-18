package pojo;

public class Student {
	private String sid;
	private String spwd;
	private String sname;
	private String age;
	private String gender;
	private String lesson;
	private String department;
	private String permitted;

	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Student(String sid, String spwd, String sname, String age, String gender, String lesson, String department,
			String permitted) {
		super();
		this.sid = sid;
		this.spwd = spwd;
		this.sname = sname;
		this.age = age;
		this.gender = gender;
		this.lesson = lesson;
		this.department = department;
		this.permitted = permitted;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getSpwd() {
		return spwd;
	}

	public void setSpwd(String spwd) {
		this.spwd = spwd;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getLesson() {
		return lesson;
	}

	public void setLesson(String lesson) {
		this.lesson = lesson;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getPermitted() {
		return permitted;
	}

	public void setPermitted(String permitted) {
		this.permitted = permitted;
	}

}
