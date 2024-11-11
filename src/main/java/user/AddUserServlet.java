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
@WebServlet("/ureg")
public class AddUserServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if (session == null) {
			req.setAttribute("msg", "Session expired!!");
			RequestDispatcher rd = req.getRequestDispatcher("userLogin.html");
			rd.forward(req, resp);
		} else {
			UserBean user = new UserBean();
			user.setUname(req.getParameter("uname"));
			user.setUpass(req.getParameter("upass"));
			user.setUfname(req.getParameter("ufname"));
			user.setUlname(req.getParameter("ulname"));
			user.setUmail(req.getParameter("umail"));
			user.setUadd(req.getParameter("uadd"));
			user.setUphone(req.getParameter("uphone"));

			int rowCount = new AddUserDAO().addUser(user);
			if (rowCount > 0) {
				System.out.println("User Added successfully!");
				req.setAttribute("userAdded", true);
				req.setAttribute("msg", "User added successfully!!");
				req.getRequestDispatcher("userLogin.html").forward(req, resp);
			} else {
				System.out.println("Failed to add user!");
				req.setAttribute("userAdded", false);
			}
//			RequestDispatcher rd=req.getRequestDispatcher("AdminHome.jsp");
//			rd.forward(req, resp);
		}
	}
}
