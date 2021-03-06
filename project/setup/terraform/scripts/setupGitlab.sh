#!/bin/sh

#Install Docker
sudo apt-get update
sudo apt-get install docker.io

# Create script that starts gitlab container
touch startGitlab.sh

## File content
echo "docker run --detach --hostname loclahost --publish 443:443 --publish 80:80 --name gitlab --restart always --volume /srv/gitlab/config:/etc/gitlab --volume /srv/gitlab/logs:/var/log/gitlab --volume /srv/gitlab/data:/var/opt/gitlab gitlab/gitlab-ce:latest" > startGitlab.sh
##

# Starting GitLab server
sudo chmod +x ./startGitlab.sh
sudo sh startGitlab.sh

# Installing ansible
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update --fix-missing
sudo apt-get install ansible -y
