package adduser;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.AllCollection;
import database.DbConnect;
import database.DbConnect2;
import encoding.Encoding;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }
    boolean isreg=true;
    User newUser;
	Encoding e1;
	PrintWriter out;
	int a=0,b=0;
	static DbConnect2 db2=new DbConnect2();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		newUser=new User();
		e1=new Encoding();
		try {
			out=response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		newUser.fname=request.getParameter("fname");
		newUser.lname=request.getParameter("lname");
		newUser.email=request.getParameter("email");
		newUser.encodedpassword=request.getParameter("password");
		try{
			//DbConnect.createconnection();
			//getServletContext().setAttribute("connection", DbConnect.getConnection());
			newUser.encodedpassword=e1.encoded(newUser.encodedpassword);
			a=db2.Update("insert into user(first_name,last_name,password,email) values('"+newUser.fname+"','"+newUser.lname
					+"','"+newUser.encodedpassword+"','"+newUser.email+"')");
			if(a==1){
				isreg=true;
				ResultSet rs=db2.execute("SELECT `user_id` FROM `user` WHERE email='"+newUser.email+"'");
				rs.next();
				newUser.id=rs.getInt(1);
				AllCollection.getuList().add(newUser);
				getServletContext().setAttribute("uList", AllCollection.getuList());
				getServletContext().setAttribute("userId", newUser.id);
				rs.close();
				//getServletContext().setAttribute("registrationDetail", "Registered Sucessfully");
				response.sendRedirect("http://localhost:8080/OnlineProcteringSystem/jsp/addPicAudio.jsp");
			}
		}catch(ClassNotFoundException | NoSuchAlgorithmException | SQLException e){
			getServletContext().setAttribute("registrationError", "User Already Exist");
			response.sendRedirect("http://localhost:8080/OnlineProcteringSystem/index.jsp");
			e.printStackTrace();
		}
	}

}
