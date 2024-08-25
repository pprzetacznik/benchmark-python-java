package example;

import java.util.*;

class SpeedTest {
    public String test() {
        long startTime;
        long totalTime;
        int iterations = 10000000;
        HashSet<Integer> counts = new HashSet<Integer>((2*iterations), 0.75f);
        startTime = System.currentTimeMillis();
        for(int i=0; i<iterations; i++) {
            counts.add(i);
        }
        totalTime = System.currentTimeMillis() - startTime;
        String output = "TOTAL TIME = " + ( totalTime/1000f) + "s\n" + counts.size();
        System.out.println(output);
        return output;
    }

    public static void main(String[] args) {
        SpeedTest st = new SpeedTest();
        st.test();
    }
}
