package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import pack1.ProductBean;

public class ViewProductDAO {
	ArrayList<ProductBean> products = new ArrayList<ProductBean>();

	public ArrayList<ProductBean> retrieveProduct() {
		try {
			Connection con = DBConnect.getCon();
			PreparedStatement ps = con.prepareStatement("select * from productdetails");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProductBean product = new ProductBean();
				product.setPcode(rs.getString(1));
				product.setPname(rs.getString(2));
				product.setPcomp(rs.getString(3));
				product.setPrice(rs.getDouble(4));
				product.setPqnt(rs.getInt(5));
				products.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}
}
