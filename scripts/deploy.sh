#!/bin/sh
# install heroku toolbet
heroku plugins:install @heroku-cli/plugin-container-registry
# deploy to docker & heroku registy
if [ "$TRAVIS_BRANCH" = "master" ]; then
  TAG="latest"
elif [ "$TRAVIS_BRANCH" = "staging" ]; then
  TAG="staging"
else
  TAG="$TRAVIS_BRANCH"
fi
USER="walecloud/lepsta"
docker push $USER:$TAG
docker push registry.heroku.com/$HEROKU_APP_NAME/web;
# Deploy docker container as a web app and release it
heroku container:push web --app $HEROKU_APP_NAME
heroku container:release web --app $HEROKU_APP_NAME
echo "done"
