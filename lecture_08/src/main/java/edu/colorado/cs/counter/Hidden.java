package edu.colorado.cs.counter;

public class Hidden {

  public int count;

  public void Hidden() {
    count = 0;
  }

  public static void main(String[] args) {

    final int numThreads = Integer.parseInt(args[0]);

    final Hidden h       = new Hidden();

    Thread[] threads = new Thread[numThreads];

    // Create the threads
    for (int index = 0; index < numThreads; index++) {

      final int i = index;

      threads[i] =
        new Thread(new Runnable() {

          public void run() {
            for (int j = 0; j < 3; j++) {

              String message = "Thread %d wrote %d on loop %d";
     
              System.out.println(String.format(message, i, ++h.count, j));
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
    
    // Report the final value of count
    System.out.println(String.format("count = %d", h.count));
  }
}
