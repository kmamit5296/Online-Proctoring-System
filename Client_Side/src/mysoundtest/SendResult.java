package mysoundtest;

import java.io.PrintStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

public class SendResult {
    public void sendPost(String data) throws Exception {
        String url = "http://10.42.0.247:8002";
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection)obj.openConnection();
        con.setRequestMethod("GET");
        //System.out.println(data);
        con.setRequestProperty("User-Agent", data);
        int responseCode = con.getResponseCode();
    }

    public static void main(String[] v) {
        try {
            new SendResult().sendPost("zdfcvbjk");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
