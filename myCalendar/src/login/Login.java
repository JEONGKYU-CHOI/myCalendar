package login;

public class Login {
	private int number;
	private String name;
	private String id;
	private String password;
	private String phone;
	private String email;
	
	public Login() {}

	public Login(int number, String name, String id, String password, String phone, String email) {
		super();
		this.number = number;
		this.name = name;
		this.id = id;
		this.password = password;
		this.phone = phone;
		this.email = email;
	}
     
	public int getNumber() {
		return number;
	}
        
	public void setNumber(int number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Login [number=" + number + ", name=" + name + ", id=" + id + ", password=" + password + ", phone="
				+ phone + ", email=" + email + "]";
	}
	
	
}
