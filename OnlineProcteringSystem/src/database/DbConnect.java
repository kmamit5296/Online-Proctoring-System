package database;
import java.sql.*;
public class DbConnect {
	ResultSet r1;
	static Connection con;
	static PreparedStatement p2; 
	public static void createconnection()throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/proctering_system?user=root");
	}
	public static Connection getConnection(){
		return con;
	}
	public static void setConnection(Connection c) throws ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		con=c;
	}
	public static ResultSet execute(String url)throws SQLException,ClassNotFoundException{
		System.out.println(url);
		 return p2.executeQuery();
	}
	public static int Update(String url)throws SQLException,ClassNotFoundException{
		 
		 p2=con.prepareStatement(url);
		 return p2.executeUpdate();
	}
	public static void close1() throws SQLException{
			con.close();
			p2.close();
	}
	
}