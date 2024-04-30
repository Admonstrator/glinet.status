#!/bin/bash

# Step 1: Get the current IP of ns1.glddns.com using 9.9.9.9 as the resolver
current_ip=$(dig @9.9.9.9 ns2.glddns.com A +short)

# Step 2: Query for ns1.glddns.com A record using the retrieved IP as the DNS server
queried_ip=$(dig @ns2.glddns.com ns2.glddns.com A +short)

# Step 3 & 4: Compare the IPs and set the exit code accordingly
if [ "$queried_ip" == "$current_ip" ]; then
	echo "DNS resolution is working fine for ns2.glddns.com"
	exit 0
else
	echo "DNS resolution outtage for for ns2.glddns.com"
	exit 80
fi
