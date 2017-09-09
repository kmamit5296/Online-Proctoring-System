package adduser;

public class User {
	public int id;
	public String fname,lname,email;
	public String encodedpassword;
	public String sessionid;
	public int getId(){
		return id;
	}
	public String getFname(){
		return fname;
	}
	public String getLname(){
		return lname;
	}
	public String getEmail(){
		return email;
	}
	public String getSessionid(){
		return sessionid;
	}
	public void setId(int iid){
		this.id=iid;
	}
	public void setFname(String n){
		this.fname=n;
	}
	public void setLname(String n){
		this.lname=n;
	}
	public void setEmail(String e){
		this.email=e;
	}
	public void setSessionid(String s){
		this.sessionid=s;
	}
	
}
