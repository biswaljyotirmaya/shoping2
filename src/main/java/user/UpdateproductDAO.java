package user;

import java.sql.Connection;
import java.sql.PreparedStatement;

import pack1.ProductBean;

public class UpdateproductDAO {
	public int UpdateProductDetails(ProductBean pb) {
		int rowCount = 0;
		try {
			Connection con = DBConnect.getCon();
			PreparedStatement ps = con.prepareStatement("update productdetails set pqnt=? where pcode=?");
			ps.setInt(1, pb.getPqnt());
			ps.setString(2, pb.getPcode());

			rowCount = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rowCount;
	}
}