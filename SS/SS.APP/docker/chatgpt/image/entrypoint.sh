#!/bin/bash

ollama serve 2>&1 &
sleep 3

ollama pull mistral && ollama pull nomic-embed-text
poetry install --extras "ui llms-ollama embeddings-ollama vector-stores-qdrant"
PGPT_PROFILES=ollama make run
