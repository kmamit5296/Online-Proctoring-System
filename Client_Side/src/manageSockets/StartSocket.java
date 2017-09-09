package manageSockets;

import localconnection.LocalCamera1Connection;
import localconnection.LocalCamera2Connection;
import localconnection.LocalConnectionManager;
import manageSockets.ResultsStore;

public class StartSocket {
    public static void main(String[] args) {
        ResultsStore.perSlot = new StringBuffer();
        ResultsStore.time = 0;
        //LocalConnectionManager sound = new LocalConnectionManager(8002);
        LocalCamera1Connection c1 = new LocalCamera1Connection(8000);
        //LocalCamera2Connection c2 = new LocalCamera2Connection(8001);
        
        c1.start();
        //sound.start();
        //c2.start();
    }
}
