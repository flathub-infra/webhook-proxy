FROM python:3.13-slim

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY main.py worker.py circuit_breaker.py entrypoint.sh ./
RUN chmod +x entrypoint.sh

ENV REDIS_URL=redis://redis:6379/0

EXPOSE 8000

ENTRYPOINT ["./entrypoint.sh"]
CMD ["web"]
