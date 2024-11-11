package pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class DeleteProductDAO {
	public int DeleteProductDetails(ProductBean pb) {
		int rowCount = 0;
		try {
			Connection con = DBConnect.getCon();
			PreparedStatement ps = con.prepareStatement("delete from productdetails where pcode=?");
			ps.setString(1, pb.getPcode());

			rowCount = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rowCount;
	}
}