FROM ubuntu:latest
RUN apt-get update && apt-get install -y bash
COPY . /app
WORKDIR /app
RUN chmod +x ./entrypoint.sh ./scripts/db/*.sh ./scripts/tables/*.sh
ENTRYPOINT ["bash", "/app/entrypoint.sh"]

