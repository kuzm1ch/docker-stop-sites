#!/bin/bash

# turn on bash's job control
set -m

# Start the primary process and put it in the background
# rendertron - headless Chrome rendering solution
npm run start &

# the curl  might need to know how to wait on the
# primary process to start before it does its work and returns
sleep 10

# Start open stop-russions-desinform site
for i in {1..1000}; do curl http://localhost:3000/render/https://stop-russian-desinformation.near.page/ && sleep 15; done &

# now we bring the primary process back into the foreground
# and leave it there
fg %1

# Wait for any process to exit
wait -n

# Exit with status of process that exited first
exit $?
