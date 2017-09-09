package admin;

import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Blob;

import database.DbConnect2;

/**
 * Servlet implementation class GetAllCamImage
 */
@WebServlet("/GetAllCamImage")
public class GetAllCamImage extends HttpServlet {
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
		Blob img;
		InputStream in=null;
		ServletOutputStream out = response.getOutputStream();
		try {
			ResultSet rs=db2.execute("SELECT `image` FROM `"+camera+"` WHERE id="+id);
			if(rs.next()){
				img=(Blob)rs.getBlob(1);
				in= img.getBinaryStream();
				byte[] buffer = sun.misc.IOUtils.readFully(in, -1, true);
				response.setContentType("image/gif");
				out.write(buffer);
				in.close();
				out.flush();
				img.free();
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
