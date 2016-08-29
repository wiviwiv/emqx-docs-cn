#!/bin/bash

git checkout master
git pull
git checkout emqtt.com
source .venv/bin/activate && make html
