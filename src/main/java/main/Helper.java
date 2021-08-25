package main;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import entities.User;

public class Helper {
	public static boolean checkUsername(Connection connection, User user) {
		boolean unique = true;
		try {
			Statement statement = connection.createStatement();
			String query = "SELECT * FROM user WHERE username = '" + user.getUsername() + "'";

			ResultSet res = statement.executeQuery(query);
			if (res.next())
				unique = false;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

		return unique;
	}
	
	public static String sha1(String input) {
        String sha1 = null;
        MessageDigest digest;
        try {
            digest = MessageDigest.getInstance("SHA-1");
            digest.reset();
            digest.update(input.getBytes("utf8"));
            sha1 = String.format("%040x", new BigInteger(1, digest.digest()));
        
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return sha1;
 
    }
}
