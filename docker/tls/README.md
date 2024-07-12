=======================
# Testing the TLS Setup
=======================

1. Launch the setup with TLS enabled
./clean.sh all
./init-setup.sh   tls

2. Test the setup



==============
# Manual Steps
==============
peer channel create -c cooperativachannel -f ./config/cooperativachannel.tx -o $ORDERER_ADDRESS --tls true --cafile $ORDERER_CA_ROOTFILE

--outputBlock config/cooperativachannel.block

peer channel join   -b ./cooperativachannel.block -o $ORDERER_ADDRESS 