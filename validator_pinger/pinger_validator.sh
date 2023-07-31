#!/bin/bash
# Address and port RPC node
# It can be a private node or a public RPC-node (https://docs.near.org/api/rpc/providers)
RPC_IP=http://127.0.0.1
RPC_PORT=3030

LOG=/var/log/near_pinger.log
STORAGE=/var/log/near_pinger_last_epoch.txt

NEAR_ENV=mainnet
ACCOUNT=       # who call "ping" - mypinger.near
VALIDATOR=     # full name of account validator - nearfound.poolv1.near

# get current epoch
CURR_EPOCH=$(curl -s $RPC_IP:$RPC_PORT/metrics | grep "^near_epoch_height" | cut -d ' ' -f2)
RUN_PING=false
# create new file for store epoch
if [ ! -f $STORAGE ]; then
    RUN_PING=true
    echo $CURR_EPOCH | tee $STORAGE
fi
# read prevision epoch
PREV_EPOCH=$(tail $STORAGE)
echo "Prev epoch $PREV_EPOCH. Current epoch $CURR_EPOCH."
if [ "$CURR_EPOCH" != "$PREV_EPOCH" ] && [ "$CURR_EPOCH" != "" ] ; then 
    RUN_PING=true
    echo $CURR_EPOCH | tee $STORAGE
fi

echo $RUN_PING
if  $RUN_PING ; then
    echo "Epoch $CURR_EPOCH" | tee -a $LOG
    # run call "ping". About near-cli read https://docs.near.org/tools/near-cli
    near call $VALIDATOR ping '{}' --accountId $ACCOUNT 2>&1 | tee -a $LOG
fi
