# near_tools
for create nodes

<sub>docker build -t awscli https://raw.githubusercontent.com/TandemK/near_tools/main/dockerfile</sub>

> By default
> NETWORK = mainnet

<sub>docker run --name awscli --rm -e NETWORK=testnet -v $(pwd):/opt -d awscli</sub>
