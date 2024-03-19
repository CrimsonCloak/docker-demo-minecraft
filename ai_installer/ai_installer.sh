#!/bin/bash
apk add git
apk add build-base
apk add cmake
pip3 install huggingface_hub --break-system-packages



git clone https://github.com/ggerganov/llama.cpp.git && \

{
    cd ./llama.cpp
    mkdir build
    cd ./build
    cmake -DLLAMA_NATIVE=OFF ..
    cmake --build . --config Release && \


    cd ./bin
    huggingface-cli download TheBloke/TinyLlama-1.1B-Chat-v0.3-GGUF tinyllama-1.1b-chat-v0.3.Q4_K_M.gguf --local-dir . --local-dir-use-symlinks False

    

}