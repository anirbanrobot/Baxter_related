#!/usr/bin/env python2.7
from sys import argv
import rospy
import baxter_interface

# Node initiation
rospy.init_node('Go_to_angles_left')

# Object of Limb class
limb = baxter_interface.Limb('left')

# get the right limb's current joint angles
angles = limb.joint_angles()

if len(argv) < 2:
	print ('No joint angles provided\n')
	print ('Going to home position\n')
	# reassign desired joint angles
	angles['left_s0'] = -0.32175247025896553
	angles['left_s1'] = -0.03489806292439316
	angles['left_e0'] = 0.08551942892461181
	angles['left_e1'] = 1.659000222098075
	angles['left_w0'] = -0.1004757416064946
	angles['left_w1'] = 0.011888351106111956
	angles['left_w2'] = 3.045718854346489
else:
	# reassign desired joint angles
	angles['left_s0'] = float(argv[1])
	angles['left_s1'] = float(argv[2])
	angles['left_e0'] = float(argv[3])
	angles['left_e1'] = float(argv[4])
	angles['left_w0'] = float(argv[5])
	angles['left_w1'] = float(argv[6])
	angles['left_w2'] = float(argv[7])
	
	print ('Current Joint Positions: {}'.format(angles))

# move the right arm to those joint angles
limb.move_to_joint_positions(angles)


