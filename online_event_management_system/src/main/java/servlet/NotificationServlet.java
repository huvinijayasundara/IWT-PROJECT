package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.AddServiceDBUtil;

@WebServlet("/NotificationServlet")
public class NotificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get supId
		HttpSession session = request.getSession();
        Integer supId = (Integer) session.getAttribute("supId"); 

        if (supId == null) {
            response.getWriter().println("Supplier ID not found in session.");
            return;
        }
        
        //get pending orders for this supplier
        List<Map<String, String>> pOrders = AddServiceDBUtil.getSupplierPendingOrders(supId);
        List<Map<String, String>> orderslist = new ArrayList<>();
       
        //Enrich each record with item title and user details
        for (Map<String, String> record : pOrders) {
        	
            int itemId = Integer.parseInt(record.get("itemId"));
            String username = record.get("userId");

            String itemTitle = AddServiceDBUtil.getItemTitle(itemId);
            Map<String, String> userDetails = AddServiceDBUtil.getUserDetails(username);

            Map<String, String> enriched = new HashMap<>();
            
            enriched.put("addserviceId", record.get("addserviceId"));
            enriched.put("itemTitle", itemTitle);
            enriched.put("userName", userDetails.get("name"));
            enriched.put("nic", userDetails.get("nic"));
            enriched.put("phone", userDetails.get("phone"));

            orderslist.add(enriched);
        }
        
        //forward to jsp
        request.setAttribute("pendingOrders", orderslist);
        request.getRequestDispatcher("notification.jsp").forward(request, response);
	}

}