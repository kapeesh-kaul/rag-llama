#!/bin/bash

# Use Python to parse the YAML and extract values
CONFIG_FILE="llama_stack_config.yaml"
OLLAMA_URL=$(python3 -c "import yaml; print(yaml.safe_load(open('$CONFIG_FILE'))['OLLAMA_URL'])")
LLAMA_STACK_PORT=$(python3 -c "import yaml; print(yaml.safe_load(open('$CONFIG_FILE'))['LLAMA_STACK_PORT'])")
INFERENCE_MODEL=$(python3 -c "import yaml; print(yaml.safe_load(open('$CONFIG_FILE'))['INFERENCE_MODEL'])")
SAFETY_MODEL=$(python3 -c "import yaml; print(yaml.safe_load(open('$CONFIG_FILE'))['SAFETY_MODEL'])")

# Run the Llama stack command directly with parsed values
llama stack run ollama \
    --port $LLAMA_STACK_PORT \
    --env INFERENCE_MODEL=$INFERENCE_MODEL \
    --env SAFETY_MODEL=$SAFETY_MODEL \
    --env OLLAMA_URL=$OLLAMA_URL
