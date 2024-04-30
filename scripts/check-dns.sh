#!/bin/bash
DIR=$(dirname "$(readlink -f "$0")")
WEBSITES=$(cat "$DIR"/../status_dns_list.txt)
TIMEOUT="10"
for WEBSITE in $WEBSITES
do
	# Check DNS resolution of domain glddns.com via DNS servers from status_dns_list.txt
	# Exit with returncode 80 if one is failing
	/usr/bin/dig +short glddns.com @"$WEBSITE" || exit 80
done
exit 0
