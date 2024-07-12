#!/bin/bash
SERVER_IP=$(curl -s ifconfig.me)
export SERVER_IP

function one_line_pem {
    echo "`awk 'NF {sub(/\\n/, ""); printf "%s\\\\\\\n",$0;}' $1`"
}

# Función para capitalizar la primera letra de una cadena
capitalize_first_letter() {
    echo "$1" | awk '{print toupper(substr($0, 1, 1)) tolower(substr($0, 2))}'
}

function yaml_ccp {
    local PP=$(one_line_pem ${12})
    local AP=$(one_line_pem ${13})
    local TP=$(one_line_pem ${14})
    local OP=$(one_line_pem ${15})
    local PTP=$(one_line_pem ${16})
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${CORG}/$CAPITALIZED_ORG/" \
        -e "s/\${P1PORT}/$3/" \
        -e "s/\${CAPORT}/$4/" \
        -e "s/\${ORDPORT}/$5/" \
        -e "s/\${ORGURL}/$6/" \
        -e "s/\${CAURL}/$7/" \
        -e "s/\${ORDURL}/$8/" \
        -e "s/\${CHANNEL}/$9/" \
        -e "s#\${CRYPTO_PATH}#$CRYPTO_PATH#" \
        -e "s#\${ORD_TLS_PATH}#$ORD_TLS_PATH#" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${ADMIN_PEM}#$AP#" \
        -e "s#\${TLS_PEM}#$TP#" \
        -e "s#\${ORDPEM}#$OP#" \
        -e "s#\${PEER_TLS_PEM}#$PTP#" \
        ./template_ccp.yml | sed -e $'s/\\\\n/\\\n          /g'
}

ORGURL=$SERVER_IP
ORDURL=$SERVER_IP
CAURL=$SERVER_IP
CHANNEL=cooperativachannel

ORG=merkaba
P1PORT=7051
CAPORT=7054
ORDPORT=7050
CAPITALIZED_ORG=$(capitalize_first_letter "$ORG")
ORD_TLS_PATH=$HOME/hlf-setup/docker/config/crypto-config/ordererOrganizations/merkaba.com/tlsca/tlsca.merkaba.com-cert.pem
CRYPTO_PATH=$HOME/hlf-setup/docker/config/crypto-config/peerOrganizations/$ORG.com/
PEERPEM=/home/tesseract/hlf-setup/docker/config/crypto-config/peerOrganizations/merkaba.com/users/Admin@merkaba.com/msp/keystore/priv_sk
ADMIN_PEM=/home/tesseract/hlf-setup/docker/config/crypto-config/peerOrganizations/merkaba.com/users/Admin@merkaba.com/msp/signcerts/Admin@merkaba.com-cert.pem
TLS_PEM=/home/tesseract/hlf-setup/docker/config/crypto-config/peerOrganizations/merkaba.com/msp/tlscacerts/tlsca.merkaba.com-cert.pem
ORDPEM=/home/tesseract/hlf-setup/docker/config/crypto-config/ordererOrganizations/merkaba.com/tlsca/tlsca.merkaba.com-cert.pem
PEER_TLS_PEM=/home/tesseract/hlf-setup/docker/config/crypto-config/peerOrganizations/merkaba.com/tlsca/tlsca.merkaba.com-cert.pem

echo "$(yaml_ccp $ORG $CAPITALIZED_ORG $P1PORT $CAPORT $ORDPORT $ORGURL $CAURL $ORDURL $CHANNEL $CRYPTO_PATH $ORD_TLS_PATH $PEERPEM $ADMIN_PEM $TLS_PEM $ORDPEM $PEER_TLS_PEM)" > connection-$ORG.yml

# ORG=visa
# P0PORT=8051
# CAPORT=8054
# CAPITALIZED_ORG=$(capitalize_first_letter "$ORG")

# echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $ORGURL $CAURL $ORDPEM $CAPITALIZED_ORG $ORDURL $ORDPORT)" > connection-$ORG.yaml

# ORG=bbva
# P0PORT=9051
# CAPORT=10054
# CAPITALIZED_ORG=$(capitalize_first_letter "$ORG")

# echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $ORGURL $CAURL $ORDPEM $CAPITALIZED_ORG $ORDURL $ORDPORT)" > connection-$ORG.yaml

# ORG=santander
# P0PORT=6051
# CAPORT=11054
# CAPITALIZED_ORG=$(capitalize_first_letter "$ORG")

# echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $ORGURL $CAURL $ORDPEM $CAPITALIZED_ORG $ORDURL $ORDPORT)" > connection-$ORG.yaml
