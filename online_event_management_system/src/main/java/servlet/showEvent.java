package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Event;
import service.EventServices;


@WebServlet("/showEvent")
public class showEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public showEvent() {
        super();
       
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Event> evenData = EventServices.showData();

        System.out.println("====== SHOW EVENT SERVLET ======");
        System.out.println("Fetched events: " + evenData.size());
        for (Event ev : evenData) {
            System.out.println(ev.getEventId() + " | " + ev.getEventName());
        }

        request.setAttribute("allEventData", evenData);
        request.getRequestDispatcher("add-event.jsp").forward(request, response);
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
