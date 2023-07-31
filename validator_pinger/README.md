# Scripts for NEAR nodes
## near_pinger_v2.sh
For 'ping' account validator before change epoch with minimum interval.

In crontab add row:
```
*/10 * * * * /path_to_script/near_pinger_v2.sh
```
The script checks every 10 minutes for an epoch number change and pings the account after it`s changed.
