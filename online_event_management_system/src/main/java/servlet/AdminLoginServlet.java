package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Admin;
import service.AdminDBUtil;


@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        String userName = request.getParameter("uid");
        String password = request.getParameter("pwd");
        String role = request.getParameter("role");
        
        List<Admin> isTrue = AdminDBUtil.validate(userName, password, role);

        
        if (!isTrue.isEmpty()) {
        	
        	if (role.equals("admin")) {
        	    request.setAttribute("adDetails", isTrue);  
        	    RequestDispatcher dis = request.getRequestDispatcher("AdminDashboard.jsp");
        	    dis.forward(request, response);
        	} else if (role.equals("supplier")) {

        		Admin loggedInAdmin = isTrue.get(0); // Get the first matched user

                // Create a session and store the administrator ID
                HttpSession session = request.getSession();
                session.setAttribute("adminId", loggedInAdmin.getSupId()); // Store supplier ID in session
        		
        	    request.setAttribute("supDetails", isTrue);  
        	    RequestDispatcher dis = request.getRequestDispatcher("supplieraccount.jsp");
        	    dis.forward(request, response);
        	    
        	    
        	} else if (role.equals("eventPlanner")) {
        		
        		request.getSession().setAttribute("uName", userName);
        	    request.setAttribute("plnDetails", isTrue);  
        	    RequestDispatcher dis = request.getRequestDispatcher("dashboard.jsp");
        	    dis.forward(request, response);
        	}

        	
        	
        	} else {
        		out.println("<script type='text/javascript'>");
        		out.println("alert('Your username or password is incorrect');");
        		out.println("location='adminLogin.jsp'");
        		out.println("</script>");
        	}
	}

}