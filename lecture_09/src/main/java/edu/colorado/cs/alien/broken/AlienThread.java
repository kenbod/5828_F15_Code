package edu.colorado.cs.alien.broken;

public class AlienThread extends Thread {

  private Downloader downloader;
  private ProgressListener l;

  AlienThread(Downloader d, ProgressListener l) {
    this.downloader = d;
    this.l = l;
  }

  public void run() {
    downloader.removeListener(l);
  }

}
