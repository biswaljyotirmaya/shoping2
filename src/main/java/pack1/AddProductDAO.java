package pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddProductDAO {
	public int insertProduct(ProductBean pb) {
		int rowcount = 0;
		try {
			Connection con = DBConnect.getCon();

			String sql = "INSERT INTO productDetails VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, pb.getPcode());
			ps.setString(2, pb.getPname());
			ps.setString(3, pb.getPcomp());
			ps.setDouble(4, pb.getPrice());
			ps.setInt(5, pb.getPqnt());

			if (pb.getImage() != null) {
				ps.setBytes(6, pb.getImage());
			} else {
				ps.setNull(6, java.sql.Types.BLOB);
			}

			rowcount = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rowcount;
	}
}
