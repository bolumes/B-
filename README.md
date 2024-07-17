Relatório do Projeto B: Implantação de Serviços com Docker Swarm
Introdução
Este projeto visa a implantação de múltiplos serviços Docker utilizando o Docker Swarm. O Docker Swarm é uma ferramenta de orquestração que permite gerenciar um cluster de contêineres Docker como um único sistema. Neste projeto, configuramos e implantamos os seguintes serviços:
	Web Application (webapp)
	WebSocket Service (websocket)
	Database (db)
	Visualizer

Estrutura de projeto
 
![Arquitetura ProjetoB](https://github.com/user-attachments/assets/aa24ff42-620f-4490-8888-78772a4fdb51)



Construção de imagens
cd ./database
docker build -t ProjetoB/Database.(imagem oficial de postgres)
cd ./webapp
docker build -t ProjetoB/Webapp.
cd ../websocket
docker build -t ProjetoB/Websocket.
 













Ambiente
O ambiente de desenvolvimento e implantação consiste em um cluster Docker Swarm com tres nós:

	Node 1: Líder do Swarm
	Node 2: Worker no Swarm
	Node 3: Worker no Swarm 
	
Configuração dos Serviços
O arquivo docker-compose.yml define a configuração dos serviços que serão implantados no Swarm. A versão final do arquivo é a seguinte:
version: '3.8'

services:
  app:
    image: bobonntcha12/meu-app:latest
    ports:
      - "80:80"
    deploy:
      replicas: 3  # Definindo 3 réplicas para o serviço
      placement:
        constraints:
          - node.role == worker

  db:
    image: bobonntcha12/postgres:14.5
    environment:
      POSTGRES_DB: mydatabase
      POSTGRES_USER: myuser
      POSTGRES_PASSWORD: mypassword
    volumes:
      - pgdata:/var/lib/postgresql/data
    deploy:
      replicas: 1  # Definindo 1 réplica para o serviço
      placement:
        constraints:
          - node.role == worker

  ws:
    image: bobonntcha12/php-websocket-server:latest
    ports:
      - "8000:80"
    deploy:
      replicas: 2  # Definindo 2 réplicas para o serviço
      placement:
        constraints:
          - node.role == worker

  visualizer:
    image: dockersamples/visualizer:stable
    ports:
      - "8888:8080"
    volumes:
      - "/var/run/docker.sock:/var/run/docker.sock"
    deploy:
      replicas: 1  # Definindo 1 réplica para o serviço
      placement:
        constraints:
          - node.role == manager

volumes:
  pgdata:
Etapas do Projeto
1. Configuração do Docker Swarm
O Docker Swarm foi inicializado e os nós foram configurados conforme necessário. A seguir, os nós foram adicionados ao Swarm:

	webapp  como líder
	ws como worker
	bd  como worker

2. Implantação dos Serviços
Os serviços foram implantados usando o comando docker stack deploy:
sudo docker stack deploy -c docker-compose.yml projb

3. Problemas encontradas ao longo de finguraçao
	projb_db: 1/1 réplicas em execução
	projb _visualizer: 1/1 réplicas em execução
	projb _webapp: 3/3 réplicas em execução
	projb _websocket: 2/2 réplicas em execução
