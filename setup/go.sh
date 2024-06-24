#!/bin/bash

# Verifica si el script se está ejecutando con permisos de sudo
if [[ $EUID -ne 0 ]]; then
    echo "Este script debe ejecutarse con permisos de sudo" 
    exit 1
fi

# Verifica si la variable GOROOT ya está configurada
if [ -z "$GOROOT" ]; then
    echo "GOROOT no está configurado. Procediendo con la instalación de Go."

    # Actualiza el sistema
    echo "Actualizando el sistema..."
    sudo apt update && sudo apt upgrade -y

    # Descarga la versión específica de Go
    echo "Descargando Go 21.0..."
    wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz

    # Extrae el archivo descargado
    echo "Extrayendo Go..."
    sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz

    # Configura las variables de entorno
    echo "Configurando variables de entorno en .profile..."
    if ! grep -q '/usr/local/go/bin' ~/.profile; then
        echo 'export GOROOT=/usr/local/go' >> ~/.profile
        echo 'export GOPATH=$HOME/go' >> ~/.profile
        echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> ~/.profile
    fi

     # Configura las variables de entorno
    echo "Configurando variables de entorno en .bashrc..."
    if ! grep -q '/usr/local/go/bin' ~/.bashrc; then
        echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
        echo 'export GOPATH=$HOME/go' >> ~/.bashrc
        echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> ~/.bashrc
    fi

    # Aplica los cambios a la sesión actual
    export GOROOT=/usr/local/go
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

    # Verifica la instalación
    if go version > /dev/null 2>&1; then
        echo "Go se ha instalado correctamente. Versión:"
        go version
    else
        echo "Hubo un problema con la instalación de Go."
    fi
else
    echo "GOROOT está configurado. Go ya está instalado."
fi
