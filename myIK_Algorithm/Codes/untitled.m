% equations for th4 and th5
%--------------------------------
% ak(5)*sin(0.5) + dk(4)
% dk(5)*sin(0.5) + (ak(5)*cos(0.5) + ak(4))*cos(0.5)
% (ak(5)*cos(0.5) + ak(4))*sin(0.5) - dk(5)*cos(0.5)
%ang = linspace(0, 2*pi, npts1);


%         s4_2 = (wx*dk(5) + wy*(ak(5)*cos(th5_2) + ak(4)))/((ak(5)*cos(th5_2) + ak(4))^2 + dk(5)^2);
%         c4_2 = (wx*(ak(5)*cos(th5_2) + ak(4)) - wy*dk(5))/((ak(5)*cos(th5_2) + ak(4))^2 + dk(5)^2);
%     
%         
%         th4_2 = atan2(s4_2, c4_2);
%     
%         th4 = [th4_1 th4_2];
%         th5 = [th5_1 th5_2];
        
        %fprintf('th4 = %6.4f,\t th5 = %6.4f\n\n', th4(1), th5(1));
        
%         s2_1 = (dk(3)*cy - (ak(3)*cos(th3_1) + ak(2))*cx)/((ak(3)*cos(th3_1)+ak(2))^2 + dk(3)^2);
%         c2_1 = (dk(3)*cx + (ak(3)*cos(th3_1) + ak(2))*cy)/((ak(3)*cos(th3_1)+ak(2))^2 + dk(3)^2);
%         th2_1 = atan2(s2_1, c2_1);
    
%         s2_2 = (dk(3)*cy - (ak(3)*cos(th3_2) + ak(2))*cx)/((ak(3)*cos(th3_2)+ak(2))^2 + dk(3)^2);
%         c2_2 = (dk(3)*cx + (ak(3)*cos(th3_2) + ak(2))*cy)/((ak(3)*cos(th3_2)+ak(2))^2 + dk(3)^2);
%         th2_2 = atan2(s2_2, c2_2);
%     
%         th3 = [th3_1 th3_2];
%         th2 = [th2_1 th2_2];
        
        %fprintf('th2 = %6.4f,\tth3 = %6.4f\n\n', th2(1), th3(1));
        
%     pt_C(:, i_iter) = R_norm'*[R_c*cos(ang(i_iter)) R_c*sin(ang(i_iter)) d_c]';      % point C in artificial frame
%     pt_C_gbl(:, i_iter) = T_af(1:3, 1:3)*pt_C(:, i_iter) + T_af(1:3, 4);        % point C in global frame
%     pt_C_fr1(:, i_iter) = T_af_multi(1:3,1:3,2)'*pt_C_gbl(:, i_iter) - T_af_multi(1:3,1:3,2)'*T_af_multi(1:3,4,2);
%     pt_C = R_norm'*[R_c*cos(ang(i_iter)) R_c*sin(ang(i_iter)) d_c]';      % point C in artificial frame

%     pt_C(:, i_iter) = R_norm'*[R_c*cos(ang(i_iter)) R_c*sin(ang(i_iter)) d_c]';      % point C in artificial frame
%     pt_C_gbl(:, i_iter) = T_af(1:3, 1:3)*pt_C(:, i_iter) + T_af(1:3, 4);        % point C in global frame
%     pt_C_fr1(:, i_iter) = T_af_multi(1:3,1:3,2)'*pt_C_gbl(:, i_iter) - T_af_multi(1:3,1:3,2)'*T_af_multi(1:3,4,2);

%     pt_C = R_norm'*[R_c*cos(ang(i_iter)) R_c*sin(ang(i_iter)) d_c]';      % point C in artificial frame
%     pt_C_gbl = T_af(1:3, 1:3)*pt_C + T_af(1:3, 4);        % point C in global frame
%     pt_C_fr1 = T_af_multi(1:3,1:3,2)'*pt_C_gbl - T_af_multi(1:3,1:3,2)'*T_af_multi(1:3,4,2);

%for i = 1:2

%T_af = T_af_multi(:,:,3);          
%T_af(1:3,1) = T_af_multi(1:3,2,3);
%T_af(1:3,2) = -T_af_multi(1:3,1,3);
%k = 0;                              % valid pt_C counter                   
%ang = linspace(1.8629, 2.1786, npts1);
%DWpose_af = T_af\[DWpose;1];
%ang(i_iter)
%ang = linspace(0, 2*pi, npts1);
%ang = linspace(phi_max, 2*pi - abs(phi_min), npts1);
% for i_iter = 1 : length(ang)
%     pt_C_fr1 = R_norm'*[d_c -R_c*sin(ang(i_iter)) R_c*cos(ang(i_iter))]'
% end

%th7_1 = acos(dot(T6(1:3,1), gst_d(1:3,1)));
%th7_2 = -th7_1;

%       c_var = acos(B2/A1);
    
%       if a_var < 0
%           a_var = 2*pi + a_var;
%       end
%     
%       if b_var < 0
%           b_var = 2*pi + b_var;
%       end
%     
%       if c_var < 0
%           c_var = 2*pi + c_var;
%       end
    
%       phi_max = acos(B1/A1) - atan2(R_norm(2,3), R_norm(3,3));
%       phi_min = -(acos(B2/A1) + atan2(R_norm(2,3), R_norm(3,3)));