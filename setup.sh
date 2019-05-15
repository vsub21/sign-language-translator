#!/bin/bash

cd tfjs-models/posenet/demos
sudo npm install http-server -g
yarn
yarn build && yarn yalc publish