FROM dockette/rendertron:latest

RUN apt-get update && apt-get -y install curl

ENV SITE="https://stop-russian-desinformation.near.page/"

# script to run rendertron and open URL https://stop-russian-desinformation.near.page/ 
COPY script.sh config.json ./

# tune permissions
RUN chmod 777 config.json 
RUN chmod +x script.sh 

CMD ./script.sh
