import javax.swing.JOptionPane;

import localconnection.LocalCamera1Connection;
import localconnection.LocalCamera2Connection;
import localconnection.LocalConnectionManager;
import manageSockets.ResultsStore;

public class LServerStart
extends Thread {
    @Override
    public void run() {
        ResultsStore.perSlot = new StringBuffer();
        ResultsStore.time = 0;
        ResultsStore.uid = JOptionPane.showInputDialog(null, "What's your Registration Id?");        
        LocalConnectionManager sound = new LocalConnectionManager(8002);
        LocalCamera1Connection con1 =new LocalCamera1Connection(8000);
        LocalCamera2Connection con2 =new LocalCamera2Connection(8001);
        con1.start();
        sound.start();
        con2.start();
    }
}
