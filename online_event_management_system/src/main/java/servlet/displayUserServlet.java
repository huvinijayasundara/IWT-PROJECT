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

@WebServlet("/displayUserServlet")
public class displayUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public displayUserServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    processRequest(request, response);}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		processRequest(request, response);
	}
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		//retrive user information from sessiom
		
		user user = (user) request.getSession().getAttribute("user");
		
		if(user != null) {
			
			//forward user data to userdashboard
			request.setAttribute("user", user);
			request.getRequestDispatcher("userDashboard.jsp").forward(request, response);
		}
		else {
			
			//handle case where user is not logged in
			response.sendRedirect("login.jsp");
		}
		
	}

}
