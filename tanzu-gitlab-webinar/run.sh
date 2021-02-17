#!/bin/bash

########################
# include the magic
########################
. demo-magic.sh

########################
# Configure the options
########################

#
# speed at which to simulate typing. bigger num = faster
#
TYPE_SPEED=18

#
# custom prompt
#
# see http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html for escape sequences
#
#DEMO_PROMPT="${GREEN}➜ ${CYAN}\W "

# hide the evidence
clear


#TBS
DEMO_PROMPT="${GREEN}➜ TBS ${CYAN}\W "
pe "kubectl config use-context tanzu-gitlab-build-service-admin@tanzu-gitlab-build-service"
echo

pe "kp image list"
echo

pe "clear"


#CREATE IMAGES NOW - DURING EXECUTION EXPLAIN COMMAND PARAMS, LIST ALL TARGET CLUSTERS, CHECK STATUS or CHECK BUILD LOGS
pe "kp image create aspnet-core --tag registry.gitlab.com/gitlab-com/alliances/vmware/sandbox/vmworld-2020-demo/spring-music/aspnet-core --git https://github.com/nycpivot/dotnet-docker.git"
echo

pe "clear"
echo

pe "kp image status aspnet-core"
echo
