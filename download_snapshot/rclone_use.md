# Download snapshot database of node NEAR blockchaine
### Q. Why not aws-cli?
### A. Because aws-cli uses a single download thread. 
>Are you ready to wait more then 4 hours if you have speed of real download before 800MB/s?

About `rclone` you can read about project and more [this](https://rclone.org) .

And about snapshots of database NEAR nodes [this](https://near-nodes.io/intro/node-data-snapshots) .
### Install rclone
```
apt install rclone
```

### Create config  (or add if rclone installed and used)
```
mkdir -p ~/.config/rclone
touch ~/.config/rclone/rclone.conf
```
Paste into `rclone.conf` next rows
```
[near_s3]
type = s3
provider = AWS
location_constraint = EU
acl = public-read
server_side_encryption = AES256
region = ca-central-1
```

Get the file about the last snapshhot
```
rclone copy --no-check-certificate near_s3://near-protocol-public/backups/mainnet/rpc/latest ./
```

View info
```
cat latest
```
> (Exmpl: 2023-06-30T02:15:36Z)

Add this value to URL:
```
rclone copy --no-check-certificate --progress \
  near_s3://near-protocol-public/backups/mainnet/rpc/2023-06-30T02:15:36Z ./data_snap
```

By default downloading start with 4 threads.
If yoy increase threads add next key ` --tarnsfers=N `(where N is count of treads).
```
rclone copy --no-check-certificate --progress --transfers=6 \
  near_s3://near-protocol-public/backups/mainnet/rpc/2023-06-30T02:15:36Z ./data_snap
```
You can change the download destination path of `./data_snap` to another path.
Once downloaded, you should move the files folder to the node and rename it to `data`.

Or use this script for download 
```
#!/bin/bash
NET=mainnet
MODE=rpc

rclone copy --no-check-certificate near_s3://near-protocol-public/backups/mainnet/rpc/latest ./
LAST=$(cat latest)

rclone copy --no-check-certificate --progress --transfers=6 \
  near_s3://near-protocol-public/backups/$NET/$MODE/$LAST ./data_snap
```
