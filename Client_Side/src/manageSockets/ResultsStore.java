package manageSockets;

import java.io.PrintStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import javax.swing.JOptionPane;

public class ResultsStore {
    public static StringBuffer perSlot;
    public static int cur;
    public static int time;
    public static long t1;
    public static long t2;
    public static String uid;
    static {
        t1 = 0;
        t2 = 0;
    }

    public static synchronized void setSlot(String er, int i) {
        ResultsStore.perSlot.append(er);
        ++time;
    }

    public static synchronized int getTime() {
        return time;
    }

    public static synchronized void print() {
       /* int[] arrn = perSlot;
        int n = arrn.length;
        int n2 = 0;
        while (n2 < n) {
            int i = arrn[n2];
            System.out.print(i);
            ++n2;
        }*/
        System.out.println(perSlot.toString());
    }

    /*public static String ToByteArray() {
        StringBuffer sb = new StringBuffer();
        int[] arrn = perSlot;
        int n = arrn.length;
        int n2 = 0;
        while (n2 < n) {
            int b = arrn[n2];
            sb.append(b);
            ++n2;
        }
        return sb.toString();
    }*/

    public static synchronized void send(String s) { 
                try {
                	//System.out.println("uidddddddddddddddddddd----------->"+uid);
                    String url = "http://localhost:8080/OnlineProcteringSystem/ReceiveAllResult?" +URLEncoder.encode(uid+"@"+s, "UTF-8");
                    URL obj = new URL(url);
                    HttpURLConnection con = (HttpURLConnection)obj.openConnection();
                    con.setRequestMethod("GET");
                    int n = con.getResponseCode();
                }
                catch (Exception e) {
                    e.printStackTrace();
                }
            
    }
}