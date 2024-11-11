package user;

import java.sql.Connection;
import java.sql.PreparedStatement;

import pack1.DBConnect;

public class AddUserDAO {
	public int addUser(UserBean user) {
		int rowcount = 0;
		try {
			Connection con = DBConnect.getCon();
			PreparedStatement ps = con.prepareStatement("insert into userdetails values(?,?,?,?,?,?,?)");
			ps.setString(1, user.getUname());
			ps.setString(2, user.getUpass());
			ps.setString(3, user.getUfname());
			ps.setString(4, user.getUlname());
			ps.setString(5, user.getUmail());
			ps.setString(6, user.getUadd());
			ps.setString(7, user.getUphone());

			rowcount = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rowcount;
	}
}
