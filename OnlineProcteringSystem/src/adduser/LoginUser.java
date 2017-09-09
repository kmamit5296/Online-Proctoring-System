package adduser;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.AllCollection;

import com.sun.corba.se.spi.legacy.connection.GetEndPointInfoAgainException;
import com.sun.xml.internal.bind.v2.runtime.output.Encoded;

import database.DbConnect;
import database.DbConnect2;
import encoding.Encoding;

/**
 * Servlet implementation class LoginUser
 */
@WebServlet("/login")
public class LoginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	boolean isLogin=false;
	Encoding en;
	String email;
	String fname;
	String lname;
	String password,passworddb;
	ResultSet rs;
	static DbConnect2 db2=new DbConnect2();
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		
		en=new Encoding();
		email=request.getParameter("emaill");
		String query="SELECT `first_name`, `last_name`, `password` FROM `user` WHERE email='"+email+"'";
		try {
			password=en.encoded(request.getParameter("passwordd"));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		try{
			rs=db2.execute(query);
			if(rs.next()){
				fname=rs.getString(1);
				lname=rs.getString(2);
				passworddb=rs.getString(3);
				if(password.equals(passworddb)){
					isLogin=true;
					rs.close();				
					@SuppressWarnings("unchecked")
					int uid=AllCollection.bindUidInSession(email,(ArrayList<User>)getServletContext().getAttribute("uList"));
					request.getSession().setAttribute("uid",uid);
					request.getSession().setAttribute("f_name",fname);
					request.getSession().setAttribute("l_name",lname);
					AllCollection.getStudSession().add(request.getSession());
					response.sendRedirect("http://localhost:8080/OnlineProcteringSystem/jsp/usercheck.jsp");
				}
				else {
					rs.close();
					getServletContext().setAttribute("signup_tab","tab");
					getServletContext().setAttribute("login_tab","tab active");
					getServletContext().setAttribute("signup_style","display:none");
					getServletContext().setAttribute("login_style","display:inline");
					getServletContext().setAttribute("LoginError", "Wrong Password");
					response.sendRedirect("http://localhost:8080/OnlineProcteringSystem/index.jsp");
				}
			}
			else{
				rs.close();
				getServletContext().setAttribute("signup_tab","tab");
				getServletContext().setAttribute("login_tab","tab active");
				getServletContext().setAttribute("signup_style","display:none");
				getServletContext().setAttribute("login_style","display:inline");				
				getServletContext().setAttribute("LoginError", "Wrong Password");
				getServletContext().setAttribute("LoginError", "Email not Exist");
				response.sendRedirect("http://localhost:8080/OnlineProcteringSystem/index.jsp");
			}					
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
