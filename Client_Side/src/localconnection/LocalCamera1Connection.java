package localconnection;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import manageSockets.ResultsStore;

public class LocalCamera1Connection
extends Thread {
    ServerSocket ssocket;
    ServerSocketChannel ssc;
    Socket client;
    int port;
    long prev_req = 0;
    long cur_req;

    public LocalCamera1Connection(int no) {
        this.port = no;
    }

    @Override
    public void run() {
        try {
            runServer();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }

    void runServer() throws IOException {
        ssc = ServerSocketChannel.open();
        ssocket = ssc.socket();
        ssocket.bind(new InetSocketAddress(InetAddress.getByName("10.42.0.247"), port));
        acceptRequest();
    }

    void fillRecord(String res) {
    	String resul="";
        /*if (this.prev_req == 0) {
            this.prev_req = System.currentTimeMillis();
        } else {
            this.cur_req = System.currentTimeMillis();
            if (this.cur_req - this.prev_req > 3000) {
                if (res == "CAMERA1FAIL") {
                	resul="0:B";
                    ResultsStore.setSlot("0:A#", (int)ResultsStore.getTime());
                } else {
                	resul="1";
                    ResultsStore.setSlot("1#", (int)ResultsStore.getTime());
                }
            }
            this.prev_req = this.cur_req;
        }*/    	
    	res=res.trim();
    	//System.out.println(res.equals("CAMERA1FAIL"));
    	if (res.equals("CAMERA1FAIL")) {
        	resul="0:A";
            ResultsStore.setSlot("0:A#", (int)ResultsStore.getTime());
            ResultsStore.send(resul);
        }
        
    }

    void acceptRequest() throws IOException {
    	while (true) {
            SocketChannel s = ssc.accept();
            client = s.socket();
            serveRequest();
        } 
    }

    void serveRequest() throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(this.client.getInputStream()));
        String req = "";        
        while (br.ready() || req.length() == 0) {
            req = String.valueOf(req) + (char)br.read();
        }
        this.fillRecord(req.substring(req.lastIndexOf("\n")));
        //fillRecord("CAMERA1FAIL");
        System.out.println(req.substring(req.lastIndexOf("\n")));
        PrintWriter pw = new PrintWriter(this.client.getOutputStream());
        pw.write("HTTP/1.1 200 OK \r\n\r\n");
        pw.close();
        br.close();
        this.client.close();
    }
}
