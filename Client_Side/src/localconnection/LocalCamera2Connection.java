package localconnection;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.Reader;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketAddress;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import manageSockets.ResultsStore;

public class LocalCamera2Connection
extends Thread {
    ServerSocket ssocket;
    ServerSocketChannel ssc;
    Socket client;
    int port;
    long prev_req = 0;
    long cur_req;

    public LocalCamera2Connection(int no) {
        this.port = no;
    }

    @Override
    public void run() {
        try {
            this.runServer();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }

    void runServer() throws IOException {
        this.ssc = ServerSocketChannel.open();
        this.ssocket = this.ssc.socket();
        this.ssocket.bind(new InetSocketAddress(InetAddress.getByName("10.42.0.247"), this.port));
        this.acceptRequest();
    }

    void fillRecord(String res) {
    	String resul="";
        /*if (this.prev_req == 0) {
            this.prev_req = System.currentTimeMillis();
        } else {
            this.cur_req = System.currentTimeMillis();
            if (this.cur_req - this.prev_req > 4000) {
                if (res == "CAMERA2FAIL") {
                	resul="0:B";
                    ResultsStore.setSlot("0:B#", (int)ResultsStore.getTime());
                } else {
                	resul="1";
                    ResultsStore.setSlot("1#", (int)ResultsStore.getTime());
                }
            }
            this.prev_req = this.cur_req;
        }*/
    	res=res.trim();
    	if (res.equals("CAMERA2FAIL")) {
        	resul="0:B";
            ResultsStore.setSlot("0:B#", (int)ResultsStore.getTime());
            ResultsStore.send(resul);
        }        
    }

    void acceptRequest() throws IOException {
        do {
            SocketChannel s = this.ssc.accept();
            this.client = s.socket();
            this.serveRequest();
        } while (true);
    }

    void serveRequest() throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(this.client.getInputStream()));
        String req = "";
        while (br.ready() || req.length() == 0) {
            req = String.valueOf(req) + (char)br.read();
        }
        //System.out.println(req);
        this.fillRecord(req.substring(req.lastIndexOf("\n")));
        System.out.println(req.substring(req.lastIndexOf("\n")));
        PrintWriter pw = new PrintWriter(this.client.getOutputStream());
        pw.write("HTTP/1.1 200 OK \r\n\r\n");
        pw.close();
        br.close();
        this.client.close();
    }
}
