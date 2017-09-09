package admin;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DbConnect;
import database.DbConnect2;
import encoding.Encoding;

/**
 * Servlet implementation class RegisterAdmin
 */
@WebServlet("/registeradmin")
public class RegisterAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static DbConnect2 db2=new DbConnect2();
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	String email;
	String password;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Encoding en=new Encoding();
		int a=0;
		email=request.getParameter("email");
		try {
			password=en.encoded(request.getParameter("password"));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		try {
			a=db2.Update("INSERT INTO `admin`(`email_id`, `password`) VALUES ('"+email+"','"+password+"')");
			if(a==1){
				getServletContext().setAttribute("adminregister", "Account Created Sucessfully");
				//response.getWriter().print("<script>alert('Account Created Sucessfully')</script>");
				response.sendRedirect("http://localhost:8080/OnlineProcteringSystem/jsp/admin/registeradmin.jsp");
			}
			else {
				getServletContext().setAttribute("adminregister", "Error while adding account");
				response.sendRedirect("http://localhost:8080/OnlineProcteringSystem/jsp/admin/registeradmin.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			getServletContext().setAttribute("adminregister", "Error while adding account");
			response.sendRedirect("http://localhost:8080/OnlineProcteringSystem/jsp/admin/registeradmin.jsp");
			e.printStackTrace();
		} 
	}

}
