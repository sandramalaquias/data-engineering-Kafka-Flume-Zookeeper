# data-engineering-Kafka-Flume-Zookeeper
Here's a Docker Compose file to set up a container environment for Kafka, Flume, and Zookeeper. This setup ensures that all necessary components are properly configured and connected.


Este script foi feito usando Linux - Ubuntu - Description:	Ubuntu 22.04.4 LTS 
Pré-requisto: docker desktop instalado cujo tutorial pode ser encontrado em (https://docs.docker.com/desktop/install/ubuntu/)
    
### Preparação do Ambiente:
- Execute o clone desse GIT em um diretório específico e mantenha a formatação (diretórios e arquivos). O meu diretório raiz chama docker-kafka-flume. Os comandos são executados a partir do diretório raiz.
- Crie a imagem do Flume usando o arquivo Dockerfile. Execute: `` docker build -t apache-flume:1.11.0 ``
      
-   Inicie os contêineres executando: `docker-compose up`.

- O nome do cluster é **"puc"** conforme está na definição do container kafka-ui: `` KAFKA_CLUSTER_O_NAME=puc ``
        
 O arquivo docker-compose.yml está configurado para executar os containers do Kafka, Zookeeper e Flume.  
        
### **Verificando a Conexão entre Máquinas:**
 - Abra o Docker Desktop e acesse o contêiner `` flume-agent ``
    
 -  Na aba Exec,  Instale o utilitário ping executando: `apt update && apt install iputils-ping`.
        
 -   Execute  `` ping zookeeper `` e depois `` ping kafka-server `` para verificar a conexão. Devem executar sem problemas. Para sair do ping execute <crlt+c>.
        
4.  **Enviando Mensagens para o Kafka:**
    
-   Siga as instruções do arquivo "kafka comandos basicos" para criar o tópico  `` testTopic `` e enviar algumas mensagens 
 -   Verifique se a mensagem pode ser vista no Kafka-UI. No navegador execute `` localhost:8080 `` e selecione a aba  "Topic" - clique em "testTopic" -  clique em "messages".

 - Automaticamente, essa mensagem já deve ter sido consumida pelo Flume, pois o arquivo flume-config/config.conf foi estipulado puxar as mensagem de 10 em 10 segundos ("agent.sinks.file-sink.sink.rollInterval = 10").
 
5.  **Analisando Logs no Flume:**
    
    -   No Docker Desktop, acesse o contêiner "flume-agent' e selecione a opção "Files".
        
    -   Navegue até o diretório `/tmp` para visualizar os logs. O diretório para o qual as logs foram direcionadas está no arquivo flume-conf/config.conf => agent.sinks.file-sink.sink.directory = /tmp
        
    -   Procure por esse arquivo de log que contenha a mensagem enviada ao Kafka (qtde bytes >0)
    -   Dê um click com o botão direito e selecione "edit". Suas mensagens estarão presentes nesse arquivo.
  
Ao final, libere os containeres executando ``docker compose down``.
        

**Desafio Adicional:**

-   Implemente uma classe ou método no Flume para evitar a gravação de logs vazios.

    

Com esses passos simplificados, você deve conseguir configurar e testar o ambiente Kafka, Zookeeper e Flume de forma mais clara e direta.

Informações adicionais e configurações, sugiro procurar diretamente na documentação do Apache.

Divirta-se explorando essas tecnologias!
