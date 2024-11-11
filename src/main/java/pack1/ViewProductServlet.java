package pack1;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/view")
public class ViewProductServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if (session == null) {
			req.setAttribute("msg", "Session expired!!");
			RequestDispatcher rd = req.getRequestDispatcher("adminLogin.html");
			rd.forward(req, resp);
		} else {
			ArrayList<ProductBean> products = new ArrayList<ProductBean>();
			products = new ViewProductDAO().retrieveProduct();
			session.setAttribute("ProductList", products);
			req.getRequestDispatcher("ViewProduct.jsp").forward(req, resp);
		}
	}
}
