package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Services;
import service.ServicesDBUtil;


@WebServlet("/DeleteServiceServlet")
public class DeleteServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String serviceId = request.getParameter("serviceId");
		String category = request.getParameter("category");
		
		try {
			boolean isDeleted = ServicesDBUtil.deleteService(Integer.parseInt(serviceId));
			
			if(isDeleted) {
				request.setAttribute("message", "Service delted Succcessfully!");
			}else {
				request.setAttribute("message", "Falied to delete service!");
			}
			
			
			//Refresh service list
			List<Services> serviceList = ServicesDBUtil.getServiceDetails(category);
			request.setAttribute("serviceList", serviceList);
			
			RequestDispatcher dis = request.getRequestDispatcher("manageService.jsp");
			dis.forward(request, response);	
			
		} catch(Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error : " + e.getMessage());
		}
	}

}
