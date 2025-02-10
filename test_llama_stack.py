import os
from llama_stack_client import LlamaStackClient
import yaml

# Get the model ID from the environment variable
with open('llama_stack_config.yaml') as f:
    config = yaml.safe_load(f)
    INFERENCE_MODEL = config['INFERENCE_MODEL']
    port = config['LLAMA_STACK_PORT']

# Initialize the client
client = LlamaStackClient(base_url=f"http://localhost:{port}")

# Create a chat completion request
response = client.inference.chat_completion(
    messages=[
        {"role": "system", "content": "reply like a human."},
        {"role": "user", "content": "What is life in 2 lines."}
    ],
    model_id=INFERENCE_MODEL,
)

# Print the response
print(response.completion_message.content)
