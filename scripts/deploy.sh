#!/bin/sh
# install heroku toolbet
heroku plugins:install @heroku-cli/plugin-container-registry
# deploy to docker & heroku registy
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
docker push $DOCKER_REPO_NAME:$TAG
docker push registry.heroku.com/$HEROKU_APP_NAME/web;
# Deploy docker container as a web app and release it
heroku container:push web --app $HEROKU_APP_NAME
heroku container:release web --app $HEROKU_APP_NAME
echo "done"
