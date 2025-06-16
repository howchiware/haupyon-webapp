package ch10.user;

public class User {

	private String name;
	private int age;
	private String tel;
	private String subject;
	
	public User() {
		
	}
	
	public User(String name, int age, String tel, String subject) {
		this.name = name;
		this.age = age;
		this.tel = tel;
		this.subject = subject;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

}
