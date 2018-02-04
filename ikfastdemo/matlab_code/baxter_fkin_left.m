clc
clear
close all

%% Baxter robot parameters
ak = [0.069 0 0.069 0 0.01 0 0];
alpk = [-pi/2 pi/2 -pi/2 pi/2 -pi/2 pi/2 0];
%dk = [0.27035 0 0.3644 0 0.3743 0 0.254525];
%dk = [0.27035 0 0.36435 0 0.37429 0 0.229520];
dk = [0.27035 0 (0.102 + 0.26242) 0 (0.10359 + 0.2707) 0 (0.115975 + 0.11355) + 0.05];
%% Angles
%q_l = [0.0019174759848567672 0.0023009711818281204 0.0015339807878854137 0.004985437560627594 0.0011504855909140602 0.0023009711818281204 0.0023009711818281204];
q_l = [0.1 -0.5 0.1 0.8 0.2 0.5 0.1];
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
                      transl(0.025447174775, -0.219028201403, 0.10797895129) * trotz(pi/4)...
                      * transl(0.055695, 0, 0.011038));
% Baxter_l = SerialLink(Ll, 'name', 'Baxter_L', 'base' , ...
%                       transl(0.025447174775, -0.219028201403, 0.10797895129) * trotz(-pi/4));
%% Forward kinematics using toolbox
Bax_fkin = Baxter_l.fkine(q_l);
Bax_jac = Baxter_l.jacob0(q_l);

% Lower down dimension of Bax_fkin matrix
Bax_fk_temp = Bax_fkin(:, :, 1);
Bax_fk = [Bax_fk_temp.n Bax_fk_temp.o Bax_fk_temp.a Bax_fk_temp.t;
                                                        zeros(1, 3) 1];

Bax_base = transl(0.025447174775, -0.219028201403, 0.10797895129) * trotz(pi/4); % * transl(0.055695, 0, 0.011038);

fprintf('Baxter tool frame configuration\n'); disp(Bax_fk);
%fprintf('Baxter base\n'); disp(Bax_base);
%fprintf('Baxter Jacobian\n'); disp(Bax_jac);

% IKFast Forward kinematics
Demo_fk = [-0.742096   -0.009865   0.670221 1.011182;
           0.220965   0.940399   0.258504 0.185863;
           -0.632825   0.339930   -0.695686 0.082801;
           0 0 0 1];
Demo_base_tran = Bax_base * Demo_fk;
fprintf('IKFastDemo.cpp Code output\n'); disp(Demo_base_tran);

%fprintf('Difference Between positions\n'); disp(Demo_base_tran(1:3, 4) - Bax_fk(1:3, 4));

adjust_trans = inv(Demo_base_tran)*Bax_fk;
fprintf('Adjustment transform\n'); disp(adjust_trans);
