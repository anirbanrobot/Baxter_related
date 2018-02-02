# Baxter Packages
This repository is created to keep all the customed Baxter robot packages in one place. Below you can find name of each packages and their functionalities. Brief description of running important nodes with parameters is also provided here.

## Baxter_IK_Fast
The main files of this folder are **baxter_left_arm_ikfast_solver.cpp** and **baxter_right_arm_ikfast_solver.cpp** which can be used to find inverse kinematics solutions of left and right arm of baxter robot respectively. These two **.cpp** files along with the other **.urdf** or **.dae** files are created following http://sdk.rethinkrobotics.com/wiki/Custom_IKFast_for_your_Baxter. There are two other important **.cpp** files that are present in the package, namely **ikfast.cpp** and **ikfastdemo.cpp**. These two files need  to be preset in the same directory as the **baxter_left_arm_ikfast_solver.cpp** and **baxter_right_arm_ikfast_solver.cpp** files in order to compile successfully. This is also true if one wants to run **baxter_side_arm_ikfast_solver.cpp** as a standalone IK solver. Just to inform that **ikfast.cpp** can be obtained from **OpenRAVE**'s **Python** folder. The file **ikfastdemo.cpp** can be obtained from https://github.com/davetcoleman/clam_rosbuild/tree/master/clam_ik/src . <br>

In order to create executables out of **baxter_side_arm_ikfast_solver.cpp** perform the following

```
$ g++ -lstdc++ -o  baxter_side_ik baxter_side_arm_ikfast_solver.cpp -llapack
```

This will generate an executable named **baxter_side_ik**. Perfor this for both the arms. These file will be capable of solving inverse kinematics for both the arms. However if you look inside the **baxter_left_arm_ikfast_solver.cpp** or **baxter_right_arm_ikfast_solver.cpp**, you will find that apart from **compute\_IK** function there is another function named **compute\_FK** to solve forward kinematics. If you want to use both of these two functions, compile with **ikfastdemo.cpp** file as following,

```
Step 1 : change these in ikfastdemo.cpp file
----------------------------------------------
#define IK_VERSION 61
#include "baxter_right_arm_ikfast_solver.cpp"
```
Next compile the modified file as following,
```
Step 2 : complie modified ikfastdemo.cpp file
-----------------------------------------------
$ g++ ikfastdemo.cpp -lstdc++ -llapack -o compute -lrt
```
I will now show you how to compute FK and IK of Baxter robot using the executable just generated, named as **compute**.

```
$ ./compute fk 0.5 0.5 0.5 0.4 0.5 0.4 0.5
```
The output should look like as following,
```
Found fk solution for end frame: 

  Translation:  x: 0.555013  y: 0.554330  z: -0.445436   

     Rotation     -0.748117   0.654960   0.106527   
       Matrix:    0.568134   0.549273   0.612799   
                  0.342846   0.518968   -0.783026   

 Euler angles: 
       Yaw:   3.006377    (1st: rotation around vertical blue Z-axis in ROS Rviz) 
       Pitch: 0.802276   
       Roll:  0.659598   

  Quaternion:  -0.067323   0.348438   0.877556   0.322420   
               -0.067323 + 0.348438i + 0.877556j + 0.322420k   (alternate convention) 
```
```
$ ./baxter_right_ik -0.748117 0.654960 0.106527 0.555013 0.568134 0.549273 0.612799 0.554330 0.342846 0.518968 -0.783026 -0.445436 0.5
```
The output look like as following,
```
IK solution found
```


## go_to_position package

This package is created to move Baxter joints to desired rotations. This package can be downloaded from github repository, https://github.com/anirbanrobot/Baxter_related. There is one basic node that can implement what stated above. The node name is **go_to_angle.py**. This node takes 8 input arguments, one for arm side and seven joint angles. If only side is provided as input argument, then this node get the arm back to a predefined joint configuration, called *home position*. Below we showed installation protocol of this package into ROS workspace (**ros_ws**) and including it with the workspace.

```
$ cd ~/ros_ws/src
$ git clone https://github.com/anirbanrobot/Baxter_related
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
This is a special case of **Example 1** that takes in only 1 (`<side>`) input argument instead of 8. The general command line argument to run this node is as following,

```
$ rosrun go_to_position go_to_angle.py <side>
```
Therefore if we want to move right arm, then type in terminal the following,

```
$ rosrun go_to_position go_to_angle.py right
```
