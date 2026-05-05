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
import model.userEvent;
import service.userEventServices;
import service.userServices;

@WebServlet("/deleteEventServlet")
public class deleteEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
        String id = request.getParameter("id");
		
		boolean isTrue;		
		isTrue = userEventServices.deleteEvent(id);
		
		if(isTrue == true) {
			
			String alertMessage = "Event deleted Successfully";
			response.getWriter().println("<script>alert('" + alertMessage +"');window.location.href='getUserEventsServlet'</script>");
			
		}
		else {
			
			List<userEvent> eventDetails = userEventServices.getOneEvent(id);
			request.setAttribute("eventDetails", eventDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("Wrong.jsp");
			dis.forward(request, response);
		}
	}

}
