package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import database.DbConnect;
import database.DbConnect2;

/**
 * Servlet implementation class ReceiveAllResult
 */
@WebServlet("/ReceiveAllResult")
public class ReceiveAllResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	int user_id;
	byte result[];
	static int prev_index=0;
	static DbConnect2 db2=new DbConnect2(); 
	@SuppressWarnings("deprecation")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String query=URLDecoder.decode(request.getQueryString());
		if(query.split("@").length>=2){
			String uid=query.split("@")[0];
			String message=query.split("@")[1];
			PrintWriter pw=response.getWriter();
			int a=0;
			try {
				a=db2.Update("INSERT INTO `user_logs`( `user_id`, `message`) VALUES ("+uid+",'"+message+"')");
				if(a==1){
					pw.println("HTTP/1.1 200 OK \r\n");
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//user_id=Integer.parseInt(query);
		//System.out.println("get");
		System.out.println("receiving :"+query);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	void print(int in){
		for(int i=in;i<result.length;i++){
			System.out.print(result[i]+"  ");
		}
		System.out.println("new data:");
	}
	void processResult(){
		if(prev_index==0){
			print(0);
			prev_index=result.length;
		}
		else{
			print(result.length-prev_index);
			prev_index=result.length;
		}
			
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String query=request.getQueryString();
		//user_id=Integer.parseInt(query);
		System.out.println(query);
		
	}

}
