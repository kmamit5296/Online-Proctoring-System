package admin;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DbConnect2;

/**
 * Servlet implementation class GetIdList
 */
@WebServlet("/GetIdList")
public class GetIdList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static DbConnect2 db2=new DbConnect2();   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id,camera,query=request.getQueryString();
		id=query.split("&")[0];
		camera=query.split("&")[1];
		ServletOutputStream out = response.getOutputStream();
		try {
			ResultSet rs=db2.execute("SELECT `id`, `timestamp` FROM `"+camera+"` WHERE user_id="+id);
			StringBuffer sbuf=new StringBuffer();
			sbuf.append("");
			while(rs.next()){
				//System.out.println(rs.getString(1)+"@"+rs.getString(2)+"#");
				sbuf.append(rs.getString(1)+"@"+rs.getTimestamp(2)+"#");
			}
			out.write(sbuf.toString().getBytes());
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}

}
