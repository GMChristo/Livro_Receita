docker container stop visitacao_browser
docker container rm visitacao_browser  
REM docker image rm visitacao_browser  
docker build -t visitacao_browser .
docker run -d -p 8085:8084 --name visitacao_browser --restart always visitacao_browser
