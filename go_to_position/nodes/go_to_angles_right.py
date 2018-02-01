#!/usr/bin/env python2.7

import rospy
import baxter_interface

# Node initiation
rospy.init_node('Go_to_angles')

# Object of Limb class
limb = baxter_interface.Limb('right')

# get the right limb's current joint angles
angles = limb.joint_angles()

# reassign desired joint angles
angles['right_s0'] = 0.0
angles['right_s1'] = 0.0
angles['right_e0'] = 0.0
angles['right_e1'] = 0.0
angles['right_w0'] = 0.0
angles['right_w1'] = 0.0
angles['right_w2'] = 0.0

# move the right arm to those joint angles
limb.move_to_joint_positions(angles)

print ('Current Joint Positions: {}'.format(angles))
