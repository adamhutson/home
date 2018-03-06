#! /bin/bash
USERNAME=$1
TOKEN$2
ORGANIZATION=$3

mkdir -p ~/github.com/$3/repos
cd ~/github.com/$3/repos
for i in `curl -u $1:$2 https://api.github.com/orgs/confluentinc/repos | grep clone_url | cut -d ':' -f 2-3|tr -d '",'`
do git clone $i
done
