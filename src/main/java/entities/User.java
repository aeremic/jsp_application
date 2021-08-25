package entities;

public class User {
	private int id;
	private String username;
	private String password;
	private String role;
	private String firstname;
	private String lastname;
	private String address;

	public User() {
		super();
	}

	public User(int id, String username, String password, String role, String firstname, String lastname,
			String address) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.role = role;
		this.firstname = firstname;
		this.lastname = lastname;
		this.address = address;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
