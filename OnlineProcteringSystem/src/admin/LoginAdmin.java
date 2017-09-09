package admin;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
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
 * Servlet implementation class LoginAdmin
 */
@WebServlet("/loginadmin")
public class LoginAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Encoding en;
	String email;
	String password;
	ResultSet rs;
	static DbConnect2 db2=new DbConnect2(); 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		en=new Encoding();
		email=request.getParameter("email");
		String query="SELECT `password` FROM `admin` WHERE email_id='"+email+"'";
		try {
			password=en.encoded(request.getParameter("password"));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		try{
			//DbConnect.createconnection();
			rs=db2.execute(query);
			
			if(rs.next()){
				if(password.equals(rs.getString(1))){
					rs.close();					
					response.sendRedirect("http://localhost:8080/OnlineProcteringSystem/jsp/admin/adminpanel.jsp");
				}
				else {
					rs.close();
					getServletContext().setAttribute("adminLoginError","Wrong Password");
					response.sendRedirect("http://localhost:8080/OnlineProcteringSystem/jsp/admin/adminlogin.jsp");
				}
			}
			else{
				rs.close();
				getServletContext().setAttribute("adminLoginError","Email Not Exist");
				response.sendRedirect("http://localhost:8080/OnlineProcteringSystem/jsp/admin/adminlogin.jsp");
			}					
		} catch (ClassNotFoundException | SQLException e) {
			getServletContext().setAttribute("adminLoginError","Try After Some Time");
			response.sendRedirect("http://localhost:8080/OnlineProcteringSystem/jsp/admin/adminlogin.jsp");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
