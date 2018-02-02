# Baxter Packages
This repository is created to keep all the customed Baxter robot packages in one place. Below you can find name of each packages and their functionalities. Brief description of running important nodes with parameters is also provided here.

## Baxter_IK_Fast
The main files of this folder are **baxter_left_arm_ikfast_solver.cpp** and **baxter_right_arm_ikfast_solver.cpp** which can be used to find inverse kinematics solutions of left and right arm of baxter robot respectively. These two **.cpp** files along with the other **.urdf** or **.dae** files are created following the instructions given in http://sdk.rethinkrobotics.com/wiki/Custom_IKFast_for_your_Baxter. <br>

In order to create executables out of **baxter_left_arm_ikfast_solver.cpp** and **baxter_right_arm_ikfast_solver.cpp** perform the following


## go_to_position package

This package is created to move Baxter joints to desired rotations. This package can be downloaded from github repository, http://www.github.com. There is one basic node that can implement what stated above. The node name is **go_to_angle.py**. This node takes 8 input arguments, one for arm side and seven joint angles. If only side is provided as input argument, then this node get the arm back to a predefined joint configuration, called *home position*. Below we showed installation protocol of this package into ROS workspace (**ros_ws**) and including it with the workspace.

```
$ cd ~/ros_ws/src
$ git clone http://www.github.com
$ cd ~/ros_ws
$ catkin_make
$ source devel/setup.bash
```
In order to run the node, it is important to create executables of the node. See the following instruction to create the executable,

```
$ cd ~/ros_ws/src/go_to_position/nodes
$ chmod +x go_to_angle.py
```

This will create the necessary executable of the node. The next commands shows how you should run the node, first with 8 input arguments followed by an instance where node is given with only one input argument.

### Example 1:  providing 8 input argument
The general format of running the node with 8 input argument is as following,

```
$ cd ~/ros_ws
$ rosrun go_to_position go_to_angle.py <side> <j1> <j2> <j3> <j4> <j5> <j6> <j7>
```
For instance, if we want to rotate **left** arm with joint angles **0.5**, **-0.2**, **0.4**, **0.1**, **0.5**, **0.7**, **1.2**, **0.1** radians respectively then run the node as following,

```
$ rosrun go_to_position go_to_angle.py left 0.5 -0.2 0.4 0.1 0.5 0.7 1.2 0.1
```
This would take the arm to desired joint configuration.

### Example 2: providing 1 input argument
This is a special case of **Example 1** that takes in only 1 (<side>) input argument instead of 8. The general command line argument to run this node is as following,

```
$ rosrun go_to_position go_to_angle.py <side>
```
Therefore if we want to move right arm, then type in terminal the following,

```
$ rosrun go_to_position go_to_angle.py right
```
