package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.userEvent;
import service.userEventServices;

/**
 * Servlet implementation class updateEventServlet
 */
@WebServlet("/updateEventServlet")
public class updateEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		String type = request.getParameter("type");
		String date = request.getParameter("date");
		int guests = Integer.parseInt(request.getParameter("guests"));
		String location = request.getParameter("location");
		String theme = request.getParameter("theme");
		String services =request.getParameter("services");
		
        String uname = (String) request.getSession().getAttribute("username");
		
		boolean isTrue;
		isTrue = userEventServices.updateEvent(id,type, date, guests, location, theme, services, uname);
		
		if(isTrue==true) {
			
			List<userEvent>eventDetails =userEventServices.getOneEvent(id);
			request.setAttribute("eventDetails", eventDetails);
			
			String alertMessage = "Event details Updated";
			response.getWriter().println("<script>alert('"+alertMessage+"');window.location.href='getUserEventsServlet';</script>");
		}
		else {
			
			RequestDispatcher dis = request.getRequestDispatcher("Wrong.jsp");
			dis.forward(request, response);
		}
		
	}

}
