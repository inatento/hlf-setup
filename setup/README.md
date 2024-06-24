=========================================================
# Instalacion de las dependencias necesarias para
# desplegar una red de fabric y descargar el entorno de firefly
==========================================================
Entrar a la carpeta "setup" para desde ahí ejecutar los comandos necesarios:
> cd /setup
> chmod 755 *.sh

1. Install Docker
sudo  ./docker.sh
exit

* Log back y log in para validad la instalación de docker

docker info

2. Install GoLang
sudo  ./go.sh

* Log back in to the VM & check GoLang version

exit
go version

** En caso de no ver go instalado al hacer log out/in, aplciar manualmente los siguientes comandos:
export GOROOT=/usr/local/go
export GOPATH=$PWD/../gopath
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> ~/.bashrc

echo 'export GOROOT=/usr/local/go' >> ~/.profile
echo 'export GOPATH=$HOME/go' >> ~/.profile
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> ~/.profile

source ~/.profile
source ~/.bashrc


3. Setup Fabric
sudo -E   ./fabric-setup.sh
exit

4. Install the JQ tool
sudo ./jq.sh

6. Validate the setup
    ./validate-prereqs.sh

===============================================================
# Issues?
# Run the following script and share it with Raj in course Q&A
===============================================================
Log into the VM
> vagrant ssh
> cd /vagrant/setup
> ./validate-all.sh  > report.txt

Copy & paste the content of report.txt to Q&A post or email.