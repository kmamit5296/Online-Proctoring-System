package mysoundtest;

import mysoundtest.JavaSoundRecorder;
import mysoundtest.JavaSoundTester;

public class SoundTest {
    JavaSoundRecorder jsr;
    JavaSoundTester jst;

    void checkSound(String filename) {
        this.jst = new JavaSoundTester(filename);
        this.jst.start();
    }

    void startRecorder(String filename) {
        this.jsr = new JavaSoundRecorder(filename);
        this.jsr.start();
    }

    public void control() {
        startRecorder("abc");
        try {
            Thread.sleep(3050);
        }
        catch (InterruptedException ex) {
            ex.printStackTrace();
        }
       for(int i=0;i<100;i++){
            if (i % 2 == 0) {
                checkSound("abc");
                startRecorder("abc1");
            } else {
                checkSound("abc1");
                startRecorder("abc");
            }
            try {
                Thread.sleep(3050);
            }
            catch (InterruptedException ex) {
                ex.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        SoundTest st = new SoundTest();
        st.control();
    }
}
