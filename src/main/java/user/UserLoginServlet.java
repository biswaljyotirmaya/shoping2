package user;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/ulog")
public class UserLoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("uname");
		String password = req.getParameter("upass");

			UserBean ubean = new UserLoginDAO().checkUserLogin(username, password);

			if (ubean == null) {
				System.out.println("Invalid login details");
				req.setAttribute("msg", "Invalid user credential!");
				RequestDispatcher rd = req.getRequestDispatcher("userLogin.html");
				rd.forward(req, resp);
			} else {
				System.out.println("User Logged in");
				HttpSession session = req.getSession();
				session.setAttribute("ubean", ubean);
				RequestDispatcher rd = req.getRequestDispatcher("CustomerHome.jsp");
				rd.forward(req, resp);
			}

	}
}
