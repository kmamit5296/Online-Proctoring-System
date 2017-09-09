package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.AllCollection;

/**
 * Servlet implementation class DeleteStudentTest
 */
@WebServlet("/DeleteStudentTest")
public class DeleteStudentTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String query=request.getQueryString();
		query=query.trim();
		for (HttpSession hs : AllCollection.getStudSession()) {
			if(hs.getAttribute("uid").equals(query)){
				hs.invalidate();
				AllCollection.getStudSession().remove(hs);
			}
		}
	}
}
