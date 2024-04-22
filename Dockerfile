# Use uma imagem base do Java
FROM openjdk:8-jdk-slim

# Informações do mantenedor da imagem
LABEL maintainer="sandrammalaquias@gmail.com"

# Definir variáveis de ambiente
ENV FLUME_HOME /opt/apache-flume
ENV PATH $FLUME_HOME/bin:$PATH

# Baixar e instalar o Apache Flume
WORKDIR /opt
RUN apt-get update && apt-get install -y wget && \
    wget https://downloads.apache.org/flume/1.11.0/apache-flume-1.11.0-bin.tar.gz && \
    tar -xvzf apache-flume-1.11.0-bin.tar.gz && \
    rm apache-flume-1.11.0-bin.tar.gz && \
    mv apache-flume-1.11.0-bin apache-flume

# Expor o diretório de configuração
VOLUME $FLUME_HOME/conf

# Definir o diretório de trabalho padrão
WORKDIR $FLUME_HOME

# Comando padrão ao iniciar o contêiner
CMD ["bin/flume-ng", "agent", "-n", "agentName", "-c", "conf", "-f", "conf/flume.conf"]

