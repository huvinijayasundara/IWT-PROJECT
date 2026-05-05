package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import javax.servlet.http.*;

import model.EventPlanner;
import service.EventPlannerService;


@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    private EventPlannerService plannerService;

    @Override
    public void init() throws ServletException {
        super.init();
        plannerService = new EventPlannerService();
    }

    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        /*HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Add session variables to the request for use in JSP
        request.setAttribute("name", session.getAttribute("name"));
        request.setAttribute("email", session.getAttribute("email"));*/

        if (action == null) {
            request.setAttribute("planners", plannerService.getAllEventPlanners());
            request.getRequestDispatcher("ManageEventPlanner.jsp").forward(request, response);
        } else if (action.equals("create")) {
            request.getRequestDispatcher("AddEventPlanner.jsp").forward(request, response);
        } else if (action.equals("view")) {
            String id = request.getParameter("id");
            EventPlanner planner = plannerService.getEventPlanner(id);
            request.setAttribute("planner", planner);
            request.getRequestDispatcher("ViewEventPlanner.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            String id = request.getParameter("id");
            EventPlanner planner = plannerService.getEventPlanner(id);
            request.setAttribute("planner", planner);
            request.getRequestDispatcher("UpdateEventPlanner.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            String id = request.getParameter("id");
            plannerService.deleteEventPlanner(id);
            response.sendRedirect("AdminServlet");
        } /*else if (action.equals("logout")) {
            session.invalidate();
            response.sendRedirect(request.getContextPath() + "/login");
        }*/
    }  


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("create")) {
        	String id = request.getParameter("id");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone_no = request.getParameter("phone_no");
            String password = request.getParameter("password");
            

            EventPlanner planner = new EventPlanner();
            planner.setId(id);
            planner.setName(name);
            planner.setEmail(email);
            planner.setPhone_no(phone_no);
            planner.setPassword(password);

            try {
				if (plannerService.createEventPlanner(planner)) {
				    response.sendRedirect("AdminServlet");
				} else {
				    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        } else if (action.equals("update")) {
        	String id = request.getParameter("id");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone_no = request.getParameter("phone_no");
            String password = request.getParameter("password");
           
            
            EventPlanner planner = new EventPlanner();
            planner.setId(id);
            planner.setName(name);
            planner.setEmail(email);
            planner.setPhone_no(phone_no);
            planner.setPassword(password);
            
            if (plannerService.updateEventPlanner(planner)) {
                response.sendRedirect("AdminServlet");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else if (action.equals("delete")) {
            String id = request.getParameter("id");
            if (plannerService.deleteEventPlanner(id)) {
                response.sendRedirect("AdminServlet");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
    }
}
        
        
        
        
        
        