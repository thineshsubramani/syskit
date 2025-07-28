FROM python:3.11-slim

RUN apt-get update && apt-get install -y sshpass sudo \
 && pip install ansible \
 && ansible-galaxy collection install community.general

WORKDIR /kit
# Need some Metadata to run this container since it mounted to a host fs