#############################################
## Opening MATLAB
# Step 1: Go to specified directory
$cd /usr/local/MATLAB/R2017b/bin

# Step 2: Run executable
$./matlab &
##############################################

##############################################
## Running Baxter Robot
# Step 1: Go to correct workspace
$cd ros_ws

# Step 2: Run shell file (.sh) to load all dependencies
$./baxter.sh
###############################################


###############################################
## Simple Screen Recorder
$sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder
$sudo apt-get update
$sudo apt-get install simplescreenrecorder
# if you want to record 32-bit OpenGL applications on a 64-bit system:
$sudo apt-get install simplescreenrecorder-lib:i386
# Launching: type in the application bar simple screen recorder
################################################

##################################################
## Open-RAVE Installation Instructions can be found in following website
https://scaron.info/teaching/installing-openrave-on-ubuntu-16.04.html

##################################################
## Package: GO_TO_POSITION
# This has the nodes that takes end effector to the desired configuration
# Users need to provide arm_side and joint angles as shown
rosrun go_to_position go_to_angle.py left 0.1 0.1 0.1 0.5 0.1 0.4 0.1 0.1

