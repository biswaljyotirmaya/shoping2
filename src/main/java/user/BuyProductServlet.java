package user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pack1.ProductBean;

@SuppressWarnings("serial")
@WebServlet("/buy")
public class BuyProductServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if (session == null) {
			req.setAttribute("msg", "Session expired!!");
			RequestDispatcher rd = req.getRequestDispatcher("userLogin.html");
			rd.forward(req, resp);
		} else {
			String pcode = req.getParameter("pcode");
			ArrayList<ProductBean> products = (ArrayList<ProductBean>) session.getAttribute("ProductList");
			ProductBean product = null;
			Iterator<ProductBean> i = products.iterator();
			while (i.hasNext()) {
				product = i.next();
				if (pcode.equals(product.getPcode())) {
					break;
				}
			}
			req.setAttribute("product", product);
			req.getRequestDispatcher("BuyProduct.jsp").forward(req, resp);
		}
	}
}
