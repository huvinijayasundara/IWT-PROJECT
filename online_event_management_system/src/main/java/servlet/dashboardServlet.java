package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.suggestions;
import model.user;
import model.userEvent;
import service.suggestionService;
import service.userEventServices;
import service.userServices;

@WebServlet("/dashboardServlet")
public class dashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

         String uname = (String) request.getSession().getAttribute("username");
        
        if (uname == null) {
            response.sendRedirect("login.jsp"); // Redirect if not logged in
            return;
        }
        
        // 1. Fetch User Details from Database (not session)
        List<user> user = userServices.getDetails(uname); // Use your user service
        request.setAttribute("user", user);
        
        // 2. Fetch Events
        List<userEvent> allEvents = userEventServices.getAllEvents(uname);
        request.setAttribute("allEvents", allEvents);
        
        //fetch suggestions
        List<suggestions> suggest = suggestionService.getSuggestions(uname);
        request.setAttribute("suggestions", suggest);
        
        // Forward to JSP
        RequestDispatcher dis = request.getRequestDispatcher("userDashboard.jsp");
        dis.forward(request, response);
        
        
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
