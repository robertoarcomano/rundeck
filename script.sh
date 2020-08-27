#!/bin/bash

# 1. Download and launch rundeck image
docker run -d --name rundeck -p 4440:4440 rundeck/rundeck:3.3.2

# 2. Customize rundeck container
docker exec --user=root rundeck sed -ri "s/127.0.0.1:4440/rundeck.robertoarcomano.it/g" /etc/remco/templates/framework.properties /etc/remco/templates/rundeck-config.properties

# 3. Restart Container
docker stop rundeck; docker start rundeck

