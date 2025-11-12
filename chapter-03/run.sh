#!/bin/bash
# Run script for LWJGL HelloWorld application

# Compile the project
mvn compile

# Ensure dependencies are copied to target/lib (contains the correct native jars)
mvn -q dependency:copy-dependencies

# Run the application with correct JVM arguments for macOS and Apple Silicon natives
# Use the local copied jars in target/lib (target/lib/*) to ensure the ARM64 native jars are on the classpath
java -XstartOnFirstThread \
    -Djava.library.path=target/natives/macos/arm64/org/lwjgl:target/natives/macos/arm64/org/lwjgl/glfw:target/natives/macos/arm64/org/lwjgl/opengl \
    -cp "target/classes:target/lib/*" org.lwjglb.game.Main
