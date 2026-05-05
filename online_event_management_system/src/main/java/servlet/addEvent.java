package servlet;

import java.io.IOException;
import java.sql.Date;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Event;
import service.EventServices;


@WebServlet("/addEvent")
public class addEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public addEvent() {
        super();
    
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Event eventt = new Event(); //create object from model class Event
		
		
		
		eventt.setEventId(request.getParameter("eventId"));            //set  taken data in model class
		eventt.setEventName(request.getParameter("eventName"));
		eventt.setEventType(request.getParameter("eventType"));
		eventt.setClientName(request.getParameter("clientName"));
		eventt.setEmail(request.getParameter("email"));
		eventt.setPhone(request.getParameter("phone"));
		
		String dateStr = request.getParameter("eventDate");
		Date eventDate = java.sql.Date.valueOf(dateStr);
		eventt.setEventdate(eventDate);

		eventt.setSelPackage(request.getParameter("package"));
		String[] selectedServices = request.getParameterValues("services");
		String joinedServices = String.join(", ", selectedServices); // Combine selected services into one string
		eventt.setSelServices(joinedServices);
		eventt.setText(request.getParameter("notes"));
		eventt.setStatus(request.getParameter("status"));
		EventServices evOperations = new EventServices();     //create object from services class
		
		evOperations.insertData(eventt);            
		System.out.println("servlet");
		response.sendRedirect("showEvent");

	}

}
