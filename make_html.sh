#!/bin/bash

git checkout master
git pull
git checkout emqtt.com && git merge master
source .venv/bin/activate && make html
cp -r build/html/* ../emqtt.com/public/docs/v1/
