# sign_language

## Overview 

In this work, we built a sign-language translator using transfer learning, pose estimation, and the Sign Language MNIST dataset as a baseline. Approximately 28 million people in the US have some level of hearing loss. Of these, 2 million people are classified as deaf. Throughout this project we hope to built a sign-language to English translator for the American Sign Language (ASL) alphabet that will run in real time given a video stream as input. We built the initial phase of PoseNet on top of existing work (https://github.com/tensorflow/tfjs-models/tree/master/posenet) and we built our transfer learning model using principles learned from class. 

For a more extensive project overview and code walkthrough, please visit our youtube video on the project: (![https://youtu.be/2AXZ-LoxtI8](https://youtu.be/2AXZ-LoxtI8))

For more information on running the various components of this project, see below:

## Setup for Training Model and Getting TFJS Model Files
The model training and conversion to a TFJS formed json and shard files are done on the two python notebooks (asl_classifier.ipynb and js_model_conversion.ipynb). If you want to run these files on Colab, make sure to upload the sign language mnist data files (sign_mnist_test.csv and sign_mnist_train.csv). After running asl_classifier.ipynb, the user should see a new model.json file and hdf5 files containing weights in the directory. The js_model_conversion.ipynb notebook will use these to output another model.json and shard files (corresponding to weights). To use the weightings of this newly trained model, the user should transfer these files to the tfjs-models/posenet/demos/model_js directory, making sure to remove any pre-existing files. 

## Setup for PoseNet (without running shell scripts)
1. Make sure you have node and yarn available to use on your local device.
2. Go to `tfjs-models/posenet/demos` directory 
3. Train a model, obtain its `model_js`, and place it in this folder. A sample `model_js` is already in the repo.
4. Run `sudo npm install http-server -g` if you don't have it already.
5. Run `yarn` to set everything up and install dependencies.
  - You might have to run `yarn build && yarn yalc publish`

### Usage (without running shell scripts)
0. Go to `tfjs-models/posenet/demos` directory 
1. Open an HTTP server using `http-server -c1 --cors .`
  - If it says it's available on `http://127.0.0.1:8080` then you're good to go, otherwise modify `HOSTED_URLS` in `camera.js`
2. In a separate terminal, run `yarn watch`
3. Navigate to `localhost:1234` where the application lives

## Setup for PoseNet (With shell script)
1. Make sure you have node and yarn available to use on your local device.
2. Train a model, obtain its `model_js`, and place it in this folder (follow instructions from setup for training above). A sample `model_js` is already in the repo so it is not needed to run a basic version right now.
3. Run `./setup.sh`
4. Run `./server.sh`
5. In a new terminal tab, run `./pose.sh`
6. Navigate to `localhost:1234` where the application lives


