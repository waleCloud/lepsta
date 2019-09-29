#!/bin/bash
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
if [ "$TRAVIS_BRANCH" = "master" ]; then
  TAG="latest"
elif [ "$TRAVIS_BRANCH" = "staging" ]; then
  TAG="staging"
else
  TAG="$TRAVIS_BRANCH"
fi
USER="walecloud/lepsta"
docker build -f Dockerfile -t $USER:$TAG .
docker tag $USER:$TAG registry.heroku.com/$HEROKU_APP_NAME/web
