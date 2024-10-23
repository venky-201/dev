"ineed remove unused container last 24 hours and volume and network"

#!/bin/bash
list_stoped_container =$(docker ps -a --filter"status=exicited" --filter"sattus=creates"--formate"{{.id}} {{.createdat}}"| while read -r id createdat; do

created_seconds=$(date -d "$created_at"+%s )
current_seconds=$(date +%s)
age=$((current_seconds-created_seconds))
 if [$age -gt 86400]; then
     echo "$id"
 fi
done)
if [! -z "$list_stoped_container"] # -z check varible empty ornot 
    echo  " remove  conianers:$list_stoped_container"
   docker rm $list_stoped_container
else 
    echo "no stoped containers"
fi
# remove unused volumes
  docker volume prune -f
# remove unused network
 docker network prune -f