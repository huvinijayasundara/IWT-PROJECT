package servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.user;
import service.userServices;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            
        	List<user> userlogin = userServices.loginValidate(username, password);
                  
            if (userlogin != null && !userlogin.isEmpty()) {
                
            	String alertMessage = "Login successful";
                //Store the user in the session
                request.getSession().setAttribute("username", username);//for my purpose
                
                request.getSession().setAttribute("user", userlogin.get(0)); // Assuming single user login
                response.sendRedirect("eventhome.jsp");            
                
                //response.getWriter().println("<script>alert('" + alertMessage + "');window.location.href='userDashboard.jsp'</script>");
                
            } else {
            	
                String alertMessage = "Invalid Credentials, please try again";
                response.getWriter().println("<script>alert('" + alertMessage + "');window.location.href='login.jsp'</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Optionally redirect to an error page
            response.sendRedirect("error.jsp");
        }
        

    }
}