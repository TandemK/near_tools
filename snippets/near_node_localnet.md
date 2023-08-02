# docker container NEAR node
## For localnet
### Pull image and create enviroment
```
docker pull nearprotocol/nearcore:1.35.0
mkdir ~/nearNodeMaster
```
### Create defaults config
```
docker run --name node_master -d -v ~/nearNode/:/srv/ -e INIT=1 nearprotocol/nearcore:1.35.0 
docker rm node_master
```
### Create work node
```
docker run --name node_master -d -v ~/nearNode/:/srv/ -p3030:3030 nearprotocol/nearcore:1.35.0
```
