#!/bin/sh

# Descargar el script de instalación de Hyperledger Fabric
curl -sSLO https://raw.githubusercontent.com/hyperledger/fabric/main/scripts/install-fabric.sh

# Hacer el script ejecutable
chmod +x install-fabric.sh


# Ejecutar el script de instalación con los parámetros especificados
./install-fabric.sh docker samples binary

export PATH=$PATH:$PWD/fabric-samples/bin/
echo "export PATH=$PATH:$PWD/fabric-samples/bin/" >> ~/.bashrc 
source ~/.bashrc