package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addSuggestionsServlet")
public class addSuggestionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

          String eventID = request.getParameter("eventId");
          String sugg = request.getParameter("suggestion");
		  System.out.println("error 1");
		
		
        boolean isTrue;
		
		isTrue = service.suggestionService.insertSuggestion(eventID, sugg);
		System.out.println("error 2");
		if(isTrue == true) {
			
			String alertMessege = "Suggetion added";
			response.getWriter().println("<script> alert('"+alertMessege+"');window.location.href = 'showAllEventsServlet'</script>");
			
		}
		else {
			
			RequestDispatcher dis = request.getRequestDispatcher("Wrong.jsp");
			dis.forward(request, response);
		}
		
		
		
		
	}

}
