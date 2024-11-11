package user;

import java.sql.Connection;
import java.sql.PreparedStatement;

import pack1.ProductBean;

public class BuyProductDAO {
	public int DeleteProductDetails(ProductBean pb) {
		int rowCount = 0;
		try {
			Connection con = DBConnect.getCon();
			PreparedStatement ps = con.prepareStatement("select * from productdetails where pcode=?");
			ps.setString(1, pb.getPcode());

			rowCount = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rowCount;
	}
}