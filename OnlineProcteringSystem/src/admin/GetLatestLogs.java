package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DbConnect;
import database.DbConnect2;

/**
 * Servlet implementation class GetLatestLogs
 */
@WebServlet("/GetLatestLogs")
public class GetLatestLogs extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static DbConnect2 db2=new DbConnect2();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String query=request.getQueryString().trim();
		Timestamp temp, times=null;
		PrintWriter pw=response.getWriter();
		try {			
			ResultSet rs1=db2.execute("select time from user_logs where user_id='"+query+"'");
			while(rs1.next()){
				if(times==null)
					times=rs1.getTimestamp(1);
				else{
					temp=rs1.getTimestamp(1);
					if(times.before(temp))
						times=temp;
				}
			}
			if(times!=null){
				rs1=db2.execute("select `message` from `user_logs` where user_id='"+query+"' and time='"+times+"'");
				if(rs1.next()){
					pw.print(rs1.getString(1)+"#"+times);
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
