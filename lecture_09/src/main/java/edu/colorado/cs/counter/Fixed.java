package edu.colorado.cs.counter;

import java.util.Random;

public class Fixed {

  public int count;

  public void Fixed() {
    count = 0;
  }

  public void increment(int index, int loop) {
    String message = "Thread %d wrote %d on loop %d";
    System.out.println(String.format(message, index, ++count, loop));
  }

  public static void main(String[] args) {

    final Fixed f = new Fixed();

    Thread[] threads = new Thread[10];

    // Create the Threads
    for (int index = 0; index < 10; index++) {

      final int i = index;

      threads[i] =
        new Thread(new Runnable() {
          public void run() {
            for (int j = 0; j < 3; j++) {
              synchronized (f) {
                f.increment(i, j);
              }
            }
          }
        }
      );
    }

    // Start the Threads
    for (Thread th : threads) {
      th.start();
    }

    // Wait for threads to finish
    for (Thread th : threads) {
      try {
        th.join();
      } catch (Exception ex) {
      }
    }

    // Report the value of count
    // Note: no need to synchronize access to f below.
    // All threads (except the main thread) are finished
    System.out.println(String.format("count = %d", f.count));
  }
}
