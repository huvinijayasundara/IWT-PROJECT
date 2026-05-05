package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.userServices;

@WebServlet("/changePasswordServlet")
public class changePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public changePasswordServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       String username = (String) request.getSession().getAttribute("username");
       
       String password = request.getParameter("current_password");
       String newpass = request.getParameter("new_password");
       
       String current = userServices.checkPassword(username);
       
       if (current != null && current.equals(password)) {
    	   
    	   boolean isTrue= false;
    	   
    	   isTrue = userServices.updatePassword(username, newpass);
    	   
    	   if(isTrue == true) {
    		   
    		String alertMessage = "Password changed successfully , Please login again!";
   			response.getWriter().println("<script>alert('"+alertMessage+"');window.location.href='login.jsp';</script>");
    		       		   
    	   }
    	    	   
       }
       else {
		   
		   String alertMessage = "Current password is invalid,Enter the password Again!";
  		   response.getWriter().println("<script>alert('"+alertMessage+"');window.location.href='changePassword.jsp';</script>");
	   }
		
		
		
	}

}
