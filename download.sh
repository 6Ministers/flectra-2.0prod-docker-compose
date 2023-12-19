#!/bin/bash

DESTINATION=$1

# clone Flectra directory
git clone --depth=1 https://github.com/6Ministers/flectra-2.0prod-docker-compose $DESTINATION
rm -rf $DESTINATION/.git

# set permission
mkdir -p $DESTINATION/postgresql
sudo chmod -R 777 $DESTINATION

