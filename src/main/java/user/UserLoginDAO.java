package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserLoginDAO {
	public UserBean checkUserLogin(String userName, String pass) {
		UserBean user = null;

		try {
			Connection con = DBConnect.getCon();
			PreparedStatement ps = con.prepareStatement("select * from userdetails where USERNAME=? and UPASS=?");
			ps.setString(1, userName);
			ps.setString(2, pass);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				user = new UserBean();
				user.setUname(rs.getString(1));
				user.setUpass(rs.getString(2));
				user.setUfname(rs.getString(3));
				user.setUlname(rs.getString(4));
				user.setUadd(rs.getString(5));
				user.setUmail(rs.getString(6));
				user.setUphone(rs.getString(7));
				System.out.println(user.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
}
