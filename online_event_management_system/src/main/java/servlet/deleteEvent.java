package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.EventServices;


@WebServlet("/deleteEvent")
public class deleteEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public deleteEvent() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		EventServices evService = new EventServices();
		
		evService.deleteData(request.getParameter("eventId"));
		System.out.println("✅ Deletion requested for order ID: " + request.getParameter("orderID"));
		
		request.getRequestDispatcher("showEvent").forward(request, response);
		
		doGet(request, response);
	}

}
