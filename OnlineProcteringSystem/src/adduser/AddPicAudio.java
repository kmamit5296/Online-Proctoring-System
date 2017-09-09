package adduser;

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


import database.DbConnect2;

/**
 * Servlet implementation class AddPicAudio
 */
@WebServlet("/addpa")
public class AddPicAudio extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	static DbConnect2 db2=new DbConnect2();
	PicAudio picau=new PicAudio();
	String message="";
	boolean isAdd=true;
	void storeImage(){
		try {
			java.sql.PreparedStatement ps;
			java.sql.Connection connect=db2.getConnection();
			ps=connect.prepareStatement("INSERT INTO `user_pic_voice` (`user_id`,`pic`) VALUES (?,?)");
			ps.setInt(1, picau.user_id);
			ps.setBytes(2, picau.img);
			if(ps.executeUpdate()==1){
					message="Image Added";
			}
			ps.close();
		} catch (SQLException e) {
			message="SQl Exception";
			e.printStackTrace();
		}
	}
	void storeAudio(){
		try {
			java.sql.PreparedStatement ps;
			java.sql.Connection connect=db2.getConnection();			
			ps=connect.prepareStatement("UPDATE `user_pic_voice` SET audio=? WHERE user_id=?");
			ps.setBytes(1, picau.audio);
			ps.setInt(2,picau.user_id);
			if(ps.executeUpdate()==1){
					message="Audio Added";
			}
			ps.close();
		}  catch (SQLException e) {
			message="SQl Exception";
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		picau.user_id=Integer.parseInt(request.getQueryString());
		FileItemIterator iter;
		ServletFileUpload sfu=new ServletFileUpload();
		try {
			iter=sfu.getItemIterator(request);
			while(iter.hasNext()){
				FileItemStream fis=iter.next();
				if(!fis.isFormField()){
					if(fis.getContentType().equals("image/jpeg")){																				
						picau.img = sun.misc.IOUtils.readFully(fis.openStream(), -1, true);
						storeImage();
					}
					else if(fis.getContentType().equals("audio/wav")){
						System.out.println(request.getContentLength());
						picau.audio = sun.misc.IOUtils.readFully(fis.openStream(), -1, true);
						storeAudio();
					}
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
	}

}
