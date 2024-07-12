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

function json_ccp {
    local PP=$(one_line_pem $4)
    local CP=$(one_line_pem $5)
    local OP=$(one_line_pem $8)
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${P0PORT}/$2/" \
        -e "s/\${CAPORT}/$3/" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${CAPEM}#$CP#" \
        -e "s/\${ORGURL}/$6/" \
        -e "s/\${CAURL}/$7/" \
        -e "s#\${ORDPEM}#$OP#" \
        -e "s/\${CORG}/$CAPITALIZED_ORG/" \
        -e "s/\${ORDURL}/${10}/" \
        -e "s/\${ORDPORT}/${11}/" \
        ./ccp-template.json
}

function yaml_ccp {
    local PP=$(one_line_pem $4)
    local CP=$(one_line_pem $5)
    local OP=$(one_line_pem $8)
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${P0PORT}/$2/" \
        -e "s/\${CAPORT}/$3/" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${CAPEM}#$CP#" \
        -e "s/\${ORGURL}/$6/" \
        -e "s/\${CAURL}/$7/" \
        -e "s#\${ORDPEM}#$OP#" \
        -e "s/\${CORG}/$CAPITALIZED_ORG/" \
        -e "s/\${ORDURL}/${10}/" \
        -e "s/\${ORDPORT}/${11}/" \
        ./ccp-template.yaml | sed -e $'s/\\\\n/\\\n          /g'
}

ORGURL=$SERVER_IP
ORDURL=$SERVER_IP
CAURL=$SERVER_IP

ORG=merkaba
P0PORT=7051
CAPORT=7054
ORDPORT=7050
PEERPEM=../config/crypto-config/peerOrganizations/merkaba.com/tlsca/tlsca.merkaba.com-cert.pem
CAPEM=../config/crypto-config/peerOrganizations/merkaba.com/ca/ca.merkaba.com-cert.pem
ORDPEM=../config/crypto-config/ordererOrganizations/merkaba.com/tlsca/tlsca.merkaba.com-cert.pem
CAPITALIZED_ORG=$(capitalize_first_letter "$ORG")

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $ORGURL $CAURL $ORDPEM $CAPITALIZED_ORG $ORDURL $ORDPORT)" > connection-$ORG.json
echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $ORGURL $CAURL $ORDPEM $CAPITALIZED_ORG $ORDURL $ORDPORT)" > connection-$ORG.yaml

ORG=visa
P0PORT=8051
CAPORT=8054
PEERPEM=../config/crypto-config/peerOrganizations/visa.com/tlsca/tlsca.visa.com-cert.pem
CAPEM=../config/crypto-config/peerOrganizations/visa.com/ca/ca.visa.com-cert.pem
ORDPEM=../config/crypto-config/ordererOrganizations/merkaba.com/tlsca/tlsca.merkaba.com-cert.pem
CAPITALIZED_ORG=$(capitalize_first_letter "$ORG")

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $ORGURL $CAURL $ORDPEM $CAPITALIZED_ORG $ORDURL $ORDPORT)" > connection-$ORG.json
echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $ORGURL $CAURL $ORDPEM $CAPITALIZED_ORG $ORDURL $ORDPORT)" > connection-$ORG.yaml

ORG=bbva
P0PORT=9051
CAPORT=10054
PEERPEM=../config/crypto-config/peerOrganizations/bbva.com/tlsca/tlsca.bbva.com-cert.pem
CAPEM=../config/crypto-config/peerOrganizations/bbva.com/ca/ca.bbva.com-cert.pem
ORDPEM=../config/crypto-config/ordererOrganizations/merkaba.com/tlsca/tlsca.merkaba.com-cert.pem
CAPITALIZED_ORG=$(capitalize_first_letter "$ORG")

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $ORGURL $CAURL $ORDPEM $CAPITALIZED_ORG $ORDURL $ORDPORT)" > connection-$ORG.json
echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $ORGURL $CAURL $ORDPEM $CAPITALIZED_ORG $ORDURL $ORDPORT)" > connection-$ORG.yaml

ORG=santander
P0PORT=6051
CAPORT=11054
PEERPEM=../config/crypto-config/peerOrganizations/santander.com/tlsca/tlsca.santander.com-cert.pem
CAPEM=../config/crypto-config/peerOrganizations/santander.com/ca/ca.santander.com-cert.pem
ORDPEM=../config/crypto-config/ordererOrganizations/merkaba.com/tlsca/tlsca.merkaba.com-cert.pem
CAPITALIZED_ORG=$(capitalize_first_letter "$ORG")

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $ORGURL $CAURL $ORDPEM $CAPITALIZED_ORG $ORDURL $ORDPORT)" > connection-$ORG.json
echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $ORGURL $CAURL $ORDPEM $CAPITALIZED_ORG $ORDURL $ORDPORT)" > connection-$ORG.yaml
