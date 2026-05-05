package servlet;

import java.io.IOException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Services;
import service.ServicesDBUtil;

@WebServlet("/ManageServicesServlet")
public class ManageServicesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String serviceId = request.getParameter("serviceId");
		String category = request.getParameter("category");

		try {
			// Case 1: Category selected, but no serviceId -> show service list
			if (serviceId == null || serviceId.isEmpty()) {
				
				if (category != null && !category.isEmpty()) {
					
					List<Services> serviceList = ServicesDBUtil.getServiceDetails(category);
					request.setAttribute("serviceList", serviceList);
				}
				
				RequestDispatcher dis = request.getRequestDispatcher("manageService.jsp");
				dis.forward(request, response);
				return;
			}

			// Case 2: serviceId is selected -> load full details
			List<Map<String, String>> serviceData = ServicesDBUtil.getServiceById(Integer.parseInt(serviceId));
				
			if (!serviceData.isEmpty()) {
				
				request.setAttribute("serviceData", serviceData.get(0));
				request.setAttribute("category", category); 
				
				RequestDispatcher dis = request.getRequestDispatcher("manageService.jsp");
				dis.forward(request, response);
				
			} else {
				
				response.getWriter().println("Service Not Found!");
			}

		} catch (Exception e) {
			
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
	}
}
