FROM ollama/ollama:latest

EXPOSE 11434

RUN apt-get update && apt-get install -y python3 python3-pip

COPY app /app
WORKDIR /app
RUN pip3 install --no-cache-dir -r requirements.txt

RUN ollama pull codellama:7b-instruct

CMD ["sh", "-c", "ollama serve & uvicorn main:app --host 0.0.0.0 --port 8000"]
