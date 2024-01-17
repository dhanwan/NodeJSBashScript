#!/bin/bash
# import the Environment variable form env
source env.sh


if [ -d "$APP_PATH" ];then
echo "----------------- Directory name is :- $APP_PATH -------------"
	echo "Code has been Cloned. Directory exists."
	cd "$APP_PATH"

	echo "------------------Git checkout-----------------"
	git stash
	git pull origin $BRANCH

	echo "----------------npm installation-------------------"
	npm install
else
	echo "Directory Does not exist. Git clong is running now"
	echo "--------------Git clone $REPO_URL------------------"
	git clone $REPO_URL -b $BRANCH

        echo "----------------npm installation-------------------"
	cd $APP_PATH
        npm install


fi


# Check if the app is already running
if pm2 show $APP_NAME > /dev/null; then
  # App is running, restart it
  echo "Restarting $APP_NAME..."
  pm2 stop $APP_NAME
  pm2 start $APP_NAME
else
  # App is not running, start it
  echo "Starting $APP_NAME..."
  cd $APP_PATH
  pm2 start $SCRIPT_FILE --name $APP_NAME
fi
