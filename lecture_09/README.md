# Lecture 9: Threads and Locks

In this directory, you can find the source code of the example code
that was dicussed alongside the slides for Lecture 9 of CSCI 5828
during the Fall 2015 semester.

## Building the Software

    cd lecture_09
    ./gradlew build

Replace the above command with ./gradlew.bat if you are on a Windows
machine.

[Gradle](http://gradle.org) is a build system that can be used to
automate the construction of a wide range of software systems. The
gradlew script (also known as the <q>Gradle Wrapper</q>) should
automatically download Gradle to your system (if needed) and then
build the software.

If you have Java installed on your system and the `JAVA_HOME`
environment variable set, then the software should build just fine.

You can then run the software using the scripts stored in the `bin`
directory.

|Script|Description|
|-----:|:----------|
|bin/runCounterFixed|This program fixes the `runCounterSimulated` program of Lecture 8 by synchronizing access to the shared `count` variable using a different variant of the `synchronized` keyword. In lecture 8, we <q>fixed</q> the counter program by putting the `synchronized` keyword on a method definition. In this program, we synchronize on an object and then call its method. The program will now print out `30` on each run. Unfortunately, even though we have ten threads, the synchronized keyword means that each thread takes turns running the increment method, producing a program that is equivalent to a single-threaded program that increments a variable thirty times.|
|bin/runHelloWorld|A program that shows a simple use of a background thread in Java. Running the program multiple times may produce the two output lines in different orders, depending on the scheduler.|

