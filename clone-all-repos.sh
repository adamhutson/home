#! /bin/bash
# to execute: $ bash clone-all-repos.sh your_username your_token desired_org

# more documentation at https://developer.github.com/v3
USERNAME=$1
TOKEN=$2
ORGANIZATION=$3

mkdir -p ~/github.com/$3
cd ~/github.com/$3

total_repos=`curl -u $1:$2 https://api.github.com/orgs/$3 | grep total_private_repos | cut -d ':' -f 2-3|tr -d '",'`

page=0
for repo in `seq 1 30 $total_repos`
do
  page=$(($page+1))
  for i in `curl -u $1:$2 https://api.github.com/orgs/$3/repos?page=$page | grep clone_url | cut -d ':' -f 2-3|tr -d '",'`
    do git clone $i
  done  
done

