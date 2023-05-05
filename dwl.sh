#!/bin/bash
echo Start
date | tee  script.log
NET=$NETWORK
#NET=mainnet
#NET=testnet

aws s3 --no-sign-request cp s3://near-protocol-public/backups/$NET/rpc/latest .
LATEST=$(cat latest)
echo "Snapshot in the $NET network - $LATEST"

echo "Start download..."
aws s3 sync --no-sign-request --delete s3://near-protocol-public/backups/$NET/rpc/$LATEST ./data_$NET\_$LATEST
echo "End download"
date | tee -a script.log
