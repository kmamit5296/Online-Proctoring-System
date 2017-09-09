package encoding;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encoding {
	String convertToHex(byte b[]){
		StringBuffer encstr=new StringBuffer();
		encstr.append("0x0F");
		for(int i=0;i<b.length;i++){
			int up=(b[i] >>> 4)  & 0x0F;
				if(up>=0 && up<=9)
					encstr.append((char)('0'+up));
				else 
					encstr.append((char)('a'+(up-10)));
		}
		return new String(encstr);
	}
	public String encoded(String txt) throws NoSuchAlgorithmException{
		MessageDigest md;
		md=MessageDigest.getInstance("SHA-1");
		byte[] hash=new byte[50];
		md.update(txt.getBytes(Charset.forName("UTF-16LE")));
		hash=md.digest();
		return convertToHex(hash);
	}
	public static void main(String v[]){
		Encoding e1=new Encoding();
		String s="123";
		try {
			System.out.println(e1.encoded(s));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	}
}