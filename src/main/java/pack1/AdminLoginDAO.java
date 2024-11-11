package pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminLoginDAO {
	public AdminBean CheckAdminLogin(String username, String pass) {
		AdminBean abean = null;
		try {
			Connection con = DBConnect.getCon();
			PreparedStatement ps = con.prepareStatement("Select * from admindetails where AUNAME=? and APASS=?");
			ps.setString(1, username);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				abean = new AdminBean();
				abean.setAname(rs.getString(1));
				abean.setApass(rs.getString(2));
				abean.setAfname(rs.getString(3));
				abean.setAlname(rs.getString(4));
				abean.setAmail(rs.getString(5));
				abean.setAdddress(rs.getString(6));
				abean.setApass(rs.getString(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return abean;
	}
}
