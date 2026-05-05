package servlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.EventServices;


@WebServlet("/plannerDashboardServlet")
public class plannerDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public plannerDashboardServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ResultSet events = EventServices.showUpcommingData();
		
		System.out.println("servlet "+ events);
		
		request.setAttribute("upcommingCount", events);
		request.getRequestDispatcher("dashboard.jsp").forward(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
