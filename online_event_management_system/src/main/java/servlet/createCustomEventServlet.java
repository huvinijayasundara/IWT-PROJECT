package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/createCustomEventServlet")
public class createCustomEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String type = request.getParameter("type");
		String date = request.getParameter("date");
		int guests = Integer.parseInt(request.getParameter("guests"));
		String location = request.getParameter("location");
		String theme = request.getParameter("theme");
		String services =request.getParameter("services");
		
        String uname = (String) request.getSession().getAttribute("username");
		
		
		
        boolean isTrue;
		
		isTrue = service.userEventServices.insertEvent(type, date, guests, location, theme, services, uname);
		
		if(isTrue == true) {
			
			String alertMessege = "Create Event successfull";
			response.getWriter().println("<script> alert('"+alertMessege+"');window.location.href = 'getUserEventsServlet'</script>");
		}
		else {
			
			RequestDispatcher dis = request.getRequestDispatcher("Wrong.jsp");
			dis.forward(request, response);
		}
	}

}
