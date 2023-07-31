# Container with aws-cli
For create image
```
docker build -t awscli https://raw.githubusercontent.com/TandemK/near_tools/main/dockerfile
```
Run container for donloading latest snapshot for mainnet
```
docker run --name awscli --rm -v $(pwd):/opt -d awscli
```
> By default network is mainnet. Add variable `NETWORK` for other networks.
```
docker run --name awscli --rm -e NETWORK=testnet -v $(pwd):/opt -d awscli
```
