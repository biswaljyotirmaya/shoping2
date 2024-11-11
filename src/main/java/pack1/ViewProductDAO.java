package pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ViewProductDAO {
	ArrayList<ProductBean> products = new ArrayList<ProductBean>();

	public ArrayList<ProductBean> retrieveProduct() {
		try {
			Connection con = DBConnect.getCon();

			PreparedStatement ps = con.prepareStatement("SELECT * FROM productdetails");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ProductBean product = new ProductBean();

				product.setPcode(rs.getString(1));
				product.setPname(rs.getString(2));
				product.setPcomp(rs.getString(3));
				product.setPrice(rs.getDouble(4));
				product.setPqnt(rs.getInt(5));

				byte[] imageBytes = rs.getBytes("productImage");
				product.setImage(imageBytes);

				products.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}
}
