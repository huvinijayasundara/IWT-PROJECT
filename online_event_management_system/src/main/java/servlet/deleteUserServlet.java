package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.user;
import service.userServices;

@WebServlet("/deleteUserServlet")
public class deleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username = request.getParameter("username");
		
		boolean isTrue;		
		isTrue = userServices.deleteUser(username);
		
		if(isTrue == true) {
			
			String alertMessage = "Account deleted Successfully";
			response.getWriter().println("<script>alert('" + alertMessage +"');window.location.href='login.jsp'</script>");
			
		}
		else {
			
			List<user> userDetails = userServices.getDetails(username);
			request.setAttribute("userDetails", userDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("Wrong.jsp");
			dis.forward(request, response);
		}
		
		
		
	}

}
