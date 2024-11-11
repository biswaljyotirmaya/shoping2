package pack1;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/alog")
public class AdminLoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AdminBean abean = new AdminLoginDAO().CheckAdminLogin(req.getParameter("aname"), req.getParameter("apass"));
		if (abean == null) {
			System.out.println("Invalid login details");
			req.setAttribute("msg", "Invalid admin credential!");
			RequestDispatcher rd = req.getRequestDispatcher("adminLogin.html");
			rd.forward(req, resp);
		} else {
			System.out.println("Logged in");
			HttpSession session = req.getSession();
			session.setAttribute("abean", abean);
			RequestDispatcher rd = req.getRequestDispatcher("AddProduct.jsp");
			rd.forward(req, resp);
		}
	}
}
