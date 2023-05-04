#!/bin/bash
date | tee  script.log
NET=testnet
#NET=mainnet
aws s3 --no-sign-request cp s3://near-protocol-public/backups/$NET/rpc/latest .
LATEST=$(cat latest)
echo $LATEST

aws s3 cp --no-sign-request --recursive s3://near-protocol-public/backups/$NET/rpc/$LATEST ./data_$NET\_$LATEST
aws s3 sync --no-sign-request  s3://near-protocol-public/backups/$NET/rpc/$LATEST ./data_$NET\_$LATEST
date | tee -a script.log
