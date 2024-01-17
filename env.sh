#!/bin/bash
APP_NAME="test-app"
REPO_URL="git@github.com:dhanwan/jenkins-nodejs.git"
BRANCH="main"
APP_PATH=$(echo "$REPO_URL" | awk -F'/' '{split($NF, a, "."); print a[1]}')
SCRIPT_FILE="index.js"