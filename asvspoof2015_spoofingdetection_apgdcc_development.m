clear all;clc;
load a_key.mat
j=1;j_1=j;j_2=j;j_3=j;j_4=j;j_5=j;
data_apgd_natural=cell(3750,1);data_apgd_natural_apgdd=cell(3750,1);data_apgd_natural_dd=cell(3750,1);data_apgd_natural_dbd=cell(3750,1);
data_apgd_s1=cell(2525,1);data_apgd_s1_apgdd=cell(2525,1);data_apgd_s1_dd=cell(2525,1);data_apgd_s1_dbd=cell(2525,1);
data_apgd_s2=cell(2525,1);data_apgd_s2_apgdd=cell(2525,1);data_apgd_s2_dd=cell(2525,1);data_apgd_s2_dbd=cell(2525,1);
data_apgd_s3=cell(2525,1);data_apgd_s3_apgdd=cell(2525,1);data_apgd_s3_dd=cell(2525,1);data_apgd_s3_dbd=cell(2525,1);
data_apgd_s4=cell(2525,1);data_apgd_s4_apgdd=cell(2525,1);data_apgd_s4_dd=cell(2525,1);data_apgd_s4_dbd=cell(2525,1);
data_apgd_s5=cell(2525,1);data_apgd_s5_apgdd=cell(2525,1);data_apgd_s5_dd=cell(2525,1);data_apgd_s5_dbd=cell(2525,1);
a='D:\ASVspoof2015\wav\Training\';

for i=1:size(a_key,1)
    i
   if strcmp(aa_key{i,4},'human')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_apgdd,c_dd,c_dbd]=extract_lpGdelayVec_diff(s,20,20);
             data_apgd_natural{j,1}=c;
             data_apgd_natural_apgdd{j,1}=c_apgdd;
             data_apgd_natural_dd{j,1}=c_dd;
             data_apgd_natural_dbd{j,1}=c_dbd;j=j+1;
             clear c c_apgdd c_dd
   elseif strcmp(aa_key{i,3},'S1')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_apgdd,c_dd,c_dbd]=extract_lpGdelayVec_diff(s,20,20);
             data_apgd_s1{j_1,1}=c;
             data_apgd_s1_apgdd{j_1,1}=c_apgdd;
             data_apgd_s1_dd{j_1,1}=c_dd;
             data_apgd_s1_dbd{j_1,1}=c_dbd;j_1=j_1+1;
             clear c c_apgdd c_dd
   elseif strcmp(aa_key{i,3},'S2')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_apgdd,c_dd,c_dbd]=extract_lpGdelayVec_diff(s,20,20);
             data_apgd_s2{j_2,1}=c;
             data_apgd_s2_apgdd{j_2,1}=c_apgdd;
             data_apgd_s2_dd{j_2,1}=c_dd;
             data_apgd_s2_dbd{j_2,1}=c_dbd;j_2=j_2+1;
             clear c c_apgdd c_dd
   elseif strcmp(aa_key{i,3},'S3')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_apgdd,c_dd,c_dbd]=extract_lpGdelayVec_diff(s,20,20);
             data_apgd_s3{j_3,1}=c;
             data_apgd_s3_apgdd{j_3,1}=c_apgdd;
             data_apgd_s3_dd{j_3,1}=c_dd;
             data_apgd_s3_dbd{j_3,1}=c_dbd;j_3=j_3+1;
             clear c c_apgdd c_dd
   elseif strcmp(aa_key{i,3},'S4')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_apgdd,c_dd,c_dbd]=extract_lpGdelayVec_diff(s,20,20);
             data_apgd_s4{j_4,1}=c;
             data_apgd_s4_apgdd{j_4,1}=c_apgdd;
             data_apgd_s4_dd{j_4,1}=c_dd;
             data_apgd_s4_dbd{j_4,1}=c_dbd;j_4=j_4+1;
             clear c c_apgdd c_dd
   elseif strcmp(aa_key{i,3},'S5')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_apgdd,c_dd,c_dbd]=extract_lpGdelayVec_diff(s,20,20);
             data_apgd_s5{j_5,1}=c;
             data_apgd_s5_apgdd{j_5,1}=c_apgdd;
             data_apgd_s5_dd{j_5,1}=c_dd;
             data_apgd_s5_dbd{j_5,1}=c_dbd;j_5=j_5+1;
             clear c c_apgdd c_dd
   end
