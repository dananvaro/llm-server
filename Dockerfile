FROM pytorch/pytorch:2.8.0-cuda12.6-cudnn9-runtime

# Creates a working direcotry
WORKDIR /app

# Compiler for env 
ENV CC=/usr/bin/gcc
ENV CXX=/usr/bin/g++

EXPOSE 8000

# System dependecies
RUN apt-get update && apt-get install -y \
    git wget curl \
    build-essential \
    cmake \
    && rm -f /var/lib/apt/list/*

RUN pip install -upgrade pip
RUN pip install --no-cache-dir vllm
RUN pip install --no-cache-dir --upgrade huggingface_hub

# Donwload LLM to into /app
RUN hf download openai/gpt-oss-20b --local-dir /app/models/gpt-oss-20b