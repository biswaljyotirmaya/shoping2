package user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pack1.ProductBean;

@SuppressWarnings("serial")
@WebServlet("/buyproduct")
public class UpdateProductServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if (session == null) {
			req.setAttribute("msg", "Session expired!");
			resp.sendRedirect("userLogin.html");
		} else {
			String pcode = req.getParameter("pcode");
			String quantity = req.getParameter("rqnt");
			ArrayList<ProductBean> products = (ArrayList<ProductBean>) session.getAttribute("ProductList");
			ProductBean product = null;
			Iterator<ProductBean> i = products.iterator();
			while (i.hasNext()) {
				product = i.next();
				if (pcode.equals(product.getPcode())) {
					break;
				}
			}

			product.setPqnt(product.getPqnt() - Integer.parseInt(quantity));

			int rowCount = new UpdateproductDAO().UpdateProductDetails(product);

			if (rowCount > 0) {
				Double totalPrice = product.getPrice() * Integer.parseInt(quantity);
				req.setAttribute("total", totalPrice);
				req.getRequestDispatcher("OrderConfirmed.jsp").forward(req, resp);
			}
		}
	}
}
