# near_tools
for create nodes

```docker build -t awscli https://raw.githubusercontent.com/TandemK/near_tools/main/dockerfile```

> By default
> NETWORK = mainnet

```docker run --name awscli --rm -e NETWORK=testnet -v $(pwd):/opt -d awscli```
