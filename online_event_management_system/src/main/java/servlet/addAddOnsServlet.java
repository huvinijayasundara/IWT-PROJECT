package servlet;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.AddServiceDBUtil;
import service.ServicesDBUtil;
//import javax.servlet.http.HttpSession;

@WebServlet("/addAddOnsServlet")
public class addAddOnsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//catch itemId from the form
		String itemIdStr = request.getParameter("serviceId");
		
		//get userID from the session
		String uname = (String) request.getSession().getAttribute("username");
		
		if(itemIdStr != null && uname != null) {
			
			try {
				int itemId = Integer.parseInt(itemIdStr);
				
				//get supId from the function
				int supId = ServicesDBUtil.getSupplier(itemId);
				
				//insert in to table
				boolean isInserted = AddServiceDBUtil.insertAddService(itemId, uname, supId);
				
				if(isInserted) {
					response.sendRedirect("addons.jsp");
					
                } else {
                    response.getWriter().println("Failed to add service.");
				}
			} catch(Exception e){
				e.printStackTrace();
			}
			
		}
	}

}