end
   
save data_apgd_development_natural.mat -v7.3 data_apgd_natural data_apgd_natural_apgdd data_apgd_natural_dd data_apgd_natural_dbd 
save data_apgd_development_s1.mat -v7.3 data_apgd_s1 data_apgd_s1_apgdd data_apgd_s1_dd data_apgd_s1_dbd
save data_apgd_development_s2.mat -v7.3 data_apgd_s2 data_apgd_s2_apgdd data_apgd_s2_dd data_apgd_s2_dbd
save data_apgd_development_s3.mat -v7.3 data_apgd_s3 data_apgd_s3_apgdd data_apgd_s3_dd data_apgd_s3_dbd
save data_apgd_development_s4.mat -v7.3 data_apgd_s4 data_apgd_s4_apgdd data_apgd_s4_dd data_apgd_s4_dbd
save data_apgd_development_s5.mat -v7.3 data_apgd_s5 data_apgd_s5_apgdd data_apgd_s5_dd data_apgd_s5_dbd
%% ML algorithm 
nWorkers = 24;nmix =512;final_niter = 10;ds_factor = 1;
EM_apgd_natural= gmm_em(data_apgd_natural, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_natural.mat EM_apgd_natural

EM_apgd_natural_apgdd= gmm_em(data_apgd_natural_apgdd, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_natural_apgdd.mat EM_apgd_natural_apgdd

EM_apgd_natural_dd= gmm_em(data_apgd_natural_dd, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_natural_dd.mat EM_apgd_natural_dd

EM_apgd_natural_dbd= gmm_em(data_apgd_natural_dbd, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_natural_dbd.mat EM_apgd_natural_dbd

EM_apgd_s1= gmm_em(data_apgd_s1, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_s1.mat EM_apgd_s1

EM_apgd_s1_apgdd= gmm_em(data_apgd_s1_apgdd, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_s1_apgdd.mat EM_apgd_s1_apgdd

EM_apgd_s1_dd= gmm_em(data_apgd_s1_dd, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_s1_dd.mat EM_apgd_s1_dd

EM_apgd_s1_dbd= gmm_em(data_apgd_s1_dbd, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_s1_dbd.mat EM_apgd_s1_dbd

EM_apgd_s2= gmm_em(data_apgd_s2, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_s2.mat EM_apgd_s2

EM_apgd_s2_apgdd= gmm_em(data_apgd_s2_apgdd, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_s2_apgdd.mat EM_apgd_s2_apgdd

EM_apgd_s2_dd= gmm_em(data_apgd_s2_dd, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_s2_dd.mat EM_apgd_s2_dd

EM_apgd_s2_dbd= gmm_em(data_apgd_s2_dbd, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_s2_dbd.mat EM_apgd_s2_dbd

EM_apgd_s3= gmm_em(data_apgd_s3, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_s3.mat EM_apgd_s3

EM_apgd_s3_apgdd= gmm_em(data_apgd_s3_apgdd, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_s3_apgdd.mat EM_apgd_s3_apgdd

EM_apgd_s3_dd= gmm_em(data_apgd_s3_dd, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_s3_dd.mat EM_apgd_s3_dd

EM_apgd_s3_dbd= gmm_em(data_apgd_s3_dbd, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_s3_dbd.mat EM_apgd_s3_dbd

EM_apgd_s4= gmm_em(data_apgd_s4, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_s4.mat EM_apgd_s4

EM_apgd_s4_apgdd= gmm_em(data_apgd_s4_apgdd, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_s4_apgdd.mat EM_apgd_s4_apgdd

EM_apgd_s4_dd= gmm_em(data_apgd_s4_dd, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_s4_dd.mat EM_apgd_s4_dd

EM_apgd_s4_dbd= gmm_em(data_apgd_s4_dbd, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_s4_dbd.mat EM_apgd_s4_dbd

EM_apgd_s5= gmm_em(data_apgd_s5, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_s5.mat EM_apgd_s5

EM_apgd_s5_apgdd= gmm_em(data_apgd_s5_apgdd, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_s5_apgdd.mat EM_apgd_s5_apgdd

EM_apgd_s5_dd= gmm_em(data_apgd_s5_dd, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_s5_dd.mat EM_apgd_s5_dd

EM_apgd_s5_dbd= gmm_em(data_apgd_s5_dbd, nmix, final_niter, ds_factor, nWorkers);
save EM_apgd_s5_dbd.mat EM_apgd_s5_dbd
%% test utterences
clear all;clc; 
load a_key_test.mat
data_apgd_natural_test=cell(3497,1);data_apgd_natural_apgdd_test=cell(3497,1);data_apgd_natural_dd_test=cell(3497,1);data_apgd_natural_dbd_test=cell(3497,1);
data_apgd_s1_test=cell(9975,1);data_apgd_s1_apgdd_test=cell(9975,1);data_apgd_s1_dd_test=cell(9975,1);data_apgd_s1_dbd_test=cell(9975,1);
data_apgd_s2_test=cell(9975,1);data_apgd_s2_apgdd_test=cell(9975,1);data_apgd_s2_dd_test=cell(9975,1);data_apgd_s2_dbd_test=cell(9975,1);
data_apgd_s3_test=cell(9975,1);data_apgd_s3_apgdd_test=cell(9975,1);data_apgd_s3_dd_test=cell(9975,1);data_apgd_s3_dbd_test=cell(9975,1);
data_apgd_s4_test=cell(9975,1);data_apgd_s4_apgdd_test=cell(9975,1);data_apgd_s4_dd_test=cell(9975,1);data_apgd_s4_dbd_test=cell(9975,1);
data_apgd_s5_test=cell(9975,1);data_apgd_s5_apgdd_test=cell(9975,1);data_apgd_s5_dd_test=cell(9975,1);data_apgd_s5_dbd_test=cell(9975,1);
j=1;j_1=j;j_2=j;j_3=j;j_4=j;j_5=j;
a='D:\ASVspoof2015\wav\Development\';
for i=1:size(a_key,1)
    i
   if strcmp(aa_key{i,4},'human')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_apgdd,c_dd,c_dbd]=extract_lpGdelayVec_diff(s,20,20);
             data_apgd_natural_test{j,1}=c;
             data_apgd_natural_apgdd_test{j,1}=c_apgdd;
             data_apgd_natural_dd_test{j,1}=c_dd;
             data_apgd_natural_dbd_test{j,1}=c_dbd;j=j+1;
             clear c c_apgdd c_dd
   elseif strcmp(aa_key{i,3},'S1')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_apgdd,c_dd,c_dbd]=extract_lpGdelayVec_diff(s,20,20);
             data_apgd_s1_test{j_1,1}=c;
             data_apgd_s1_apgdd_test{j_1,1}=c_apgdd;
             data_apgd_s1_dd_test{j_1,1}=c_dd;
             data_apgd_s1_dbd_test{j_1,1}=c_dbd;j_1=j_1+1;
             clear c c_apgdd c_dd
    elseif strcmp(aa_key{i,3},'S2')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_apgdd,c_dd,c_dbd]=extract_lpGdelayVec_diff(s,20,20);
             data_apgd_s2_test{j_2,1}=c;
             data_apgd_s2_apgdd_test{j_2,1}=c_apgdd;
             data_apgd_s2_dd_test{j_2,1}=c_dd;
             data_apgd_s2_dbd_test{j_2,1}=c_dbd;j_2=j_2+1;
             clear c c_apgdd c_dd
    elseif strcmp(aa_key{i,3},'S3')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_apgdd,c_dd,c_dbd]=extract_lpGdelayVec_diff(s,20,20);
             data_apgd_s3_test{j_3,1}=c;
             data_apgd_s3_apgdd_test{j_3,1}=c_apgdd;
             data_apgd_s3_dd_test{j_3,1}=c_dd;
             data_apgd_s3_dbd_test{j_3,1}=c_dbd;j_3=j_3+1;
             clear c c_apgdd c_dd
   elseif strcmp(aa_key{i,3},'S4')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_apgdd,c_dd,c_dbd]=extract_lpGdelayVec_diff(s,20,20);
             data_apgd_s4_test{j_4,1}=c;
             data_apgd_s4_apgdd_test{j_4,1}=c_apgdd;
             data_apgd_s4_dd_test{j_4,1}=c_dd;
             data_apgd_s4_dbd_test{j_4,1}=c_dbd;j_4=j_4+1;
             clear c c_apgdd c_dd
   elseif strcmp(aa_key{i,3},'S5')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_apgdd,c_dd,c_dbd]=extract_lpGdelayVec_diff(s,20,20);
             data_apgd_s5_test{j_5,1}=c;
             data_apgd_s5_apgdd_test{j_5,1}=c_apgdd;
             data_apgd_s5_dd_test{j_5,1}=c_dd;
             data_apgd_s5_dbd_test{j_5,1}=c_dbd;j_5=j_5+1;
             clear c c_apgdd c_dd
   end
end
save feature_apgd_natural_test.mat -v7.3 data_apgd_natural_test data_apgd_natural_apgdd_test data_apgd_natural_dd_test data_apgd_natural_dbd_test
save features_apgd_synth_s1_test.mat -v7.3 data_apgd_s1_test data_apgd_s1_apgdd_test data_apgd_s1_dd_test data_apgd_s1_dbd_test
save features_apgd_synth_s2_test.mat -v7.3 data_apgd_s2_test data_apgd_s2_apgdd_test data_apgd_s2_dd_test data_apgd_s2_dbd_test
save features_apgd_synth_s3_test.mat -v7.3 data_apgd_s3_test data_apgd_s3_apgdd_test data_apgd_s3_dd_test data_apgd_s3_dbd_test
save features_apgd_synth_s4_test.mat -v7.3 data_apgd_s4_test data_apgd_s4_apgdd_test data_apgd_s4_dd_test data_apgd_s4_dbd_test
save features_apgd_synth_s5_test.mat -v7.3 data_apgd_s5_test data_apgd_s5_apgdd_test data_apgd_s5_dd_test data_apgd_s5_dbd_test

%% score computation

clear all;clc;
tic
load EM_apgd_s1.mat;
load EM_apgd_natural.mat;
load trials_nat.mat
load trials.mat

load feature_apgd_natural_test.mat
load features_apgd_synth_s1_test.mat
EM_apgd{1}=EM_apgd_natural;
EM_apgd{2}=EM_apgd_s1;
Targetgmmscore=score_gmm_trials2(EM_apgd(1),data_apgd_natural_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_apgd(2),data_apgd_natural_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_apgd(1),data_apgd_s1_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_apgd(2),data_apgd_s1_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s1] = rocchdet(Target,NonTarget);
fileID = fopen('apgd_s1_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('apgd_s1_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('apgd_s1_eer.txt','w');
fprintf(fileID,'%6s','eer_s1');
fprintf(fileID,'%12.8f',eer_s1*100);
fclose(fileID);
%% eer for apgd_s1_apgdd case 
load EM_apgd_s1_apgdd.mat;
load EM_apgd_natural_apgdd.mat;
EM_apgd{1}=EM_apgd_natural_apgdd;
EM_apgd{2}=EM_apgd_s1_apgdd;
Targetgmmscore=score_gmm_trials2(EM_apgd(1),data_apgd_natural_apgdd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_apgd(2),data_apgd_natural_apgdd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_apgd(1),data_apgd_s1_apgdd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_apgd(2),data_apgd_s1_apgdd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s1_apgdd] = rocchdet(Target,NonTarget);

fileID = fopen('apgd_s1_apgdd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('apgd_s1_apgdd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('apgd_s1_apgdd_eer.txt','w');
fprintf(fileID,'%6s','eer_s1_apgdd');
fprintf(fileID,'%12.8f',eer_s1_apgdd*100);
fclose(fileID);
%% eer for apgd_s1_dd case 
load EM_apgd_s1_dd.mat;
load EM_apgd_natural_dd.mat;
EM_apgd{1}=EM_apgd_natural_dd;
EM_apgd{2}=EM_apgd_s1_dd;
Targetgmmscore=score_gmm_trials2(EM_apgd(1),data_apgd_natural_dd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_apgd(2),data_apgd_natural_dd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_apgd(1),data_apgd_s1_dd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_apgd(2),data_apgd_s1_dd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s1_dd] = rocchdet(Target,NonTarget);

fileID = fopen('apgd_s1_dd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('apgd_s1_dd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('apgd_s1_dd_eer.txt','w');
fprintf(fileID,'%6s','eer_s1_dd');
fprintf(fileID,'%12.8f',eer_s1_dd*100);
fclose(fileID);
toc
%% eer for apgd_s1_dbd case 
load EM_apgd_s1_dbd.mat;
load EM_apgd_natural_dbd.mat;
EM_apgd{1}=EM_apgd_natural_dbd;
EM_apgd{2}=EM_apgd_s1_dbd;
Targetgmmscore=score_gmm_trials2(EM_apgd(1),data_apgd_natural_dbd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_apgd(2),data_apgd_natural_dbd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_apgd(1),data_apgd_s1_dbd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_apgd(2),data_apgd_s1_dbd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s1_dbd] = rocchdet(Target,NonTarget);

fileID = fopen('apgd_s1_dbd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('apgd_s1_dbd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('apgd_s1_dbd_eer.txt','w');
fprintf(fileID,'%6s','eer_s1_dbd');
fprintf(fileID,'%12.8f',eer_s1_dbd*100);
fclose(fileID);
toc
%% score computation

clear all;clc;
tic
load EM_apgd_s2.mat;
load EM_apgd_natural.mat;
load trials_nat.mat
load trials.mat

load feature_apgd_natural_test.mat
load features_apgd_synth_s2_test.mat
EM_apgd{1}=EM_apgd_natural;
EM_apgd{2}=EM_apgd_s2;
Targetgmmscore=score_gmm_trials2(EM_apgd(1),data_apgd_natural_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_apgd(2),data_apgd_natural_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_apgd(1),data_apgd_s2_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_apgd(2),data_apgd_s2_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s2] = rocchdet(Target,NonTarget);
fileID = fopen('apgd_s2_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('apgd_s2_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('apgd_s2_eer.txt','w');
fprintf(fileID,'%6s','eer_s2');
fprintf(fileID,'%12.8f',eer_s2*100);
fclose(fileID);
%% eer for apgd_s2_apgdd case 
load EM_apgd_s2_apgdd.mat;
load EM_apgd_natural_apgdd.mat;
EM_apgd{1}=EM_apgd_natural_apgdd;
EM_apgd{2}=EM_apgd_s2_apgdd;
Targetgmmscore=score_gmm_trials2(EM_apgd(1),data_apgd_natural_apgdd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_apgd(2),data_apgd_natural_apgdd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_apgd(1),data_apgd_s2_apgdd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_apgd(2),data_apgd_s2_apgdd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s2_apgdd] = rocchdet(Target,NonTarget);

fileID = fopen('apgd_s2_apgdd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('apgd_s2_apgdd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('apgd_s2_apgdd_eer.txt','w');
fprintf(fileID,'%6s','eer_s2_apgdd');
fprintf(fileID,'%12.8f',eer_s2_apgdd*100);
fclose(fileID);
%% eer for apgd_s2_dd case 
load EM_apgd_s2_dd.mat;
load EM_apgd_natural_dd.mat;
EM_apgd{1}=EM_apgd_natural_dd;
EM_apgd{2}=EM_apgd_s2_dd;
Targetgmmscore=score_gmm_trials2(EM_apgd(1),data_apgd_natural_dd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_apgd(2),data_apgd_natural_dd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_apgd(1),data_apgd_s2_dd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_apgd(2),data_apgd_s2_dd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s2_dd] = rocchdet(Target,NonTarget);

fileID = fopen('apgd_s2_dd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('apgd_s2_dd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('apgd_s2_dd_eer.txt','w');
fprintf(fileID,'%6s','eer_s2_dd');
fprintf(fileID,'%12.8f',eer_s2_dd*100);
fclose(fileID);
toc
%% eer for apgd_s2_dbd case 
load EM_apgd_s2_dbd.mat;
load EM_apgd_natural_dbd.mat;
EM_apgd{1}=EM_apgd_natural_dbd;
EM_apgd{2}=EM_apgd_s2_dbd;
Targetgmmscore=score_gmm_trials2(EM_apgd(1),data_apgd_natural_dbd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_apgd(2),data_apgd_natural_dbd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_apgd(1),data_apgd_s2_dbd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_apgd(2),data_apgd_s2_dbd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s2_dbd] = rocchdet(Target,NonTarget);

fileID = fopen('apgd_s2_dbd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('apgd_s2_dbd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('apgd_s2_dbd_eer.txt','w');
fprintf(fileID,'%6s','eer_s2_dbd');
fprintf(fileID,'%12.8f',eer_s2_dbd*100);
fclose(fileID);
toc
%% score computation

clear all;clc;
tic
load EM_apgd_s3.mat;
load EM_apgd_natural.mat;
load trials_nat.mat
load trials.mat

load feature_apgd_natural_test.mat
load features_apgd_synth_s3_test.mat
EM_apgd{1}=EM_apgd_natural;
EM_apgd{2}=EM_apgd_s3;
Targetgmmscore=score_gmm_trials2(EM_apgd(1),data_apgd_natural_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_apgd(2),data_apgd_natural_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_apgd(1),data_apgd_s3_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_apgd(2),data_apgd_s3_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s3] = rocchdet(Target,NonTarget);
fileID = fopen('apgd_s3_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('apgd_s3_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('apgd_s3_eer.txt','w');
fprintf(fileID,'%6s','eer_s3');
fprintf(fileID,'%12.8f',eer_s3*100);
fclose(fileID);
%% eer for apgd_s3_apgdd case 
load EM_apgd_s3_apgdd.mat;
load EM_apgd_natural_apgdd.mat;
EM_apgd{1}=EM_apgd_natural_apgdd;
EM_apgd{2}=EM_apgd_s3_apgdd;
Targetgmmscore=score_gmm_trials2(EM_apgd(1),data_apgd_natural_apgdd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_apgd(2),data_apgd_natural_apgdd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_apgd(1),data_apgd_s3_apgdd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_apgd(2),data_apgd_s3_apgdd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s3_apgdd] = rocchdet(Target,NonTarget);

fileID = fopen('apgd_s3_apgdd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('apgd_s3_apgdd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('apgd_s3_apgdd_eer.txt','w');
fprintf(fileID,'%6s','eer_s3_apgdd');
fprintf(fileID,'%12.8f',eer_s3_apgdd*100);
fclose(fileID);
%% eer for apgd_s3_dd case 
load EM_apgd_s3_dd.mat;
load EM_apgd_natural_dd.mat;
EM_apgd{1}=EM_apgd_natural_dd;
EM_apgd{2}=EM_apgd_s3_dd;
Targetgmmscore=score_gmm_trials2(EM_apgd(1),data_apgd_natural_dd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_apgd(2),data_apgd_natural_dd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_apgd(1),data_apgd_s3_dd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_apgd(2),data_apgd_s3_dd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s3_dd] = rocchdet(Target,NonTarget);

fileID = fopen('apgd_s3_dd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('apgd_s3_dd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('apgd_s3_dd_eer.txt','w');
fprintf(fileID,'%6s','eer_s3_dd');
fprintf(fileID,'%12.8f',eer_s3_dd*100);
fclose(fileID);
toc
%% eer for apgd_s3_dbd case 
load EM_apgd_s3_dbd.mat;
load EM_apgd_natural_dbd.mat;
EM_apgd{1}=EM_apgd_natural_dbd;
EM_apgd{2}=EM_apgd_s3_dbd;
Targetgmmscore=score_gmm_trials2(EM_apgd(1),data_apgd_natural_dbd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_apgd(2),data_apgd_natural_dbd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_apgd(1),data_apgd_s3_dbd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_apgd(2),data_apgd_s3_dbd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s3_dbd] = rocchdet(Target,NonTarget);

fileID = fopen('apgd_s3_dbd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('apgd_s3_dbd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('apgd_s3_dbd_eer.txt','w');
fprintf(fileID,'%6s','eer_s3_dbd');
fprintf(fileID,'%12.8f',eer_s3_dbd*100);
fclose(fileID);
toc
%% score computation

clear all;clc;
tic
load EM_apgd_s4.mat;
load EM_apgd_natural.mat;
load trials_nat.mat
load trials.mat

load feature_apgd_natural_test.mat
load features_apgd_synth_s4_test.mat
EM_apgd{1}=EM_apgd_natural;
EM_apgd{2}=EM_apgd_s4;
Targetgmmscore=score_gmm_trials2(EM_apgd(1),data_apgd_natural_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_apgd(2),data_apgd_natural_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_apgd(1),data_apgd_s4_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_apgd(2),data_apgd_s4_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s4] = rocchdet(Target,NonTarget);
fileID = fopen('apgd_s4_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('apgd_s4_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('apgd_s4_eer.txt','w');
fprintf(fileID,'%6s','eer_s4');
fprintf(fileID,'%12.8f',eer_s4*100);
fclose(fileID);
%% eer for apgd_s4_apgdd case 
load EM_apgd_s4_apgdd.mat;
load EM_apgd_natural_apgdd.mat;
EM_apgd{1}=EM_apgd_natural_apgdd;
EM_apgd{2}=EM_apgd_s4_apgdd;
Targetgmmscore=score_gmm_trials2(EM_apgd(1),data_apgd_natural_apgdd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_apgd(2),data_apgd_natural_apgdd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_apgd(1),data_apgd_s4_apgdd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_apgd(2),data_apgd_s4_apgdd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s4_apgdd] = rocchdet(Target,NonTarget);

fileID = fopen('apgd_s4_apgdd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('apgd_s4_apgdd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('apgd_s4_apgdd_eer.txt','w');
fprintf(fileID,'%6s','eer_s4_apgdd');
fprintf(fileID,'%12.8f',eer_s4_apgdd*100);
fclose(fileID);
%% eer for apgd_s4_dd case 
load EM_apgd_s4_dd.mat;
load EM_apgd_natural_dd.mat;
EM_apgd{1}=EM_apgd_natural_dd;
EM_apgd{2}=EM_apgd_s4_dd;
Targetgmmscore=score_gmm_trials2(EM_apgd(1),data_apgd_natural_dd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_apgd(2),data_apgd_natural_dd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_apgd(1),data_apgd_s4_dd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_apgd(2),data_apgd_s4_dd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s4_dd] = rocchdet(Target,NonTarget);

fileID = fopen('apgd_s4_dd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('apgd_s4_dd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('apgd_s4_dd_eer.txt','w');
fprintf(fileID,'%6s','eer_s4_dd');
fprintf(fileID,'%12.8f',eer_s4_dd*100);
fclose(fileID);
toc
%% eer for apgd_s4_dbd case 
load EM_apgd_s4_dbd.mat;
load EM_apgd_natural_dbd.mat;
EM_apgd{1}=EM_apgd_natural_dbd;
EM_apgd{2}=EM_apgd_s4_dbd;
Targetgmmscore=score_gmm_trials2(EM_apgd(1),data_apgd_natural_dbd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_apgd(2),data_apgd_natural_dbd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_apgd(1),data_apgd_s4_dbd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_apgd(2),data_apgd_s4_dbd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s4_dbd] = rocchdet(Target,NonTarget);

fileID = fopen('apgd_s4_dbd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('apgd_s4_dbd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('apgd_s4_dbd_eer.txt','w');
fprintf(fileID,'%6s','eer_s4_dbd');
fprintf(fileID,'%12.8f',eer_s4_dbd*100);
fclose(fileID);
toc
%% score computation

clear all;clc;
tic
load EM_apgd_s5.mat;
load EM_apgd_natural.mat;
load trials_nat.mat
load trials.mat

load feature_apgd_natural_test.mat
load features_apgd_synth_s5_test.mat
EM_apgd{1}=EM_apgd_natural;
EM_apgd{2}=EM_apgd_s5;
Targetgmmscore=score_gmm_trials2(EM_apgd(1),data_apgd_natural_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_apgd(2),data_apgd_natural_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_apgd(1),data_apgd_s5_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_apgd(2),data_apgd_s5_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s5] = rocchdet(Target,NonTarget);
fileID = fopen('apgd_s5_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('apgd_s5_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('apgd_s5_eer.txt','w');
fprintf(fileID,'%6s','eer_s5');
fprintf(fileID,'%12.8f',eer_s5*100);
fclose(fileID);
%% eer for apgd_s5_apgdd case 
load EM_apgd_s5_apgdd.mat;
load EM_apgd_natural_apgdd.mat;
EM_apgd{1}=EM_apgd_natural_apgdd;
EM_apgd{2}=EM_apgd_s5_apgdd;
Targetgmmscore=score_gmm_trials2(EM_apgd(1),data_apgd_natural_apgdd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_apgd(2),data_apgd_natural_apgdd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_apgd(1),data_apgd_s5_apgdd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_apgd(2),data_apgd_s5_apgdd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s5_apgdd] = rocchdet(Target,NonTarget);

fileID = fopen('apgd_s5_apgdd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('apgd_s5_apgdd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('apgd_s5_apgdd_eer.txt','w');
fprintf(fileID,'%6s','eer_s5_apgdd');
fprintf(fileID,'%12.8f',eer_s5_apgdd*100);
fclose(fileID);
%% eer for apgd_s5_dd case 
load EM_apgd_s5_dd.mat;
load EM_apgd_natural_dd.mat;
EM_apgd{1}=EM_apgd_natural_dd;
EM_apgd{2}=EM_apgd_s5_dd;
Targetgmmscore=score_gmm_trials2(EM_apgd(1),data_apgd_natural_dd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_apgd(2),data_apgd_natural_dd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_apgd(1),data_apgd_s5_dd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_apgd(2),data_apgd_s5_dd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s5_dd] = rocchdet(Target,NonTarget);

fileID = fopen('apgd_s5_dd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('apgd_s5_dd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('apgd_s5_dd_eer.txt','w');
fprintf(fileID,'%6s','eer_s5_dd');
fprintf(fileID,'%12.8f',eer_s5_dd*100);
fclose(fileID);
toc
%% eer for apgd_s5_dbd case 
load EM_apgd_s5_dbd.mat;
load EM_apgd_natural_dbd.mat;
EM_apgd{1}=EM_apgd_natural_dbd;
EM_apgd{2}=EM_apgd_s5_dbd;
Targetgmmscore=score_gmm_trials2(EM_apgd(1),data_apgd_natural_dbd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_apgd(2),data_apgd_natural_dbd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_apgd(1),data_apgd_s5_dbd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_apgd(2),data_apgd_s5_dbd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s5_dbd] = rocchdet(Target,NonTarget);

fileID = fopen('apgd_s5_dbd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('apgd_s5_dbd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('apgd_s5_dbd_eer.txt','w');
fprintf(fileID,'%6s','eer_s5_dbd');
fprintf(fileID,'%12.8f',eer_s5_dbd*100);
fclose(fileID);
toc
