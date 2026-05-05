package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Services;
import service.ServicesDBUtil;

@WebServlet("/ServicesServlet")
public class ServicesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String category = request.getParameter("category");
		
		try {
			List<Services> addonDetails = ServicesDBUtil.getServiceDetails(category);
			
			request.setAttribute("addonDetails", addonDetails);
			request.setAttribute("category", category);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("addonOptions.jsp");
		dis.forward(request, response);
	}

}
