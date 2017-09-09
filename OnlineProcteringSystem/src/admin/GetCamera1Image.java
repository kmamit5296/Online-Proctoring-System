package admin;

import java.io.IOException;
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
 * Servlet implementation class GetCamera1Image
 */
@WebServlet("/getc1")
public class GetCamera1Image extends HttpServlet {
	private static final long serialVersionUID = 1L;
    int user_id;
    byte image[];
    String camera;
    static DbConnect2 db2=new DbConnect2();
	void storeImage(){
		try {
			java.sql.PreparedStatement ps;
			java.sql.Connection connect=db2.getConnection();
			ps=connect.prepareStatement("INSERT INTO `"+camera+"` (`user_id`,`image`) VALUES (?,?)");
			ps.setInt(1, user_id);
			ps.setBytes(2, image);
			if(ps.executeUpdate()==1){
			}
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String query=request.getQueryString();
		user_id=Integer.parseInt(query.split("&")[0]);
		camera = query.split("&")[1];
		FileItemIterator iter;
		ServletFileUpload sfu=new ServletFileUpload();
		try {
			iter=sfu.getItemIterator(request);
			while(iter.hasNext()){
				FileItemStream fis=iter.next();
			//	if(!fis.isFormField()){
			//		if(fis.getContentType().equals("image/jpeg")){																				
						image = sun.misc.IOUtils.readFully(fis.openStream(), -1, true);
						storeImage();
			//		}
				//	else System.out.println(fis.getContentType());
			//	}else System.out.println(fis.openStream());
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
	}
}
