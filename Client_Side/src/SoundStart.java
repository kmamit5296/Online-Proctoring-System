import mysoundtest.SoundTest;

public class SoundStart
extends Thread {
    @Override
    public void run() {
        SoundTest st = new SoundTest();
        st.control();
    }
}
