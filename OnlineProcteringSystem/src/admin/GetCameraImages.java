package admin;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Blob;

import database.DbConnect;
import database.DbConnect2;

/**
 * Servlet implementation class GetCameraImages
 */
@WebServlet({ "/GetCameraImages", "/images" })
public class GetCameraImages extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Blob img;
	static DbConnect2 db2=new DbConnect2();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String camera,query=request.getQueryString();
		ServletOutputStream out = response.getOutputStream();
		InputStream in=null;	
		int id=new Integer(query.split("&")[0]);
		camera=query.split("&")[1];
		Timestamp temp,times=null;
		try{
			
			ResultSet rs1=db2.execute("select timestamp from "+camera+" where user_id='"+id+"'");
			while(rs1.next()){
				if(times==null)
					times=rs1.getTimestamp(1);
				else{
					temp=rs1.getTimestamp(1);
					if(times.before(temp))
						times=temp;
				}
			}
			if(times==null){
				in=getServletContext().getResourceAsStream("/images/default/noimage.jpg");
			}
			else{
				rs1=db2.execute("select `image` from `"+camera+"` where user_id='"+id+"' and timestamp='"+times+"'");
				if(rs1.next()){
					img=(Blob)rs1.getBlob(1);
					in= img.getBinaryStream();
					byte[] buffer = sun.misc.IOUtils.readFully(in, -1, true);
					response.setContentType("image/gif");
					out.write(buffer);
					//out.flush();
					in.close();
					img.free();
				}
			}
			/*	if(rs1.next()){
					img=(Blob)rs1.getBlob(1);
					//System.out.println(bok.thumb);
				}
			if(img==null){
				in=getServletContext().getResourceAsStream("/images/default/noimage.jpg");
			}
			else
				in= img.getBinaryStream();
			byte[] buffer = sun.misc.IOUtils.readFully(in, -1, true);
			response.setContentType("image/gif");
			/*int length = 0;
			int size = 1024;
			= new byte[size];
			while ((length = in.read(buffer)) != -1) {
				out.write(buffer, 0, length);
			}
			out.write(buffer);
			in.close();
			out.flush();
			DbConnect.close1();
			img.free();*/
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
