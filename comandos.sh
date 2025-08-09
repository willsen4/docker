# Reiniciar o Docker
sudo systemctl restart docker

# Lista Diretorio
ls
# Lista permissões do diretório
ls -ld

# Lista log
docker logs nome do conteiner
# exemplo: 
docker logs mysql-app

# Cria diretório
mkdir nome_do_diretorio
# exemplo: 
mkdir mysql-docker
# se der permissão negada só entra como sudo su

# Remove diretorio
rm nome_do_diretorio -Rf
# exemplo: 
rm mysql-docker -Rf

# Entra na pasta do mysql
cd mysql-docker

# Reinicia o serviço
docker compose restart nome conteiner
# exemplo: 
docker compose restart mysql-app

# Remove o conteineres
docker compose down

# Recriar os conteineres
docker compose up -d

# Forçar a recriar os conteineres
docker compose up -d --force-recreate

# Acessar o Shell no conteiner
docker exec -it nome do conteiner bash
# exemplo: 
docker exec -it glpi-app bash
docker exec -it mysql-app mysql -uroot -p
