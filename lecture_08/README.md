# Lecture 8: Introduction to Concurrent Software Systems

In this directory, you can find the source code of the example code
that was dicussed alongside the slides for Lecture 8 of CSCI 5828
during the Fall 2015 semester.

## Building the Software

    cd lecture_08
    ./gradlew build

Replace the above command with ./gradlew.bat if you are on a Windows
computer.

[Gradle](http://gradle.org) is a build system that can be used to
automate the construction of a wide range of software systems. The
gradlew script (also known as the <q>Gradle Wrapper</q>) should
automatically download Gradle to your system and then build the
software.

If you have Java installed on your system and the `JAVA_HOME`
environment variable set, then the software should build just fine.

You can then run the software using the scripts stored in the `bin`
directory.

|Script|Description|
|-----:|:----------|
|bin/runCounterSimulated|A program that creates 10 threads; each thread loops three times incrementing a shared variable. The final value of the variable should be thirty but it is much lower since each thread performs its work unsynchronized with the other threads|
|bin/runCounterHidden &lt;numThreads&gt;|A program that creates the number of threads specifed on the command line. Each thread does the same thing as the program above. The difference is that the code makes use of the ++ operator which feels like it should be an atomic operation but it is not. Try increasing the input parameter by an order of magnitude each time you run the program. It shouldn't take long before the count is wrong due to the race condition hiding in the code.|
|bin/runCounterFixed|This program fixes the `runCounterSimulated` program by synchronizing access to the shared `count` variable. The program will now print out `30` on each run. Unfortunately, even though we have ten threads, the synchronized keyword means that each thread takes turns running producing a program that is equivalent to a single-threaded program that increments a variable thirty times.|
|bin/runMemoryBarrierBroken|A program that demonstrates a memory visibility error in a concurrent program. Two threads share a variable called `done`. One thread starts an infinite loop waiting for `done` to be `true`. The other thread waits two seconds before setting `done` to `true`. Unfortunately, the change does not cross the memory barrier and the program runs <q>forever</q>. (Use Cntrl-C to break the program once you are done.)|
|bin/runMemoryBarrierFixed|A program that shows one way to solve the memory visibility problem of the previous program. In this case, we mark the shared variable as volatile. This keyword then forces the JVM to syncrhonize all changes to that variable across all threads. You can now run the program and see it finish in two seconds after it detects the change in the value of `done`.|
