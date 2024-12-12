sleep $((RANDOM % 1800)); bash /config/script/tracker.sh /config/aria2.conf RPC 2>&1 | tee /config/tracker.log
