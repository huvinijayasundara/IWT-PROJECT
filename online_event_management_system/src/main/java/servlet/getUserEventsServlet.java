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

@WebServlet("/getUserEventsServlet")
public class getUserEventsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public getUserEventsServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uname = (String) request.getSession().getAttribute("username");
		
		List<userEvent> allEvents = userEventServices.getAllEvents(uname);
		request.setAttribute("allEvents", allEvents);
		
		RequestDispatcher dis = request.getRequestDispatcher("userDashboard.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
