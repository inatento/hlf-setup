#!/bin/bash
#Check if the TLS is enabled
TLS_PARAMETERS=""
if [ "$CORE_PEER_TLS_ENABLED" == "true" ]; then
   echo "*** Executing with TLS Enabled ***"
   TLS_PARAMETERS=" --tls true --cafile $ORDERER_CA_ROOTFILE"
fi

peer channel create -c cooperativachannel -f ./config/cooperativachannel.tx --outputBlock ./config/cooperativachannel.block -o $ORDERER_ADDRESS $TLS_PARAMETERS
