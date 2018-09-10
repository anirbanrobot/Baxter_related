clc
clear all
close all

%% Baxter robot parameters
ak = [0.069 0 0.069 0 0.010 0 0];
alpk = [-pi/2 pi/2 -pi/2 pi/2 -pi/2 pi/2 0];
%dk = [0.27035 0 0.36435 0 0.37429 0 0.254525];
dk = [0.27035 0 0.36435 0 0.37429 0 0.22952];

%% Angles
q_l = [0.0019174759848567672 0.0023009711818281204 0.0015339807878854137 0.004985437560627594 0.0011504855909140602 0.0023009711818281204 0.0023009711818281204];

%% Defining the links for toolbox
% Define the robot model using standard (not modified) DH parameters.
% Left Arm

%             Theta d     a             alpha r/p  theta offset
Ll(1) = Link ([0    dk(1)  ak(1)      alpk(1)  0    0]);           % start at joint s0 and move to joint s1
Ll(2) = Link ([0    0        0        alpk(2)  0    pi/2]);        % start at joint s1 and move to joint e0
Ll(3) = Link ([0    dk(3)  ak(3)      alpk(3)  0    0]);           % start at joint e0 and move to joint e1
Ll(4) = Link ([0    0        0        alpk(4)  0    0]);           % start at joint e1 and move to joint w0
Ll(5) = Link ([0    dk(5)  ak(5)      alpk(5)  0    0]);           % start at joint w0 and move to joint w1
Ll(6) = Link ([0    0        0        alpk(6)  0    0]);           % start at joint w1 and move to joint w2
Ll(7) = Link ([0    dk(7)    0        alpk(7)   0    0]);           % start at joint w2 and move to end-effector

%% Baxter_l
%Baxter_l = SerialLink(Ll, 'name', 'Baxter_L', 'base' , ...
%                      transl(0.024645, 0.219645, 0.108588) * trotz(pi/4)...
%                      * transl(0.055695, 0, 0.011038))
                  
Baxter_l = SerialLink(Ll, 'name', 'Baxter_L', 'base' , ...
                      transl(0.025447174775, 0.219028201403, 0.10797895129) * trotz(pi/4)...
                      * transl(0.055695, 0, 0.011038))
%% Forward kinematics using toolbox
Bax_fkin = Baxter_l.fkine(q_l);

disp('Baxter tool frame configuration')
Bax_fkin

%transl(0.025447174775, 0.219028201403, 0.10797895129) * trotz(pi/4) * transl(0.055695, 0, 0.011038)