package adduser;

import java.io.Serializable;

import com.mysql.jdbc.Blob;

public class PicAudio implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	int user_id;
	byte img[];
	byte audio[];
}
