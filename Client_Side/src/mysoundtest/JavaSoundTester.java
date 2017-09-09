package mysoundtest;

import com.bitsinharmony.recognito.MatchResult;
import com.bitsinharmony.recognito.Recognito;
import com.bitsinharmony.recognito.VoicePrint;

import java.io.File;
import java.io.IOException;
import java.time.Instant;
import java.util.List;

import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.SourceDataLine;
import javax.sound.sampled.UnsupportedAudioFileException;

import mysoundtest.SendResult;

public class JavaSoundTester extends Thread {
    public JavaSoundTester(String file) {
        this.filename = file;
        this.wavFile = new File("/home/user/Desktop/khudkisounds/" + this.filename + ".wav");
    }
    String filename;
    File wavFile;
    int flag = 0;
    SendResult sr;
    private AudioInputStream audioStream;
    private AudioFormat audioFormat;
    private SourceDataLine sourceLine;



    boolean Test(String file, int i) throws UnsupportedAudioFileException, IOException {       
    	Recognito<String> recognito = new Recognito<String>(32000.0f);
    	double dist;
    	String ch;
    	boolean test;
		VoicePrint print = recognito.createVoicePrint("Amit",wavFile);
		
		List<MatchResult<String>> matches = recognito.identify(new File("/home/user/Desktop/khudkisounds/"+file+".wav"));
		MatchResult<String> match = matches.get(0);
		dist=match.getDistance();
		if(dist<0.5){
			ch="FAIL";test=false;}
		else {ch="PASS";test=true;}
		if(match.getKey().equals("Amit")) {
			//System.out.println("FNo. "+i+"  Distance: " + dist+"  Likelihood:   "+match.getLikelihoodRatio()+"   Status:"+ch);
		}
		return test;
    }

    @Override
    public void run() {
    	long startTime = Instant.now().toEpochMilli();
		flag=0;
		for(int i=1;i<13;i++){			
			try {
				if(!Test("my"+i,i)){
					flag++;
				}
			} catch (UnsupportedAudioFileException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(flag>=1)
			System.out.println("Sound-FAIL");			
		else System.out.println("Sound-PASS");
		sr=new SendResult();
		try {
		if(flag>=1)
			sr.sendPost("Sound-FAIL");			
		else sr.sendPost("Sound-PASS");
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		long endTime = Instant.now().toEpochMilli();
		//System.out.println("Time Taken:"+(endTime-startTime));
		try {			
			Thread.sleep((3050-(endTime-startTime)));
		} catch (InterruptedException e) {			
			e.printStackTrace();
		}
		
		System.out.println("\n\n\n");
    }
}
