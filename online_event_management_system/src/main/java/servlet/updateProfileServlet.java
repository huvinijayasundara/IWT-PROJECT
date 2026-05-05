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

@WebServlet("/updateProfileServlet")
public class updateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address= request.getParameter("address");
		String username = request.getParameter("username");
		
		boolean isTrue;
		
		isTrue = userServices.updateUser(name, email, phone, address, username);
		
		if(isTrue == true) {
			
			List<user> userDetails = userServices.getDetails(username);
			request.setAttribute("userDetails", userDetails);
			
			String alertMessage = "Change user details successfully! Please loggin again !!!";
			response.getWriter().println("<script>alert('"+alertMessage+"');window.location.href='login.jsp';</script>");
		    //RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		    //dispatcher.forward(request, response);
		}
		else {
			
			RequestDispatcher dis = request.getRequestDispatcher("Wrong.jsp");
			dis.forward(request, response);
		}
		
	}

}
