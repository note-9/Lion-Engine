#!/bin/bash

set -e

mkdir -p build

echo "Compiling GLAD..."

gcc -Iinclude \
    -c src/glad.c \
    -o build/glad.o

echo "Building engine..."

g++ -std=c++17 \
    -Wall -Wextra \
    -g \
    -Iinclude \
    src/main.cpp \
    src/stb_image.cpp \
    build/glad.o \
    -o build/lion \
    $(pkg-config --cflags --libs glfw3 assimp) \
    -lGL

echo "Build successful!"
echo "Running engine..."

./build/lion
