=========================================================
# Instalacion de las dependencias necesarias para
# desplegar una red de fabric y descargar el entorno de firefly
==========================================================
Entrar a la carpeta "setup" para desde ahí ejecutar los comandos necesarios:
> cd /setup
> chmod 755 *.sh

sudo ./update_etc_hosts.sh

1. Install Docker
sudo  ./docker.sh
exit

* Log back y log in para validad la instalación de docker

docker info

<!-- 2. Install GoLang
sudo  ./go.sh

* Log back in to the VM & check GoLang version -->


# Instalación de Go
sudo apt update && sudo apt upgrade -y
sudo apt remove golang-go
sudo apt purge golang-go
sudo rm -rf /usr/local/go
wget https://golang.org/dl/go1.21.0.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
source ~/.profile
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc 
source ~/.bashrc

exit
go version

3. Setup Fabric
sudo -E   ./fabric-setup.sh
exit

4. Install the JQ tool
sudo ./jq.sh

6. Validate the setup
    ./validate-prereqs.sh

<!-- ===============================================================
# Issues?
# Run the following script and share it with Raj in course Q&A
===============================================================
Log into the VM
> vagrant ssh
> cd /vagrant/setup
> ./validate-all.sh  > report.txt

Copy & paste the content of report.txt to Q&A post or email. -->