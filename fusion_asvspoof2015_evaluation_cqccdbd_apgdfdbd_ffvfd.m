clear;clc;
%======================================
% Fusion between APGDF and FFV (fd)
%======================================
%===================
% S1
%===================
%-----------------------------
% IMFCC, APGDF and FFV fusion
%------------------------------
% clear;clc;
% a1_s1_target=importdata('imfcc_s1_score_target.txt');
% a1_s2_target=importdata('imfcc_s2_score_target.txt');
% a1_s3_target=importdata('imfcc_s3_score_target.txt');  %IMFCC target score on development data
% a1_s4_target=importdata('imfcc_s4_score_target.txt');
% a1_s5_target=importdata('imfcc_s5_score_target.txt');
% 
% a1_target=[a1_s1_target.data' a1_s2_target.data' a1_s3_target.data' a1_s4_target.data' a1_s5_target.data'];
% 
% a2_s1_target=importdata('apgd_s1_score_target.txt');
% a2_s2_target=importdata('apgd_s2_score_target.txt');
% a2_s3_target=importdata('apgd_s3_score_target.txt'); %APGDF target score on development data
% a2_s4_target=importdata('apgd_s4_score_target.txt');
% a2_s5_target=importdata('apgd_s5_score_target.txt');
% 
% a2_target=[a2_s1_target.data' a2_s2_target.data' a2_s3_target.data' a2_s4_target.data' a2_s5_target.data'];
% 
% a3_s1_target=importdata('ffv_s1_score_target.txt');
% a3_s2_target=importdata('ffv_s2_score_target.txt');
% a3_s3_target=importdata('ffv_s3_score_target.txt'); %FFV target score on development data
% a3_s4_target=importdata('ffv_s4_score_target.txt');
% a3_s5_target=importdata('ffv_s5_score_target.txt');
% 
% a3_target=[a3_s1_target.data' a3_s2_target.data' a3_s3_target.data' a3_s4_target.data' a3_s5_target.data'];
% 
% b_target=[a1_target;a2_target;a3_target];
% 
% a1_s1_nontarget=importdata('imfcc_s1_score_nontarget.txt');
% a1_s2_nontarget=importdata('imfcc_s2_score_nontarget.txt');
% a1_s3_nontarget=importdata('imfcc_s3_score_nontarget.txt'); %IMFCC nontarget score on development data
% a1_s4_nontarget=importdata('imfcc_s4_score_nontarget.txt');
% a1_s5_nontarget=importdata('imfcc_s5_score_nontarget.txt');
% 
% a1_nontarget=[a1_s1_nontarget.data' a1_s2_nontarget.data' a1_s3_nontarget.data' a1_s4_nontarget.data' a1_s5_nontarget.data'];
% 
% a2_s1_nontarget=importdata('apgd_s1_score_nontarget.txt');
% a2_s2_nontarget=importdata('apgd_s2_score_nontarget.txt');
% a2_s3_nontarget=importdata('apgd_s3_score_nontarget.txt'); %APGDF nontarget score on development data
% a2_s4_nontarget=importdata('apgd_s4_score_nontarget.txt');
% a2_s5_nontarget=importdata('apgd_s5_score_nontarget.txt');
% 
% a2_nontarget=[a2_s1_nontarget.data' a2_s2_nontarget.data' a2_s3_nontarget.data' a2_s4_nontarget.data' a2_s5_nontarget.data'];
% 
% a3_s1_nontarget=importdata('ffv_s1_score_nontarget.txt');
% a3_s2_nontarget=importdata('ffv_s2_score_nontarget.txt');
% a3_s3_nontarget=importdata('ffv_s3_score_nontarget.txt'); %FFV nontarget score on development data
% a3_s4_nontarget=importdata('ffv_s4_score_nontarget.txt');
% a3_s5_nontarget=importdata('ffv_s5_score_nontarget.txt');
% 
% a3_nontarget=[a3_s1_nontarget.data' a3_s2_nontarget.data' a3_s3_nontarget.data' a3_s4_nontarget.data' a3_s5_nontarget.data'];
% 
% b_nontarget=[a1_nontarget;a2_nontarget;a3_nontarget];
% 
% w=train_llr_fusion(b_target,b_nontarget); % Fusion training
% save fusion_weight.mat w;
% 
% %Fusion on evaluation data
% 
% a1_s1_eval_target=importdata('imfcc_s1_score_target_eval.txt');
% a2_s1_eval_target=importdata('apgd_s1_score_target_eval.txt'); %Evaluation target score
% a3_s1_eval_target=importdata('ffv_s1_score_target_eval.txt');
% 
% b_eval_target=[a1_s1_eval_target.data';a2_s1_eval_target.data';a3_s1_eval_target.data'];
% 
% a1_s1_eval_nontarget=importdata('imfcc_s1_score_nontarget_eval.txt');
% a2_s1_eval_nontarget=importdata('apgd_s1_score_nontarget_eval.txt'); %Evaluation nontarget score
% a3_s1_eval_nontarget=importdata('ffv_s1_score_nontarget_eval.txt');
% 
% b_eval_nontarget=[a1_s1_eval_nontarget.data';a2_s1_eval_nontarget.data';a3_s1_eval_nontarget.data'];
% 
% f_target = lin_fusion(w,b_eval_target); %fusion 
% f_nontarget = lin_fusion(w,b_eval_nontarget); %fusion 
% 
% [x,y,eer_s1] = rocchdet(f_target,f_nontarget); %EER calculation
% 
% fileID = fopen('fusion_eval_imfcc_apgd_ffv_s1_eer.txt','w');
% fprintf(fileID,'%6s','eer_s1');
% fprintf(fileID,'%12.8f',eer_s1*100);
% fclose(fileID);
% %---------------------
% clear;clc;
% a1_s1_target=importdata('imfcc_s1_mdd_score_target.txt');
% a1_s2_target=importdata('imfcc_s2_mdd_score_target.txt');
% a1_s3_target=importdata('imfcc_s3_mdd_score_target.txt');  %IMFCC target score on development data
% a1_s4_target=importdata('imfcc_s4_mdd_score_target.txt');
% a1_s5_target=importdata('imfcc_s5_mdd_score_target.txt');
% 
% a1_target=[a1_s1_target.data' a1_s2_target.data' a1_s3_target.data' a1_s4_target.data' a1_s5_target.data'];
% 
% a2_s1_target=importdata('apgd_s1_apgdd_score_target.txt');
% a2_s2_target=importdata('apgd_s2_apgdd_score_target.txt');
% a2_s3_target=importdata('apgd_s3_apgdd_score_target.txt'); %APGDF target score on development data
% a2_s4_target=importdata('apgd_s4_apgdd_score_target.txt');
% a2_s5_target=importdata('apgd_s5_apgdd_score_target.txt');
% 
% a2_target=[a2_s1_target.data' a2_s2_target.data' a2_s3_target.data' a2_s4_target.data' a2_s5_target.data'];
% 
% a3_s1_target=importdata('ffv_s1_fd_score_target.txt');
% a3_s2_target=importdata('ffv_s2_fd_score_target.txt');
% a3_s3_target=importdata('ffv_s3_fd_score_target.txt'); %FFV target score on development data
% a3_s4_target=importdata('ffv_s4_fd_score_target.txt');
% a3_s5_target=importdata('ffv_s5_fd_score_target.txt');
% 
% a3_target=[a3_s1_target.data' a3_s2_target.data' a3_s3_target.data' a3_s4_target.data' a3_s5_target.data'];
% 
% b_target=[a1_target;a2_target;a3_target];
% 
% a1_s1_nontarget=importdata('imfcc_s1_mdd_score_nontarget.txt');
% a1_s2_nontarget=importdata('imfcc_s2_mdd_score_nontarget.txt');
% a1_s3_nontarget=importdata('imfcc_s3_mdd_score_nontarget.txt'); %IMFCC nontarget score on development data
% a1_s4_nontarget=importdata('imfcc_s4_mdd_score_nontarget.txt');
% a1_s5_nontarget=importdata('imfcc_s5_mdd_score_nontarget.txt');
% 
% a1_nontarget=[a1_s1_nontarget.data' a1_s2_nontarget.data' a1_s3_nontarget.data' a1_s4_nontarget.data' a1_s5_nontarget.data'];
% 
% a2_s1_nontarget=importdata('apgd_s1_apgdd_score_nontarget.txt');
% a2_s2_nontarget=importdata('apgd_s2_apgdd_score_nontarget.txt');
% a2_s3_nontarget=importdata('apgd_s3_apgdd_score_nontarget.txt'); %APGDF nontarget score on development data
% a2_s4_nontarget=importdata('apgd_s4_apgdd_score_nontarget.txt');
% a2_s5_nontarget=importdata('apgd_s5_apgdd_score_nontarget.txt');
% 
% a2_nontarget=[a2_s1_nontarget.data' a2_s2_nontarget.data' a2_s3_nontarget.data' a2_s4_nontarget.data' a2_s5_nontarget.data'];
% 
% a3_s1_nontarget=importdata('ffv_s1_fd_score_nontarget.txt');
% a3_s2_nontarget=importdata('ffv_s2_fd_score_nontarget.txt');
% a3_s3_nontarget=importdata('ffv_s3_fd_score_nontarget.txt'); %FFV nontarget score on development data
% a3_s4_nontarget=importdata('ffv_s4_fd_score_nontarget.txt');
% a3_s5_nontarget=importdata('ffv_s5_fd_score_nontarget.txt');
% 
% a3_nontarget=[a3_s1_nontarget.data' a3_s2_nontarget.data' a3_s3_nontarget.data' a3_s4_nontarget.data' a3_s5_nontarget.data'];
% 
% b_nontarget=[a1_nontarget;a2_nontarget;a3_nontarget];
% 
% w=train_llr_fusion(b_target,b_nontarget); % Fusion training
% save fusion_weight_mdd.mat w;
% 
% %Fusion on evaluation data
% 
% a1_s1_eval_target=importdata('imfcc_s1_mdd_score_target_eval.txt');
% a2_s1_eval_target=importdata('apgd_s1_apgdd_score_target_eval.txt'); %Evaluation target score
% a3_s1_eval_target=importdata('ffv_s1_fd_score_target_eval.txt');
% 
% b_eval_target=[a1_s1_eval_target.data';a2_s1_eval_target.data';a3_s1_eval_target.data'];
% 
% a1_s1_eval_nontarget=importdata('imfcc_s1_mdd_score_nontarget_eval.txt');
% a2_s1_eval_nontarget=importdata('apgd_s1_apgdd_score_nontarget_eval.txt'); %Evaluation nontarget score
% a3_s1_eval_nontarget=importdata('ffv_s1_fd_score_nontarget_eval.txt');
% 
% b_eval_nontarget=[a1_s1_eval_nontarget.data';a2_s1_eval_nontarget.data';a3_s1_eval_nontarget.data'];
% 
% f_target = lin_fusion(w,b_eval_target); %fusion 
% f_nontarget = lin_fusion(w,b_eval_nontarget); %fusion 
% 
% [x,y,eer_s1] = rocchdet(f_target,f_nontarget); %EER calculation
% 
% fileID = fopen('fusion_eval_imfcc_apgd_ffv_mdd_s1_eer.txt','w');
% fprintf(fileID,'%6s','eer_s1');
% fprintf(fileID,'%12.8f',eer_s1*100);
% fclose(fileID);
%==========================================================================

clear;clc;
a1_s1_target=importdata('cqcc_s1_dbd_score_target.txt');
a1_s2_target=importdata('cqcc_s2_dbd_score_target.txt');
a1_s3_target=importdata('cqcc_s3_dbd_score_target.txt');  %CQCC target score on development data
a1_s4_target=importdata('cqcc_s4_dbd_score_target.txt');
a1_s5_target=importdata('cqcc_s5_dbd_score_target.txt');

a1_target=[a1_s1_target.data' a1_s2_target.data' a1_s3_target.data' a1_s4_target.data' a1_s5_target.data'];

a2_s1_target=importdata('apgd_s1_dbd_score_target.txt');
a2_s2_target=importdata('apgd_s2_dbd_score_target.txt');
a2_s3_target=importdata('apgd_s3_dbd_score_target.txt'); %APGDF target score on development data
a2_s4_target=importdata('apgd_s4_dbd_score_target.txt');
a2_s5_target=importdata('apgd_s5_dbd_score_target.txt');

a2_target=[a2_s1_target.data' a2_s2_target.data' a2_s3_target.data' a2_s4_target.data' a2_s5_target.data'];

a3_s1_target=importdata('ffv_s1_fd_score_target.txt');
a3_s2_target=importdata('ffv_s2_fd_score_target.txt');
a3_s3_target=importdata('ffv_s3_fd_score_target.txt'); %FFV target score on development data
a3_s4_target=importdata('ffv_s4_fd_score_target.txt');
a3_s5_target=importdata('ffv_s5_fd_score_target.txt');

a3_target=[a3_s1_target.data' a3_s2_target.data' a3_s3_target.data' a3_s4_target.data' a3_s5_target.data'];

b_target=[a1_target;a2_target;a3_target];

a1_s1_nontarget=importdata('cqcc_s1_dbd_score_nontarget.txt');
a1_s2_nontarget=importdata('cqcc_s2_dbd_score_nontarget.txt');
a1_s3_nontarget=importdata('cqcc_s3_dbd_score_nontarget.txt'); %IMFCC nontarget score on development data
a1_s4_nontarget=importdata('cqcc_s4_dbd_score_nontarget.txt');
a1_s5_nontarget=importdata('cqcc_s5_dbd_score_nontarget.txt');

a1_nontarget=[a1_s1_nontarget.data' a1_s2_nontarget.data' a1_s3_nontarget.data' a1_s4_nontarget.data' a1_s5_nontarget.data'];

a2_s1_nontarget=importdata('apgd_s1_dbd_score_nontarget.txt');
a2_s2_nontarget=importdata('apgd_s2_dbd_score_nontarget.txt');
a2_s3_nontarget=importdata('apgd_s3_dbd_score_nontarget.txt'); %APGDF nontarget score on development data
a2_s4_nontarget=importdata('apgd_s4_dbd_score_nontarget.txt');
a2_s5_nontarget=importdata('apgd_s5_dbd_score_nontarget.txt');

a2_nontarget=[a2_s1_nontarget.data' a2_s2_nontarget.data' a2_s3_nontarget.data' a2_s4_nontarget.data' a2_s5_nontarget.data'];

a3_s1_nontarget=importdata('ffv_s1_fd_score_nontarget.txt');
a3_s2_nontarget=importdata('ffv_s2_fd_score_nontarget.txt');
a3_s3_nontarget=importdata('ffv_s3_fd_score_nontarget.txt'); %FFV nontarget score on development data
a3_s4_nontarget=importdata('ffv_s4_fd_score_nontarget.txt');
a3_s5_nontarget=importdata('ffv_s5_fd_score_nontarget.txt');

a3_nontarget=[a3_s1_nontarget.data' a3_s2_nontarget.data' a3_s3_nontarget.data' a3_s4_nontarget.data' a3_s5_nontarget.data'];

b_nontarget=[a1_nontarget;a2_nontarget;a3_nontarget];

w=train_llr_fusion(b_target,b_nontarget); % Fusion training
save fusion_weight_cqccdbd_apgddbd_ffvfd.mat w;
%---------------------------------------------------------------------
%Fusion on evaluation data
clear;clc;
load fusion_weight_cqccdbd_apgddbd_ffvfd.mat;
a1_s1_eval_target=importdata('cqcc_s1_alt_dbd_score_target_eval.txt');
a2_s1_eval_target=importdata('apgd_s1_alt_dbd_score_target_eval.txt'); %Evaluation target score 
a3_s1_eval_target=importdata('ffv_s1_alt_fd_score_target_eval.txt');

b_eval_target=[a1_s1_eval_target.data';a2_s1_eval_target.data';a3_s1_eval_target.data'];

a1_s1_eval_nontarget=importdata('cqcc_s1_alt_dbd_score_nontarget_eval.txt');
a2_s1_eval_nontarget=importdata('apgd_s1_alt_dbd_score_nontarget_eval.txt'); %Evaluation nontarget score
a3_s1_eval_nontarget=importdata('ffv_s1_alt_fd_score_nontarget_eval.txt');

b_eval_nontarget=[a1_s1_eval_nontarget.data';a2_s1_eval_nontarget.data';a3_s1_eval_nontarget.data'];

f_target = lin_fusion(w,b_eval_target); %fusion 
f_nontarget = lin_fusion(w,b_eval_nontarget); %fusion 

[x,y,eer_s1] = rocchdet(f_target,f_nontarget); %EER calculation

fileID = fopen('fusion_eval_cqcc_apgd_ffv2_dd_s1_alt_eer.txt','w');
fprintf(fileID,'%6s','eer_s1');
fprintf(fileID,'%12.8f',eer_s1*100);
fclose(fileID);


%===================
% S2
%===================
%-----------------------------
% IMFCC, APGDF and FFV fusion
%------------------------------
% clear;clc;
% load fusion_weight.mat
% 
% %Fusion on evaluation data
% 
% a1_s2_eval_target=importdata('imfcc_s2_score_target_eval.txt');
% a2_s2_eval_target=importdata('apgd_s2_score_target_eval.txt'); %Evaluation target score
% a3_s2_eval_target=importdata('ffv_s2_score_target_eval.txt');
% 
% b_eval_target=[a1_s2_eval_target.data';a2_s2_eval_target.data';a3_s2_eval_target.data'];
% 
% a1_s2_eval_nontarget=importdata('imfcc_s2_score_nontarget_eval.txt');
% a2_s2_eval_nontarget=importdata('apgd_s2_score_nontarget_eval.txt'); %Evaluation nontarget score
% a3_s2_eval_nontarget=importdata('ffv_s2_score_nontarget_eval.txt');
% 
% b_eval_nontarget=[a1_s2_eval_nontarget.data';a2_s2_eval_nontarget.data';a3_s2_eval_nontarget.data'];
% 
% f_target = lin_fusion(w,b_eval_target); %fusion 
% f_nontarget = lin_fusion(w,b_eval_nontarget); %fusion 
% 
% [x,y,eer_s2] = rocchdet(f_target,f_nontarget); %EER calculation
% 
% fileID = fopen('fusion_eval_imfcc_apgd_ffv_s2_eer.txt','w');
% fprintf(fileID,'%6s','eer_s2');
% fprintf(fileID,'%12.8f',eer_s2*100);
% fclose(fileID);
% %---------------------
% clear;clc;
% load fusion_weight_mdd.mat
% 
% %Fusion on evaluation data
% 
% a1_s2_eval_target=importdata('imfcc_s2_mdd_score_target_eval.txt');
% a2_s2_eval_target=importdata('apgd_s2_apgdd_score_target_eval.txt'); %Evaluation target score
% a3_s2_eval_target=importdata('ffv_s2_fd_score_target_eval.txt');
% 
% b_eval_target=[a1_s2_eval_target.data';a2_s2_eval_target.data';a3_s2_eval_target.data'];
% 
% a1_s2_eval_nontarget=importdata('imfcc_s2_mdd_score_nontarget_eval.txt');
% a2_s2_eval_nontarget=importdata('apgd_s2_apgdd_score_nontarget_eval.txt'); %Evaluation nontarget score
% a3_s2_eval_nontarget=importdata('ffv_s2_fd_score_nontarget_eval.txt');
% 
% b_eval_nontarget=[a1_s2_eval_nontarget.data';a2_s2_eval_nontarget.data';a3_s2_eval_nontarget.data'];
% 
% f_target = lin_fusion(w,b_eval_target); %fusion 
% f_nontarget = lin_fusion(w,b_eval_nontarget); %fusion 
% 
% [x,y,eer_s2] = rocchdet(f_target,f_nontarget); %EER calculation
% 
% fileID = fopen('fusion_eval_imfcc_apgd_ffv_mdd_s2_eer.txt','w');
% fprintf(fileID,'%6s','eer_s2');
% fprintf(fileID,'%12.8f',eer_s2*100);
% fclose(fileID);
%==========================================================================

clear;clc;
load fusion_weight_cqccdbd_apgddbd_ffvfd.mat;

%Fusion on evaluation data

a1_s2_eval_target=importdata('cqcc_s2_alt_dbd_score_target_eval.txt');
a2_s2_eval_target=importdata('apgd_s2_alt_dbd_score_target_eval.txt'); %Evaluation target score
a3_s2_eval_target=importdata('ffv_s2_alt_fd_score_target_eval.txt');

b_eval_target=[a1_s2_eval_target.data';a2_s2_eval_target.data';a3_s2_eval_target.data'];

a1_s2_eval_nontarget=importdata('cqcc_s2_alt_dbd_score_nontarget_eval.txt');
a2_s2_eval_nontarget=importdata('apgd_s2_alt_dbd_score_nontarget_eval.txt'); %Evaluation nontarget score
a3_s2_eval_nontarget=importdata('ffv_s2_alt_fd_score_nontarget_eval.txt');

b_eval_nontarget=[a1_s2_eval_nontarget.data';a2_s2_eval_nontarget.data';a3_s2_eval_nontarget.data'];

f_target = lin_fusion(w,b_eval_target); %fusion 
f_nontarget = lin_fusion(w,b_eval_nontarget); %fusion 

[x,y,eer_s2] = rocchdet(f_target,f_nontarget); %EER calculation

fileID = fopen('fusion_eval_cqcc_apgd_ffv2_alt_dd_s2_eer.txt','w');
fprintf(fileID,'%6s','eer_s2');
fprintf(fileID,'%12.8f',eer_s2*100);
fclose(fileID);

%===================
% S3
%===================
%-----------------------------
% IMFCC, APGDF and FFV fusion
%------------------------------

clear;clc;
load fusion_weight_cqccdbd_apgddbd_ffvfd.mat;

%Fusion on evaluation data

a1_s3_eval_target=importdata('cqcc_s3_alt_dbd_score_target_eval.txt');
a2_s3_eval_target=importdata('apgd_s3_alt_dbd_score_target_eval.txt'); %Evaluation target score
a3_s3_eval_target=importdata('ffv_s3_alt_fd_score_target_eval.txt');

b_eval_target=[a1_s3_eval_target.data';a2_s3_eval_target.data';a3_s3_eval_target.data'];

a1_s3_eval_nontarget=importdata('cqcc_s3_alt_dbd_score_nontarget_eval.txt');
a2_s3_eval_nontarget=importdata('apgd_s3_alt_dbd_score_nontarget_eval.txt'); %Evaluation nontarget score
a3_s3_eval_nontarget=importdata('ffv_s3_alt_fd_score_nontarget_eval.txt');

b_eval_nontarget=[a1_s3_eval_nontarget.data';a2_s3_eval_nontarget.data';a3_s3_eval_nontarget.data'];

f_target = lin_fusion(w,b_eval_target); %fusion 
f_nontarget = lin_fusion(w,b_eval_nontarget); %fusion 

[x,y,eer_s3] = rocchdet(f_target,f_nontarget); %EER calculation

fileID = fopen('fusion_eval_cqcc_apgd_ffv2_alt_dd_s3_eer.txt','w');
fprintf(fileID,'%6s','eer_s3');
fprintf(fileID,'%12.8f',eer_s3*100);
fclose(fileID);

%===================
% S4
%===================
%-----------------------------
% IMFCC, APGDF and FFV fusion
%------------------------------

clear;clc;
load fusion_weight_cqccdbd_apgddbd_ffvfd.mat;

%Fusion on evaluation data

a1_s4_eval_target=importdata('cqcc_s4_alt_dbd_score_target_eval.txt');
a2_s4_eval_target=importdata('apgd_s4_alt_dbd_score_target_eval.txt'); %Evaluation target score
a3_s4_eval_target=importdata('ffv_s4_alt_fd_score_target_eval.txt');

b_eval_target=[a1_s4_eval_target.data';a2_s4_eval_target.data';a3_s4_eval_target.data'];

a1_s4_eval_nontarget=importdata('cqcc_s4_alt_dbd_score_nontarget_eval.txt');
a2_s4_eval_nontarget=importdata('apgd_s4_alt_dbd_score_nontarget_eval.txt'); %Evaluation nontarget score
a3_s4_eval_nontarget=importdata('ffv_s4_alt_fd_score_nontarget_eval.txt');

b_eval_nontarget=[a1_s4_eval_nontarget.data';a2_s4_eval_nontarget.data';a3_s4_eval_nontarget.data'];

f_target = lin_fusion(w,b_eval_target); %fusion 
f_nontarget = lin_fusion(w,b_eval_nontarget); %fusion 

[x,y,eer_s4] = rocchdet(f_target,f_nontarget); %EER calculation

fileID = fopen('fusion_eval_cqcc_apgd_ffv2_alt_dd_s4_eer.txt','w');
fprintf(fileID,'%6s','eer_s4');
fprintf(fileID,'%12.8f',eer_s4*100);
fclose(fileID);


%===================
% S5
%===================
%-----------------------------
% IMFCC, APGDF and FFV fusion
%------------------------------

clear;clc;
load fusion_weight_cqccdbd_apgddbd_ffvfd.mat;

%Fusion on evaluation data

a1_s5_eval_target=importdata('cqcc_s5_alt_dbd_score_target_eval.txt');
a2_s5_eval_target=importdata('apgd_s5_alt_dbd_score_target_eval.txt'); %Evaluation target score
a3_s5_eval_target=importdata('ffv_s5_alt_fd_score_target_eval.txt');

b_eval_target=[a1_s5_eval_target.data';a2_s5_eval_target.data';a3_s5_eval_target.data'];

a1_s5_eval_nontarget=importdata('cqcc_s5_alt_dbd_score_nontarget_eval.txt');
a2_s5_eval_nontarget=importdata('apgd_s5_alt_dbd_score_nontarget_eval.txt'); %Evaluation nontarget score
a3_s5_eval_nontarget=importdata('ffv_s5_alt_fd_score_nontarget_eval.txt');

b_eval_nontarget=[a1_s5_eval_nontarget.data';a2_s5_eval_nontarget.data';a3_s5_eval_nontarget.data'];

f_target = lin_fusion(w,b_eval_target); %fusion 
f_nontarget = lin_fusion(w,b_eval_nontarget); %fusion 

[x,y,eer_s5] = rocchdet(f_target,f_nontarget); %EER calculation

fileID = fopen('fusion_eval_cqcc_apgd_ffv2_alt_dd_s5_eer.txt','w');
fprintf(fileID,'%6s','eer_s5');
fprintf(fileID,'%12.8f',eer_s5*100);
fclose(fileID);


%===================
% S6
%===================
%-----------------------------
% IMFCC, APGDF and FFV fusion
%------------------------------

clear;clc;
load fusion_weight_cqccdbd_apgddbd_ffvfd.mat;

%Fusion on evaluation data

a1_s6_eval_target=importdata('cqcc_s6_dbd_score_target_eval.txt');
a2_s6_eval_target=importdata('apgd_s6_dbd_score_target_eval.txt'); %Evaluation target score
a3_s6_eval_target=importdata('ffv_s6_fd_score_target_eval.txt');

b_eval_target=[a1_s6_eval_target.data';a2_s6_eval_target.data';a3_s6_eval_target.data'];

a1_s6_eval_nontarget=importdata('cqcc_s6_dbd_score_nontarget_eval.txt');
a2_s6_eval_nontarget=importdata('apgd_s6_dbd_score_nontarget_eval.txt'); %Evaluation nontarget score
a3_s6_eval_nontarget=importdata('ffv_s6_fd_score_nontarget_eval.txt');

b_eval_nontarget=[a1_s6_eval_nontarget.data';a2_s6_eval_nontarget.data';a3_s6_eval_nontarget.data'];

f_target = lin_fusion(w,b_eval_target); %fusion 
f_nontarget = lin_fusion(w,b_eval_nontarget); %fusion 

[x,y,eer_s6] = rocchdet(f_target,f_nontarget); %EER calculation

fileID = fopen('fusion_eval_cqcc_apgd_ffv2_dd_s6_eer.txt','w');
fprintf(fileID,'%6s','eer_s6');
fprintf(fileID,'%12.8f',eer_s6*100);
fclose(fileID);

%===================
% S7
%===================
%-----------------------------
% IMFCC, APGDF and FFV fusion
%------------------------------

clear;clc;
load fusion_weight_cqccdbd_apgddbd_ffvfd.mat;

%Fusion on evaluation data

a1_s7_eval_target=importdata('cqcc_s7_dbd_score_target_eval.txt');
a2_s7_eval_target=importdata('apgd_s7_dbd_score_target_eval.txt'); %Evaluation target score
a3_s7_eval_target=importdata('ffv_s7_fd_score_target_eval.txt');

b_eval_target=[a1_s7_eval_target.data';a2_s7_eval_target.data';a3_s7_eval_target.data'];

a1_s7_eval_nontarget=importdata('cqcc_s7_dbd_score_nontarget_eval.txt');
a2_s7_eval_nontarget=importdata('apgd_s7_dbd_score_nontarget_eval.txt'); %Evaluation nontarget score
a3_s7_eval_nontarget=importdata('ffv_s7_fd_score_nontarget_eval.txt');

b_eval_nontarget=[a1_s7_eval_nontarget.data';a2_s7_eval_nontarget.data';a3_s7_eval_nontarget.data'];

f_target = lin_fusion(w,b_eval_target); %fusion 
f_nontarget = lin_fusion(w,b_eval_nontarget); %fusion 

[x,y,eer_s7] = rocchdet(f_target,f_nontarget); %EER calculation

fileID = fopen('fusion_eval_cqcc_apgd_ffv2_dd_s7_eer.txt','w');
fprintf(fileID,'%6s','eer_s7');
fprintf(fileID,'%12.8f',eer_s7*100);
fclose(fileID);

%===================
% S8
%===================
%-----------------------------
% IMFCC, APGDF and FFV fusion
%------------------------------

clear;clc;
load fusion_weight_cqccdbd_apgddbd_ffvfd.mat;

%Fusion on evaluation data

a1_s8_eval_target=importdata('cqcc_s8_dbd_score_target_eval.txt');
a2_s8_eval_target=importdata('apgd_s8_dbd_score_target_eval.txt'); %Evaluation target score
a3_s8_eval_target=importdata('ffv_s8_fd_score_target_eval.txt');

b_eval_target=[a1_s8_eval_target.data';a2_s8_eval_target.data';a3_s8_eval_target.data'];

a1_s8_eval_nontarget=importdata('cqcc_s8_dbd_score_nontarget_eval.txt');
a2_s8_eval_nontarget=importdata('apgd_s8_dbd_score_nontarget_eval.txt'); %Evaluation nontarget score
a3_s8_eval_nontarget=importdata('ffv_s8_fd_score_nontarget_eval.txt');

b_eval_nontarget=[a1_s8_eval_nontarget.data';a2_s8_eval_nontarget.data';a3_s8_eval_nontarget.data'];

f_target = lin_fusion(w,b_eval_target); %fusion 
f_nontarget = lin_fusion(w,b_eval_nontarget); %fusion 

[x,y,eer_s8] = rocchdet(f_target,f_nontarget); %EER calculation

fileID = fopen('fusion_eval_cqcc_apgd_ffv2_dd_s8_eer.txt','w');
fprintf(fileID,'%6s','eer_s8');
fprintf(fileID,'%12.8f',eer_s8*100);
fclose(fileID);

%===================
% S9
%===================
%-----------------------------
% IMFCC, APGDF and FFV fusion
%------------------------------

clear;clc;
load fusion_weight_cqccdbd_apgddbd_ffvfd.mat;

%Fusion on evaluation data

a1_s9_eval_target=importdata('cqcc_s9_dbd_score_target_eval.txt');
a2_s9_eval_target=importdata('apgd_s9_dbd_score_target_eval.txt'); %Evaluation target score
a3_s9_eval_target=importdata('ffv_s9_fd_score_target_eval.txt');

b_eval_target=[a1_s9_eval_target.data';a2_s9_eval_target.data';a3_s9_eval_target.data'];

a1_s9_eval_nontarget=importdata('cqcc_s9_dbd_score_nontarget_eval.txt');
a2_s9_eval_nontarget=importdata('apgd_s9_dbd_score_nontarget_eval.txt'); %Evaluation nontarget score
a3_s9_eval_nontarget=importdata('ffv_s9_fd_score_nontarget_eval.txt');

b_eval_nontarget=[a1_s9_eval_nontarget.data';a2_s9_eval_nontarget.data';a3_s9_eval_nontarget.data'];

f_target = lin_fusion(w,b_eval_target); %fusion 
f_nontarget = lin_fusion(w,b_eval_nontarget); %fusion 

[x,y,eer_s9] = rocchdet(f_target,f_nontarget); %EER calculation

fileID = fopen('fusion_eval_cqcc_apgd_ffv2_dd_s9_eer.txt','w');
fprintf(fileID,'%6s','eer_s9');
fprintf(fileID,'%12.8f',eer_s9*100);
fclose(fileID);


%===================
% S10
%===================
%-----------------------------
% IMFCC, APGDF and FFV fusion
%------------------------------

clear;clc;
load fusion_weight_cqccdbd_apgddbd_ffvfd.mat;

%Fusion on evaluation data

a1_s10_eval_target=importdata('cqcc_s10_dbd_score_target_eval.txt');
a2_s10_eval_target=importdata('apgd_s10_dbd_score_target_eval.txt'); %Evaluation target score
a3_s10_eval_target=importdata('ffv_s10_fd_score_target_eval.txt');

b_eval_target=[a1_s10_eval_target.data';a2_s10_eval_target.data';a3_s10_eval_target.data'];

a1_s10_eval_nontarget=importdata('cqcc_s10_dbd_score_nontarget_eval.txt');
a2_s10_eval_nontarget=importdata('apgd_s10_dbd_score_nontarget_eval.txt'); %Evaluation nontarget score
a3_s10_eval_nontarget=importdata('ffv_s10_fd_score_nontarget_eval.txt');

b_eval_nontarget=[a1_s10_eval_nontarget.data';a2_s10_eval_nontarget.data';a3_s10_eval_nontarget.data'];

f_target = lin_fusion(w,b_eval_target); %fusion 
f_nontarget = lin_fusion(w,b_eval_nontarget); %fusion 

[x,y,eer_s10] = rocchdet(f_target,f_nontarget); %EER calculation

fileID = fopen('fusion_eval_cqcc_apgd_ffv2_dd_s10_eer.txt','w');
fprintf(fileID,'%6s','eer_s10');
fprintf(fileID,'%12.8f',eer_s10*100);
fclose(fileID);








