package pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UpdateproductDAO {
	public int UpdateProductDetails(ProductBean pb) {
		int rowCount = 0;
		try {
			Connection con = DBConnect.getCon();
			PreparedStatement ps = con.prepareStatement("update productdetails set price=? , pqnt=? where pcode=?");
			ps.setDouble(1, pb.getPrice());
			ps.setInt(2, pb.getPqnt());
			ps.setString(3, pb.getPcode());

			rowCount = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rowCount;
	}
}