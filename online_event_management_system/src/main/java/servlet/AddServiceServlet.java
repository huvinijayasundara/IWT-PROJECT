package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Admin;
import service.AdminDBUtil;
import service.ServicesDBUtil;

@WebServlet("/insertService")

@MultipartConfig
public class AddServiceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Retrieve form values
        String title = request.getParameter("title");
        String category = request.getParameter("category");
        String description = request.getParameter("description");

        double price;
        
        // Convert price string to double safely
        try {
            price = Double.parseDouble(request.getParameter("price"));
        } catch (NumberFormatException e) {
        	
            response.setContentType("text/html");
            response.getWriter().println("<h2 style='color:red;'>Invalid price input. Must be a number like 5000.00</h2>");
            return;
        }
        
        // Retrieve Supplier ID from session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminId") == null) {
        	
            response.setContentType("text/html");
            response.getWriter().println("<h2 style='color:red;'>Session expired! Please log in again.</h2>");
            return;
        }

        int supId = (int) session.getAttribute("adminId");
        
        
        // Insert to DB
        boolean isTrue = ServicesDBUtil.insertService(title, category, price, description, supId);

        if (isTrue) {
        	
            // Fetch supplier details again using supplier ID
            List<Admin> supDetails = AdminDBUtil.getSupplierDetailsById(supId);
            request.setAttribute("supDetails", supDetails);

            RequestDispatcher dis = request.getRequestDispatcher("supplieraccount.jsp");
            dis.forward(request, response);
            
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
            dis2.forward(request, response);
        }
    }
}