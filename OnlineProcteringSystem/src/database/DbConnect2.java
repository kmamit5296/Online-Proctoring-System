package database;
import java.sql.*;
public class DbConnect2 {
	ResultSet r1;
    Connection con;
	PreparedStatement p2; 
	public DbConnect2() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/proctering_system?user=root");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// TODO Auto-generated constructor stub
	}
	public void createconnection()throws SQLException, ClassNotFoundException{
	
	}
	public Connection getConnection(){
		return con;
	}
	public void setConnection(Connection c) throws ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		con=c;
	}
	public ResultSet execute(String url)throws SQLException,ClassNotFoundException{
		 p2=con.prepareStatement(url);
		 return p2.executeQuery();
	}
	public int Update(String url)throws SQLException,ClassNotFoundException{
		 
		 p2=con.prepareStatement(url);
		 return p2.executeUpdate();
	}
	public void close1() throws SQLException{
			con.close();
			p2.close();
	}
	
}