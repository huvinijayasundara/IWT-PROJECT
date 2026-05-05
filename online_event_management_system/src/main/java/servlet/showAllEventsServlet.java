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

@WebServlet("/showAllEventsServlet")
public class showAllEventsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public showAllEventsServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 doPost(request, response); 
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<userEvent> totEvents = userEventServices.getTotalEvents();
        request.setAttribute("totEvents", totEvents);
        
        if(!totEvents.isEmpty()) {
        	
        	request.setAttribute("totEvents", totEvents);
        	RequestDispatcher dis = request.getRequestDispatcher("addSuggestions.jsp");
     	    dis.forward(request, response);
        	
        }
        
        
	}

}
