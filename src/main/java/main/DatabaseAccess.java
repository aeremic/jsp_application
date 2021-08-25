package main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import entities.User;
import entities.Phone;

public class DatabaseAccess extends Helper {

	public static boolean login(User user) {
		try {
			Connection connection = ConnectionProvider.getConnection();
			Statement statement = connection.createStatement();
			String query = "SELECT * FROM user WHERE username = '" + user.getUsername() + "' AND password = '"
					+ sha1(user.getPassword()) + "'";

			ResultSet res = statement.executeQuery(query);
			if (res.next())
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	public static boolean register(User user) {
		try {
			Connection connection = ConnectionProvider.getConnection();

			if (checkUsername(connection, user)) {
				String query = "INSERT INTO `user`(`username`, `password`, `role`, `firstname`, `lastname`, `address`) VALUES (?,?,?,?,?,?)";

				PreparedStatement preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, user.getUsername());
				preparedStatement.setString(2, sha1(user.getPassword()));
				preparedStatement.setString(3, "user");
				preparedStatement.setString(4, user.getFirstname());
				preparedStatement.setString(5, user.getLastname());
				preparedStatement.setString(6, user.getAddress());

				int res = preparedStatement.executeUpdate();
				System.out.println(res);
				if (res != 0)
					return true;

			} else
				return false;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	public static boolean isAdmin(User user) {
		try {
			Connection connection = ConnectionProvider.getConnection();
			Statement statement = connection.createStatement();
			String query = "SELECT * FROM user WHERE username = '" + user.getUsername() + "' AND password = '"
					+ sha1(user.getPassword()) + "' AND role = 'admin'";

			ResultSet res = statement.executeQuery(query);
			if (res.next())
				return true;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	public static int getId(User user) {
		try {
			Connection connection = ConnectionProvider.getConnection();
			Statement statement = connection.createStatement();
			String query = "SELECT * FROM user WHERE username = '" + user.getUsername() + "' AND password = '"
					+ sha1(user.getPassword()) + "'";

			ResultSet res = statement.executeQuery(query);
			if (res.next())
				return res.getInt("id");

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return -1;
	}

	public static List<Phone> getPhones() {
		List<Phone> phones = null;

		try {
			phones = new LinkedList<Phone>();
			Connection connection = ConnectionProvider.getConnection();
			Statement statement = connection.createStatement();
			String query = "SELECT * FROM phone";

			ResultSet res = statement.executeQuery(query);
			while (res.next()) {
				int id = res.getInt("id");
				String name = res.getString("name");
				String image = res.getString("image");
				String description = res.getString("description");
				double price = res.getDouble("price");

				Phone phone = new Phone(id, name, image, description, price);
				phones.add(phone);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return phones;
	}

	public static Phone getPhoneById(int id) {
		Phone phone = null;

		try {
			Connection connection = ConnectionProvider.getConnection();
			Statement statement = connection.createStatement();
			String query = "SELECT * FROM phone WHERE id = " + id;

			ResultSet res = statement.executeQuery(query);
			if (res.next()) {
				String name = res.getString("name");
				String image = res.getString("image");
				String description = res.getString("description");
				double price = res.getDouble("price");

				phone = new Phone(id, name, image, description, price);
			}

			return phone;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return phone;
	}

	public static int getAdminId() {
		try {
			Connection connection = ConnectionProvider.getConnection();
			Statement statement = connection.createStatement();
			String query = "SELECT * FROM user WHERE role = 'admin'";

			ResultSet res = statement.executeQuery(query);
			if (res.next())
				return res.getInt("id");
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return -1;
	}

	public static String getName(int id) {
		String firstlast = "";

		try {
			Connection connection = ConnectionProvider.getConnection();
			Statement statement = connection.createStatement();
			String query = "SELECT * FROM user WHERE ID = " + id;

			ResultSet res = statement.executeQuery(query);
			if (res.next()) {
				String firstname = res.getString("firstname");
				String lastname = res.getString("lastname");

				firstlast = firstname + " " + lastname;
			}

			return firstlast;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return firstlast;
	}

	public static boolean addPhone(String name, String image, String description, double price) {
		try {
			Connection connection = ConnectionProvider.getConnection();
			String query = "INSERT INTO `phone`(`name`, `image`, `description`, `price`) VALUES (?,?,?,?) ";

			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, image);
			preparedStatement.setString(3, description);
			preparedStatement.setDouble(4, price);

			int res = preparedStatement.executeUpdate();
			if (res != 0)
				return true;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	public static List<User> getUsers() {
		List<User> users = null;

		try {
			users = new LinkedList<User>();
			Connection connection = ConnectionProvider.getConnection();
			Statement statement = connection.createStatement();
			String query = "SELECT * FROM user";

			ResultSet res = statement.executeQuery(query);
			while (res.next()) {
				int id = res.getInt("id");
				String username = res.getString("username");
				String password = res.getString("password");
				String role = res.getString("role");
				String firstname = res.getString("firstname");
				String lastname = res.getString("lastname");
				String address = res.getString("address");

				User user = new User(id, username, password, role, firstname, lastname, address);
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return users;
	}

	public static boolean deletePhone(int id) {
		try {
			Connection connection = ConnectionProvider.getConnection();
			Statement statement = connection.createStatement();
			String query = "DELETE FROM phone WHERE id = " + id;

			int res = statement.executeUpdate(query);
			if (res != 0)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}
}
