package edu.colorado.cs.counter;

import java.util.Random;

public class Simulated {

  public int count;

  public void Simulated() {
    count = 0;
  }

  public static void main(String[] args) {

    final Simulated s = new Simulated();

    Thread[] threads = new Thread[10];

    // Create 10 threads
    for (int index = 0; index < 10; index++) {

      final int i = index;

      threads[i] =
        new Thread(new Runnable() {

          private Random r;

          public void run() {

            r = new Random();

            for (int j = 0; j < 3; j++) {

                // Read value of count
                int temp = s.count;

                String message = "Thread %d read  %d on loop %d";
                System.out.println(String.format(message, i, temp, j));

                // Sleep for a bit
                try {
                  Thread.sleep(r.nextInt(300));
                } catch (Exception ex) {
                }

                // Increment value of count
                s.count = temp + 1;

                message = "Thread %d wrote %d on loop %d";
                System.out.println(String.format(message, i, temp + 1, j));
              }
            }
          }
        );
    }

    // Start the threads
    for (Thread th : threads) {
      th.start();
    }

    // Wait for the threads to finish
    for (Thread th : threads) {
      try {
        th.join();
      } catch (Exception ex) {
      }
    }

    // Report final value for count
    System.out.println(String.format("count = %d", s.count));
  }
}
