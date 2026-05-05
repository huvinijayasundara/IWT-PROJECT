package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Services;
import service.ServicesDBUtil;

@WebServlet("/UpdateServiceServlet")
public class UpdateServiceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        String serviceId = request.getParameter("serviceId");
        String title = request.getParameter("title");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");

        try {
            boolean isUpdated = ServicesDBUtil.updateServices(Integer.parseInt(serviceId), title, category, price, description);

            if (isUpdated) {
            	
                request.setAttribute("message", "Service updated successfully!");
                
            } else {
            	
                request.setAttribute("message", "Failed to update service.");
            }

            // Refresh the service list
            List<Services> serviceList = ServicesDBUtil.getServiceDetails(category);
            request.setAttribute("serviceList", serviceList);

            RequestDispatcher dis = request.getRequestDispatcher("manageService.jsp");
            dis.forward(request, response);
            
        } catch (Exception e) {
        	
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
