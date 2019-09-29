#!/bin/bash
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
if [ "$TRAVIS_BRANCH" = "master" ]; then
  TAG="latest"
  HEROKU_APP_NAME="$HEROKU_PROD_NAME"
elif [ "$TRAVIS_BRANCH" = "staging" ]; then
  TAG="staging"
  HEROKU_APP_NAME="$HEROKU_STAGING_NAME"
else
  TAG="$TRAVIS_BRANCH"
  HEROKU_APP_NAME="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t $DOCKER_REPO_NAME:$TAG .
docker tag $DOCKER_REPO_NAME:$TAG registry.heroku.com/$HEROKU_APP_NAME/web
