#!/bin/bash

# Check if ~/docker-compose-edit.yml exists
if [[ -z $(cat ~/docker-compose-edit.yml 2>/dev/null) ]]; then
   echo "You need to have the docker-compose-edit.yml in your home folder"
   exit 1
fi

foldername=run

mkdir ~/$foldername || { echo 'Failed to create directory!' ; exit 1; }
chmod -R u+w $foldername || { echo 'Failed to give write permissions!' ; exit 1; }
touch ~/$foldername/docker-compose-run.yml || { echo 'Failed to create empty docker-compose-run.yml!' ; exit 1; }
cat ~/docker-compose-edit.yml > ~/$foldername/docker-compose-run.yml || { echo 'Failed to copy edit YAML to run YAML!' ; exit 1; }
chmod -R ugo-w ~/$foldername || { echo 'Failed revoke write permissions!' ; exit 1; }

echo "Done!"
