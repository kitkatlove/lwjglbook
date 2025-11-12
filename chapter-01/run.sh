#!/bin/bash
# Run script for LWJGL HelloWorld application

# Compile the project
mvn compile

# Build classpath if it doesn't exist
if [ ! -f cp.txt ]; then
    mvn dependency:build-classpath -Dmdep.outputFile=cp.txt
fi

# Run the application with correct JVM arguments for macOS and Apple Silicon natives
java -XstartOnFirstThread \
    -Djava.library.path=target/natives/macos/arm64/org/lwjgl:target/natives/macos/arm64/org/lwjgl/glfw:target/natives/macos/arm64/org/lwjgl/opengl \
    -cp "target/classes:$(cat cp.txt)" org.lwjglb.HelloWorld
