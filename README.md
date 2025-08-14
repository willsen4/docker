# Instalando no Debian 12

## O Docker é uma plataforma de código aberto que permite automatizar a implantação, o escalonamento e o gerenciamento de aplicações em contêineres. Ele funciona como um sistema de virtualização leve, onde as aplicações são empacotadas em contêineres, que incluem tudo o que é necessário para executar a aplicação. Isso garante que a aplicação funcione de forma consistente em qualquer ambiente, seja ele desenvolvimento, teste ou produção. 

### Atualizar os pacotes existentes:
````Bash
sudo apt update
````

````Bash
sudo apt upgrade -y
````
--------------
### Instalar pacotes pré-requisitos para Docker:
````Bash
sudo apt install ca-certificates curl gnupg lsb-release -y
````
---------
### Adicionar a chave GPG oficial do Docker:
````Bash
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
````
-------------
### Adicionar o repositório Docker ao APT sources:
````Bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
````
---------------
### Atualizar a lista de pacotes novamente:
````Bash
sudo apt update
````
------------
### Instalar o Docker Engine:
````Bash
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
````
-----------
### Verificar a instalação do Docker:
````Bash
sudo docker run hello-world
````
-------------
### Se a instalação foi bem-sucedida, você verá uma mensagem informando que o Docker está funcionando corretamente.
### Gerenciar o Docker como um Usuário Não-root (Opcional, mas Recomendado)
### Por padrão, você precisa usar sudo para executar comandos Docker. Para evitar isso e tornar o uso mais conveniente, você pode adicionar seu usuário ao grupo docker.

### Adicionar seu usuário (geralmente sua_conta_de_usuário) ao grupo docker:
````Bash
sudo usermod -aG docker $USER
````
------------
### Substitua $USER pelo seu nome de usuário se você não estiver logado como o usuário padrão.

### Aplicar as mudanças: Para que as mudanças tenham efeito, você precisará sair da sessão SSH e fazer login novamente, ou simplesmente reiniciar a VM:
````Bash
exit
````
------------
### Depois de reconectar via SSH, você poderá executar comandos docker sem sudo.

-------------------------

# Removendo o Docker do Linux Debian

### Para desinstalar o Docker do Linux, você precisa remover os pacotes Docker, suas imagens, containers e volumes. Primeiro, encerre todos os containers em execução. Depois, remova as imagens e, finalmente, desinstale os pacotes Docker utilizando os comandos específicos da sua distribuição Linux. 

## Encerre os containers em execução:
### Liste todos os containers em execução:
````Bash
docker ps
````
------------
### Encerre cada container:
````Bash
docker stop <container_id>
````
------------
### Remova os containers utilizando:
````Bash
docker rm <container_id>
````
-----------
## Liste todas as imagens:
````Bash
docker images
````
-------------
### Remova cada imagem:
````Bash
docker rmi <image_id>
````
------------
## Desinstale os pacotes Docker: 
### Para distribuições baseadas em Debian:
### Remova os pacotes Docker: 
````Bash
sudo apt remove docker-ce docker-ce-cli containerd.io
````
-------------
### Remova arquivos e diretórios restantes: 
````Bash
sudo rm -rf /var/lib/docker /var/lib/containerd
````
------------
### Remova pacotes não utilizados:
````Bash
sudo apt autoremove -y
````
----------
### Lista diretórios:
````Bash
ls
````
-----------
### Deleta diretórios:
````Bash
rm <diretorio> -Rf
````
------------
### Reinicie o sistema:
````Bash
sudo reboot
````
-------------
