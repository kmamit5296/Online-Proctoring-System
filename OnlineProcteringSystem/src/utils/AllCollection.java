package utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.ListIterator;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import adduser.User;

public class AllCollection {
	static private ArrayList<Session> sList=new ArrayList<Session>();
	static private ArrayList<Session> admins=new ArrayList<Session>();
	static private ArrayList<User> uList=new ArrayList<User>();
	static private ArrayList<HttpSession> studSession=new ArrayList<HttpSession>();
	public static ArrayList<Session> getsList(){
		return sList;
	}
	public static ArrayList<User> getuList(){
		return uList;
	}
	public static ArrayList<Session> getadmins(){
		return admins;
	}
	public static ArrayList<HttpSession> getStudSession(){
		return studSession;
	}
	public static int bindUidInSession(String email,ArrayList<User> list){
		User usr=null;
		System.out.println(list.size());
		ListIterator<User> li=list.listIterator();
		while(li.hasNext()){
			usr=li.next();
			if(usr.email.equals(email))
				return usr.id;
		}
		return -1;
	}
	public static void bindUser(HttpSession ses,int uid,ArrayList<User> list){
		User usr=null;
		ListIterator<User> li=list.listIterator();
		while(li.hasNext()){
			usr=li.next();
			if(usr.id==uid){
				ses.setAttribute("userdetail", usr);
			}
		}
	}
	static void sendMessageAll(String msg){
		for (Session session : sList) {
			try {
				
				session.getBasicRemote().sendText(msg);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	static void sendAdmins(String msg){
		for (Session session : admins) {
			try {
				session.getBasicRemote().sendText(msg);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	/*public static int[] getUserIdList(ArrayList<User> alis){
		int user[]=new int[alis.size()];
		int i=0;
		for (User usr : alis) {
			user[i++]=usr.id;
		}
		return user;
	}*/
}
