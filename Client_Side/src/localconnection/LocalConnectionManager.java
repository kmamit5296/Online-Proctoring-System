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
import java.net.NetworkInterface;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.SocketException;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.util.Collections;
import java.util.Enumeration;
import manageSockets.ResultsStore;

public class LocalConnectionManager
extends Thread {
    ServerSocket ssocket;
    ServerSocketChannel ssc;
    Socket client;
    int port;
    long prev_req = 0;
    long cur_req;

    public LocalConnectionManager(int no) {
        this.port = no;
    }

    public static void main(String[] args) throws Exception {
    }

    static void displayInterfaceInformation(NetworkInterface netint) throws SocketException {
        System.out.printf("Display name: %s\n", netint.getDisplayName());
        System.out.printf("Name: %s\n", netint.getName());
        Enumeration<InetAddress> inetAddresses = netint.getInetAddresses();
        for (InetAddress inetAddress : Collections.list(inetAddresses)) {
            System.out.printf("InetAddress: %s\n", inetAddress);
        }
        System.out.printf("\n", new Object[0]);
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

    void acceptRequest() throws IOException {
        do {
            SocketChannel s = this.ssc.accept();
            this.client = s.socket();
            this.serveRequest();
        } while (true);
    }

    void fillRecord(String res) {
    	String resul="";
        /*if (this.prev_req == 0) {
            this.prev_req = System.currentTimeMillis();
        } else {        	
            this.cur_req = System.currentTimeMillis();
            if (this.cur_req - this.prev_req > 3000) {
                if (res.equals("SOUND-FAIL")) {
                	resul="0:S";
                    ResultsStore.setSlot("0:S#", (int)ResultsStore.getTime());
                } else {
                	resul="1";
                    ResultsStore.setSlot("1", (int)ResultsStore.getTime());
                }
            }
            this.prev_req = this.cur_req;
        }*/
    	//System.out.println(res);
    	if (res.equals("Sound-FAIL")) {
        	resul="0:S";
            ResultsStore.setSlot("0:S#", (int)ResultsStore.getTime());
            ResultsStore.print();
            ResultsStore.send(resul);
        }
    }

    void serveRequest() throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(this.client.getInputStream()));
        String req = "";
        while (br.ready() || req.length() == 0) {
            req = String.valueOf(req) + (char)br.read();
        }
        String data = req.split("\n")[1].split(":")[1];
        this.fillRecord(data.trim());
        System.out.println("Serv data:" + data);
        PrintWriter pw = new PrintWriter(this.client.getOutputStream());
        pw.write("HTTP/1.1 200 OK \r\n\r\n");
        pw.close();
        br.close();
        client.close();
    }
}
