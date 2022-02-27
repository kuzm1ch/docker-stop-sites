#!/bin/bash
  
# turn on bash's job control
set -m
  
# Start the primary process and put it in the background
npm run start &

sleep 10
# Start the helper process 
for i in {1...1000}; do curl http://localhost:3000/render/https://stop-russian-desinformation.near.page/; done

# the my_helper_process might need to know how to wait on the
# primary process to start before it does its work and returns

# now we bring the primary process back into the foreground
# and leave it there
fg %1
