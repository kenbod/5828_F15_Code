package edu.colorado.cs.alien.normal;

import java.net.URL;

public class HttpDownload {

  public static void main(String[] args) throws Exception {

    URL from = new URL("http://www.cs.colorado.edu/~kena/index.html");

    final Downloader downloader = new Downloader(from, "index.html");

    final ProgressListener l = new ProgressListener() {
      public void onProgress(int n) {
        System.out.print("\n"+n);
        System.out.flush();
      }

      public void onComplete(boolean success) {}

    };

    downloader.addListener(l);
    downloader.start();
    downloader.join();

  }

}
