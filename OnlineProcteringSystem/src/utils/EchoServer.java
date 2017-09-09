package utils;

import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/echo")
public class EchoServer {
	
	/**
     * @OnOpen allows us to intercept the creation of a new session.
     * The session class allows us to send data to the user.
     * In the method onOpen, we'll let the user know that the handshake was 
     * successful.
     */
    @OnOpen
    public void onOpen(Session session){
    	session.setMaxIdleTimeout(1200000);
    	
    	AllCollection.getsList().add(session);
        System.out.println(session.getId()+session.getQueryString() + " has opened a connection"); 
    }
 
    @OnError
    public void error(Session session, Throwable t) {
        /* Remove this connection from the queue */
        System.out.println(session.getId()+"error");
    }
    /**
     * When a user sends a message to the server, this method will intercept the message
     * and allow us to react to it. For now the message is read as a String.
     */
    @OnMessage
    public void onMessage(String message, Session session){
    	String msplit[]=message.split(":");
    	msplit[1]=msplit[1].trim();
    	if(msplit[0].equals("ADMIN")){    		
    		if(msplit[1].equals("REGISTER ME")){
    			AllCollection.getadmins().add(session);
    		}
    		else{
    			
    			AllCollection.sendMessageAll(message);
    		}
    	}
    	else {
    		AllCollection.sendMessageAll(message);
    	}
        System.out.println("Message from " + session.getId() + ": " + message);
        /*try { 
            session.getBasicRemote().sendText(message); System.out.println("sent message");
        } catch (IOException ex) {
            ex.printStackTrace();
        }*/
    }
 
    /**
     * The user closes the connection.
     * 
     * Note: you can't send messages to the client from this method
     */
   
}
