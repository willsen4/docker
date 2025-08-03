# Instalando no Ubuntu ou Debian

### Atualizar os pacotes existentes:
````Bash
sudo apt update
sudo apt upgrade -y
````
### Instalar pacotes pré-requisitos para Docker:
````Bash
sudo apt install ca-certificates curl gnupg lsb-release -y
````
### Adicionar a chave GPG oficial do Docker:
````Bash
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
````
### Se estiver usando Debian, troque ubuntu por debian no comando acima.
````Bash
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
````
### Adicionar o repositório Docker ao APT sources:
````Bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
````
### Novamente, se for Debian, troque ubuntu por debian no caminho do URL.
````Bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
````
### Atualizar a lista de pacotes novamente:
````Bash
sudo apt update
````
### Instalar o Docker Engine:
````Bash
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
````
### Verificar a instalação do Docker:
````Bash
sudo docker run hello-world
````
### Se a instalação foi bem-sucedida, você verá uma mensagem informando que o Docker está funcionando corretamente.
### Gerenciar o Docker como um Usuário Não-root (Opcional, mas Recomendado)
### Por padrão, você precisa usar sudo para executar comandos Docker. Para evitar isso e tornar o uso mais conveniente, você pode adicionar seu usuário ao grupo docker.

### Adicionar seu usuário (geralmente sua_conta_de_usuário) ao grupo docker:
````Bash
sudo usermod -aG docker $USER
````
### Substitua $USER pelo seu nome de usuário se você não estiver logado como o usuário padrão.

### Aplicar as mudanças: Para que as mudanças tenham efeito, você precisará sair da sessão SSH e fazer login novamente, ou simplesmente reiniciar a VM:
````Bash
exit
````
### Depois de reconectar via SSH, você poderá executar comandos docker sem sudo.
