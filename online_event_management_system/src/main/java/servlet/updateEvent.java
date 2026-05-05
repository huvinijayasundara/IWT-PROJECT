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


@WebServlet("/updateEvent")
public class updateEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public updateEvent() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Event ev = new Event();

        ev.setEventId(request.getParameter("eventId"));
        ev.setEventName(request.getParameter("eventName"));
        ev.setEventType(request.getParameter("eventType"));
        ev.setClientName(request.getParameter("clientName"));

        ev.setEmail(request.getParameter("email"));
        ev.setPhone(request.getParameter("phone"));
        
        String dateStr = request.getParameter("eventDate");
        Date eventDate = Date.valueOf(dateStr);
        ev.setEventdate(eventDate);

        ev.setSelPackage(request.getParameter("package"));

        // Handle multiple checkboxes
        String[] services = request.getParameterValues("services");
        if (services != null) {
            ev.setSelServices(String.join(",", services));
        } else {
            ev.setSelServices(""); // no services selected
        }

        ev.setText(request.getParameter("notes"));
        ev.setStatus(request.getParameter("status"));

        EventServices service = new EventServices();
        service.updateEvent(ev);

        response.sendRedirect("showEvent"); // Redirect to event list
	}

}
