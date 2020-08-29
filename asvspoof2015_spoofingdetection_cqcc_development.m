clear all;clc;
load a_key.mat
j=1;j_1=j;j_2=j;j_3=j;j_4=j;j_5=j;
data_cqcc_natural=cell(3750,1);data_cqcc_natural_cdd=cell(3750,1);data_cqcc_natural_dd=cell(3750,1);data_cqcc_natural_dbd=cell(3750,1);
data_cqcc_s1=cell(2525,1);data_cqcc_s1_cdd=cell(2525,1);data_cqcc_s1_dd=cell(2525,1);data_cqcc_s1_dbd=cell(2525,1);
data_cqcc_s2=cell(2525,1);data_cqcc_s2_cdd=cell(2525,1);data_cqcc_s2_dd=cell(2525,1);data_cqcc_s2_dbd=cell(2525,1);
data_cqcc_s3=cell(2525,1);data_cqcc_s3_cdd=cell(2525,1);data_cqcc_s3_dd=cell(2525,1);data_cqcc_s3_dbd=cell(2525,1);
data_cqcc_s4=cell(2525,1);data_cqcc_s4_cdd=cell(2525,1);data_cqcc_s4_dd=cell(2525,1);data_cqcc_s4_dbd=cell(2525,1);
data_cqcc_s5=cell(2525,1);data_cqcc_s5_cdd=cell(2525,1);data_cqcc_s5_dd=cell(2525,1);data_cqcc_s5_dbd=cell(2525,1);
a='D:\ASVspoof2015\wav\Training\';

B = 96;
fs=16000;
fmax = fs/2;
fmin = fmax/2^9;
d = 16;
cf = 19;
for i=1:size(a_key,1)
    i
   if strcmp(aa_key{i,4},'human')
             s=audioread(strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav'));
             [c,c_cdd,c_dd,c_dbd] = cqcc(s, fs, B, fmax, fmin, d, cf, 'ZsdD');
             data_cqcc_natural{j,1}=c;
             data_cqcc_natural_cdd{j,1}=c_cdd;
             data_cqcc_natural_dd{j,1}=c_dd;
             data_cqcc_natural_dbd{j,1}=c_dbd;j=j+1;
             clear c c_cdd c_dd c_dbd
   elseif strcmp(aa_key{i,3},'S1')
             s=audioread(strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav'));
             [c,c_cdd,c_dd,c_dbd]=cqcc(s, fs, B, fmax, fmin, d, cf, 'ZsdD');
             data_cqcc_s1{j_1,1}=c;
             data_cqcc_s1_cdd{j_1,1}=c_cdd;
             data_cqcc_s1_dd{j_1,1}=c_dd;
             data_cqcc_s1_dbd{j_1,1}=c_dbd;j_1=j_1+1;
             clear c c_cdd c_dd c_dbd
   elseif strcmp(aa_key{i,3},'S2')
             s=audioread(strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav'));
             [c,c_cdd,c_dd,c_dbd]=cqcc(s, fs, B, fmax, fmin, d, cf, 'ZsdD');
             data_cqcc_s2{j_2,1}=c;
             data_cqcc_s2_cdd{j_2,1}=c_cdd;
             data_cqcc_s2_dd{j_2,1}=c_dd;
             data_cqcc_s2_dbd{j_2,1}=c_dbd;j_2=j_2+1;
             clear c c_cdd c_dd c_dbd
   elseif strcmp(aa_key{i,3},'S3')
             s=audioread(strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav'));
             [c,c_cdd,c_dd,c_dbd]=cqcc(s, fs, B, fmax, fmin, d, cf, 'ZsdD');
             data_cqcc_s3{j_3,1}=c;
             data_cqcc_s3_cdd{j_3,1}=c_cdd;
             data_cqcc_s3_dd{j_3,1}=c_dd;
             data_cqcc_s3_dbd{j_3,1}=c_dbd;j_3=j_3+1;
             clear c c_cdd c_dd c_dbd
   elseif strcmp(aa_key{i,3},'S4')
             s=audioread(strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav'));
             [c,c_cdd,c_dd,c_dbd]=cqcc(s, fs, B, fmax, fmin, d, cf, 'ZsdD');
             data_cqcc_s4{j_4,1}=c;
             data_cqcc_s4_cdd{j_4,1}=c_cdd;
             data_cqcc_s4_dd{j_4,1}=c_dd;
             data_cqcc_s4_dbd{j_4,1}=c_dbd;j_4=j_4+1;
             clear c c_cdd c_dd c_dbd
   elseif strcmp(aa_key{i,3},'S5')
             s=audioread(strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav'));
             [c,c_cdd,c_dd,c_dbd]=cqcc(s, fs, B, fmax, fmin, d, cf, 'ZsdD');
             data_cqcc_s5{j_5,1}=c;
             data_cqcc_s5_cdd{j_5,1}=c_cdd;
             data_cqcc_s5_dd{j_5,1}=c_dd;
             data_cqcc_s5_dbd{j_5,1}=c_dbd;j_5=j_5+1;
             clear c c_cdd c_dd c_dbd
   end
end
   
save data_cqcc_development_natural.mat -v7.3 data_cqcc_natural data_cqcc_natural_cdd data_cqcc_natural_dd data_cqcc_natural_dbd 
save data_cqcc_development_s1.mat -v7.3 data_cqcc_s1 data_cqcc_s1_cdd data_cqcc_s1_dd data_cqcc_s1_dbd
save data_cqcc_development_s2.mat -v7.3 data_cqcc_s2 data_cqcc_s2_cdd data_cqcc_s2_dd data_cqcc_s2_dbd
save data_cqcc_development_s3.mat -v7.3 data_cqcc_s3 data_cqcc_s3_cdd data_cqcc_s3_dd data_cqcc_s3_dbd
save data_cqcc_development_s4.mat -v7.3 data_cqcc_s4 data_cqcc_s4_cdd data_cqcc_s4_dd data_cqcc_s4_dbd
save data_cqcc_development_s5.mat -v7.3 data_cqcc_s5 data_cqcc_s5_cdd data_cqcc_s5_dd data_cqcc_s5_dbd
%% ML algorithm 
nWorkers = 24;nmix =512;final_niter = 10;ds_factor = 1;
EM_cqcc_natural= gmm_em(data_cqcc_natural, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_natural.mat EM_cqcc_natural

EM_cqcc_natural_cdd= gmm_em(data_cqcc_natural_cdd, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_natural_cdd.mat EM_cqcc_natural_cdd

EM_cqcc_natural_dd= gmm_em(data_cqcc_natural_dd, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_natural_dd.mat EM_cqcc_natural_dd

EM_cqcc_natural_dbd= gmm_em(data_cqcc_natural_dbd, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_natural_dbd.mat EM_cqcc_natural_dbd

EM_cqcc_s1= gmm_em(data_cqcc_s1, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_s1.mat EM_cqcc_s1

EM_cqcc_s1_cdd= gmm_em(data_cqcc_s1_cdd, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_s1_cdd.mat EM_cqcc_s1_cdd

EM_cqcc_s1_dd= gmm_em(data_cqcc_s1_dd, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_s1_dd.mat EM_cqcc_s1_dd

EM_cqcc_s1_dbd= gmm_em(data_cqcc_s1_dbd, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_s1_dbd.mat EM_cqcc_s1_dbd

EM_cqcc_s2= gmm_em(data_cqcc_s2, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_s2.mat EM_cqcc_s2

EM_cqcc_s2_cdd= gmm_em(data_cqcc_s2_cdd, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_s2_cdd.mat EM_cqcc_s2_cdd

EM_cqcc_s2_dd= gmm_em(data_cqcc_s2_dd, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_s2_dd.mat EM_cqcc_s2_dd

EM_cqcc_s2_dbd= gmm_em(data_cqcc_s2_dbd, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_s2_dbd.mat EM_cqcc_s2_dbd

EM_cqcc_s3= gmm_em(data_cqcc_s3, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_s3.mat EM_cqcc_s3

EM_cqcc_s3_cdd= gmm_em(data_cqcc_s3_cdd, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_s3_cdd.mat EM_cqcc_s3_cdd

EM_cqcc_s3_dd= gmm_em(data_cqcc_s3_dd, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_s3_dd.mat EM_cqcc_s3_dd

EM_cqcc_s3_dbd= gmm_em(data_cqcc_s3_dbd, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_s3_dbd.mat EM_cqcc_s3_dbd

EM_cqcc_s4= gmm_em(data_cqcc_s4, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_s4.mat EM_cqcc_s4

EM_cqcc_s4_cdd= gmm_em(data_cqcc_s4_cdd, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_s4_cdd.mat EM_cqcc_s4_cdd

EM_cqcc_s4_dd= gmm_em(data_cqcc_s4_dd, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_s4_dd.mat EM_cqcc_s4_dd

EM_cqcc_s4_dbd= gmm_em(data_cqcc_s4_dbd, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_s4_dbd.mat EM_cqcc_s4_dbd

EM_cqcc_s5= gmm_em(data_cqcc_s5, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_s5.mat EM_cqcc_s5

EM_cqcc_s5_cdd= gmm_em(data_cqcc_s5_cdd, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_s5_cdd.mat EM_cqcc_s5_cdd

EM_cqcc_s5_dd= gmm_em(data_cqcc_s5_dd, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_s5_dd.mat EM_cqcc_s5_dd

EM_cqcc_s5_dbd= gmm_em(data_cqcc_s5_dbd, nmix, final_niter, ds_factor, nWorkers);
save EM_cqcc_s5_dbd.mat EM_cqcc_s5_dbd
%% test utterences
clear all;clc; 
load a_key_test.mat
data_cqcc_natural_test=cell(3497,1);data_cqcc_natural_cdd_test=cell(3497,1);data_cqcc_natural_dd_test=cell(3497,1);data_cqcc_natural_dbd_test=cell(3497,1);
data_cqcc_s1_test=cell(9975,1);data_cqcc_s1_cdd_test=cell(9975,1);data_cqcc_s1_dd_test=cell(9975,1);data_cqcc_s1_dbd_test=cell(9975,1);
data_cqcc_s2_test=cell(9975,1);data_cqcc_s2_cdd_test=cell(9975,1);data_cqcc_s2_dd_test=cell(9975,1);data_cqcc_s2_dbd_test=cell(9975,1);
data_cqcc_s3_test=cell(9975,1);data_cqcc_s3_cdd_test=cell(9975,1);data_cqcc_s3_dd_test=cell(9975,1);data_cqcc_s3_dbd_test=cell(9975,1);
data_cqcc_s4_test=cell(9975,1);data_cqcc_s4_cdd_test=cell(9975,1);data_cqcc_s4_dd_test=cell(9975,1);data_cqcc_s4_dbd_test=cell(9975,1);
data_cqcc_s5_test=cell(9975,1);data_cqcc_s5_cdd_test=cell(9975,1);data_cqcc_s5_dd_test=cell(9975,1);data_cqcc_s5_dbd_test=cell(9975,1);
j=1;j_1=j;j_2=j;j_3=j;j_4=j;j_5=j;
a='D:\ASVspoof2015\wav\Development\';
B = 96;
fs=16000;
fmax = fs/2;
fmin = fmax/2^9;
d = 16;
cf = 19;
for i=1:size(a_key,1)
    i
   if strcmp(aa_key{i,4},'human')
             s=audioread(strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav'));
             [c,c_cdd,c_dd,c_dbd]=cqcc(s, fs, B, fmax, fmin, d, cf, 'ZsdD');
             data_cqcc_natural_test{j,1}=c;
             data_cqcc_natural_cdd_test{j,1}=c_cdd;
             data_cqcc_natural_dd_test{j,1}=c_dd;
             data_cqcc_natural_dbd_test{j,1}=c_dbd;j=j+1;
             clear c c_cdd c_dd c_dbd
   elseif strcmp(aa_key{i,3},'S1')
             s=audioread(strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav'));
             [c,c_cdd,c_dd,c_dbd]=cqcc(s, fs, B, fmax, fmin, d, cf, 'ZsdD');
             data_cqcc_s1_test{j_1,1}=c;
             data_cqcc_s1_cdd_test{j_1,1}=c_cdd;
             data_cqcc_s1_dd_test{j_1,1}=c_dd;
             data_cqcc_s1_dbd_test{j_1,1}=c_dbd;j_1=j_1+1;
             clear c c_cdd c_dd c_dbd
    elseif strcmp(aa_key{i,3},'S2')
             s=audioread(strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav'));
             [c,c_cdd,c_dd,c_dbd]=cqcc(s, fs, B, fmax, fmin, d, cf, 'ZsdD');
             data_cqcc_s2_test{j_2,1}=c;
             data_cqcc_s2_cdd_test{j_2,1}=c_cdd;
             data_cqcc_s2_dd_test{j_2,1}=c_dd;
             data_cqcc_s2_dbd_test{j_2,1}=c_dbd;j_2=j_2+1;
             clear c c_cdd c_dd c_dbd
    elseif strcmp(aa_key{i,3},'S3')
             s=audioread(strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav'));
             [c,c_cdd,c_dd,c_dbd]=cqcc(s, fs, B, fmax, fmin, d, cf, 'ZsdD');
             data_cqcc_s3_test{j_3,1}=c;
             data_cqcc_s3_cdd_test{j_3,1}=c_cdd;
             data_cqcc_s3_dd_test{j_3,1}=c_dd;
             data_cqcc_s3_dbd_test{j_3,1}=c_dbd;j_3=j_3+1;
             clear c c_cdd c_dd c_dbd
   elseif strcmp(aa_key{i,3},'S4')
             s=audioread(strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav'));
             [c,c_cdd,c_dd,c_dbd]=cqcc(s, fs, B, fmax, fmin, d, cf, 'ZsdD');
             data_cqcc_s4_test{j_4,1}=c;
             data_cqcc_s4_cdd_test{j_4,1}=c_cdd;
             data_cqcc_s4_dd_test{j_4,1}=c_dd;
             data_cqcc_s4_dbd_test{j_4,1}=c_dbd;j_4=j_4+1;
             clear c c_cdd c_dd c_dbd
   elseif strcmp(aa_key{i,3},'S5')
             s=audioread(strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav'));
             [c,c_cdd,c_dd,c_dbd]=cqcc(s, fs, B, fmax, fmin, d, cf, 'ZsdD');
             data_cqcc_s5_test{j_5,1}=c;
             data_cqcc_s5_cdd_test{j_5,1}=c_cdd;
             data_cqcc_s5_dd_test{j_5,1}=c_dd;
             data_cqcc_s5_dbd_test{j_5,1}=c_dbd;j_5=j_5+1;
             clear c c_cdd c_dd c_dbd
   end
end
save feature_cqcc_natural_test.mat -v7.3 data_cqcc_natural_test data_cqcc_natural_cdd_test data_cqcc_natural_dd_test data_cqcc_natural_dbd_test
save features_cqcc_synth_s1_test.mat -v7.3 data_cqcc_s1_test data_cqcc_s1_cdd_test data_cqcc_s1_dd_test data_cqcc_s1_dbd_test
save features_cqcc_synth_s2_test.mat -v7.3 data_cqcc_s2_test data_cqcc_s2_cdd_test data_cqcc_s2_dd_test data_cqcc_s2_dbd_test
save features_cqcc_synth_s3_test.mat -v7.3 data_cqcc_s3_test data_cqcc_s3_cdd_test data_cqcc_s3_dd_test data_cqcc_s3_dbd_test
save features_cqcc_synth_s4_test.mat -v7.3 data_cqcc_s4_test data_cqcc_s4_cdd_test data_cqcc_s4_dd_test data_cqcc_s4_dbd_test
save features_cqcc_synth_s5_test.mat -v7.3 data_cqcc_s5_test data_cqcc_s5_cdd_test data_cqcc_s5_dd_test data_cqcc_s5_dbd_test

%% score computation

clear all;clc;
tic
load EM_cqcc_s1.mat;
load EM_cqcc_natural.mat;
load trials_nat.mat
load trials.mat

load feature_cqcc_natural_test.mat
load features_cqcc_synth_s1_test.mat
EM_cqcc{1}=EM_cqcc_natural;
EM_cqcc{2}=EM_cqcc_s1;
Targetgmmscore=score_gmm_trials2(EM_cqcc(1),data_cqcc_natural_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_cqcc(2),data_cqcc_natural_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_cqcc(1),data_cqcc_s1_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_cqcc(2),data_cqcc_s1_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s1] = rocchdet(Target,NonTarget);
fileID = fopen('cqcc_s1_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('cqcc_s1_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('cqcc_s1_eer.txt','w');
fprintf(fileID,'%6s','eer_s1');
fprintf(fileID,'%12.8f',eer_s1*100);
fclose(fileID);
%% eer for cqcc_s1_cdd case 
load EM_cqcc_s1_cdd.mat;
load EM_cqcc_natural_cdd.mat;
EM_cqcc{1}=EM_cqcc_natural_cdd;
EM_cqcc{2}=EM_cqcc_s1_cdd;
Targetgmmscore=score_gmm_trials2(EM_cqcc(1),data_cqcc_natural_cdd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_cqcc(2),data_cqcc_natural_cdd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_cqcc(1),data_cqcc_s1_cdd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_cqcc(2),data_cqcc_s1_cdd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s1_cdd] = rocchdet(Target,NonTarget);

fileID = fopen('cqcc_s1_cdd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('cqcc_s1_cdd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('cqcc_s1_cdd_eer.txt','w');
fprintf(fileID,'%6s','eer_s1_cdd');
fprintf(fileID,'%12.8f',eer_s1_cdd*100);
fclose(fileID);
%% eer for cqcc_s1_dd case 
load EM_cqcc_s1_dd.mat;
load EM_cqcc_natural_dd.mat;
EM_cqcc{1}=EM_cqcc_natural_dd;
EM_cqcc{2}=EM_cqcc_s1_dd;
Targetgmmscore=score_gmm_trials2(EM_cqcc(1),data_cqcc_natural_dd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_cqcc(2),data_cqcc_natural_dd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_cqcc(1),data_cqcc_s1_dd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_cqcc(2),data_cqcc_s1_dd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s1_dd] = rocchdet(Target,NonTarget);

fileID = fopen('cqcc_s1_dd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('cqcc_s1_dd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('cqcc_s1_dd_eer.txt','w');
fprintf(fileID,'%6s','eer_s1_dd');
fprintf(fileID,'%12.8f',eer_s1_dd*100);
fclose(fileID);
toc
%% eer for cqcc_s1_dbd case 
load EM_cqcc_s1_dbd.mat;
load EM_cqcc_natural_dbd.mat;
EM_cqcc{1}=EM_cqcc_natural_dbd;
EM_cqcc{2}=EM_cqcc_s1_dbd;
Targetgmmscore=score_gmm_trials2(EM_cqcc(1),data_cqcc_natural_dbd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_cqcc(2),data_cqcc_natural_dbd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_cqcc(1),data_cqcc_s1_dbd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_cqcc(2),data_cqcc_s1_dbd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s1_dbd] = rocchdet(Target,NonTarget);

fileID = fopen('cqcc_s1_dbd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('cqcc_s1_dbd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('cqcc_s1_dbd_eer.txt','w');
fprintf(fileID,'%6s','eer_s1_dbd');
fprintf(fileID,'%12.8f',eer_s1_dbd*100);
fclose(fileID);
toc
%% score computation

clear all;clc;
tic
load EM_cqcc_s2.mat;
load EM_cqcc_natural.mat;
load trials_nat.mat
load trials.mat

load feature_cqcc_natural_test.mat
load features_cqcc_synth_s2_test.mat
EM_cqcc{1}=EM_cqcc_natural;
EM_cqcc{2}=EM_cqcc_s2;
Targetgmmscore=score_gmm_trials2(EM_cqcc(1),data_cqcc_natural_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_cqcc(2),data_cqcc_natural_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_cqcc(1),data_cqcc_s2_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_cqcc(2),data_cqcc_s2_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s2] = rocchdet(Target,NonTarget);
fileID = fopen('cqcc_s2_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('cqcc_s2_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('cqcc_s2_eer.txt','w');
fprintf(fileID,'%6s','eer_s2');
fprintf(fileID,'%12.8f',eer_s2*100);
fclose(fileID);
%% eer for cqcc_s2_cdd case 
load EM_cqcc_s2_cdd.mat;
load EM_cqcc_natural_cdd.mat;
EM_cqcc{1}=EM_cqcc_natural_cdd;
EM_cqcc{2}=EM_cqcc_s2_cdd;
Targetgmmscore=score_gmm_trials2(EM_cqcc(1),data_cqcc_natural_cdd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_cqcc(2),data_cqcc_natural_cdd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_cqcc(1),data_cqcc_s2_cdd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_cqcc(2),data_cqcc_s2_cdd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s2_cdd] = rocchdet(Target,NonTarget);

fileID = fopen('cqcc_s2_cdd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('cqcc_s2_cdd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('cqcc_s2_cdd_eer.txt','w');
fprintf(fileID,'%6s','eer_s2_cdd');
fprintf(fileID,'%12.8f',eer_s2_cdd*100);
fclose(fileID);
%% eer for cqcc_s2_dd case 
load EM_cqcc_s2_dd.mat;
load EM_cqcc_natural_dd.mat;
EM_cqcc{1}=EM_cqcc_natural_dd;
EM_cqcc{2}=EM_cqcc_s2_dd;
Targetgmmscore=score_gmm_trials2(EM_cqcc(1),data_cqcc_natural_dd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_cqcc(2),data_cqcc_natural_dd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_cqcc(1),data_cqcc_s2_dd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_cqcc(2),data_cqcc_s2_dd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s2_dd] = rocchdet(Target,NonTarget);

fileID = fopen('cqcc_s2_dd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('cqcc_s2_dd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('cqcc_s2_dd_eer.txt','w');
fprintf(fileID,'%6s','eer_s2_dd');
fprintf(fileID,'%12.8f',eer_s2_dd*100);
fclose(fileID);
toc
%% eer for cqcc_s2_dbd case 
load EM_cqcc_s2_dbd.mat;
load EM_cqcc_natural_dbd.mat;
EM_cqcc{1}=EM_cqcc_natural_dbd;
EM_cqcc{2}=EM_cqcc_s2_dbd;
Targetgmmscore=score_gmm_trials2(EM_cqcc(1),data_cqcc_natural_dbd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_cqcc(2),data_cqcc_natural_dbd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_cqcc(1),data_cqcc_s2_dbd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_cqcc(2),data_cqcc_s2_dbd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s2_dbd] = rocchdet(Target,NonTarget);

fileID = fopen('cqcc_s2_dbd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('cqcc_s2_dbd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('cqcc_s2_dbd_eer.txt','w');
fprintf(fileID,'%6s','eer_s2_dbd');
fprintf(fileID,'%12.8f',eer_s2_dbd*100);
fclose(fileID);
toc
%% score computation

clear all;clc;
tic
load EM_cqcc_s3.mat;
load EM_cqcc_natural.mat;
load trials_nat.mat
load trials.mat

load feature_cqcc_natural_test.mat
load features_cqcc_synth_s3_test.mat
EM_cqcc{1}=EM_cqcc_natural;
EM_cqcc{2}=EM_cqcc_s3;
Targetgmmscore=score_gmm_trials2(EM_cqcc(1),data_cqcc_natural_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_cqcc(2),data_cqcc_natural_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_cqcc(1),data_cqcc_s3_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_cqcc(2),data_cqcc_s3_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s3] = rocchdet(Target,NonTarget);
fileID = fopen('cqcc_s3_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('cqcc_s3_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('cqcc_s3_eer.txt','w');
fprintf(fileID,'%6s','eer_s3');
fprintf(fileID,'%12.8f',eer_s3*100);
fclose(fileID);
%% eer for cqcc_s3_cdd case 
load EM_cqcc_s3_cdd.mat;
load EM_cqcc_natural_cdd.mat;
EM_cqcc{1}=EM_cqcc_natural_cdd;
EM_cqcc{2}=EM_cqcc_s3_cdd;
Targetgmmscore=score_gmm_trials2(EM_cqcc(1),data_cqcc_natural_cdd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_cqcc(2),data_cqcc_natural_cdd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_cqcc(1),data_cqcc_s3_cdd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_cqcc(2),data_cqcc_s3_cdd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s3_cdd] = rocchdet(Target,NonTarget);

fileID = fopen('cqcc_s3_cdd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('cqcc_s3_cdd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('cqcc_s3_cdd_eer.txt','w');
fprintf(fileID,'%6s','eer_s3_cdd');
fprintf(fileID,'%12.8f',eer_s3_cdd*100);
fclose(fileID);
%% eer for cqcc_s3_dd case 
load EM_cqcc_s3_dd.mat;
load EM_cqcc_natural_dd.mat;
EM_cqcc{1}=EM_cqcc_natural_dd;
EM_cqcc{2}=EM_cqcc_s3_dd;
Targetgmmscore=score_gmm_trials2(EM_cqcc(1),data_cqcc_natural_dd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_cqcc(2),data_cqcc_natural_dd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_cqcc(1),data_cqcc_s3_dd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_cqcc(2),data_cqcc_s3_dd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s3_dd] = rocchdet(Target,NonTarget);

fileID = fopen('cqcc_s3_dd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('cqcc_s3_dd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('cqcc_s3_dd_eer.txt','w');
fprintf(fileID,'%6s','eer_s3_dd');
fprintf(fileID,'%12.8f',eer_s3_dd*100);
fclose(fileID);
toc
%% eer for cqcc_s3_dbd case 
load EM_cqcc_s3_dbd.mat;
load EM_cqcc_natural_dbd.mat;
EM_cqcc{1}=EM_cqcc_natural_dbd;
EM_cqcc{2}=EM_cqcc_s3_dbd;
Targetgmmscore=score_gmm_trials2(EM_cqcc(1),data_cqcc_natural_dbd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_cqcc(2),data_cqcc_natural_dbd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_cqcc(1),data_cqcc_s3_dbd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_cqcc(2),data_cqcc_s3_dbd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s3_dbd] = rocchdet(Target,NonTarget);

fileID = fopen('cqcc_s3_dbd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('cqcc_s3_dbd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('cqcc_s3_dbd_eer.txt','w');
fprintf(fileID,'%6s','eer_s3_dbd');
fprintf(fileID,'%12.8f',eer_s3_dbd*100);
fclose(fileID);
toc
%% score computation

clear all;clc;
tic
load EM_cqcc_s4.mat;
load EM_cqcc_natural.mat;
load trials_nat.mat
load trials.mat

load feature_cqcc_natural_test.mat
load features_cqcc_synth_s4_test.mat
EM_cqcc{1}=EM_cqcc_natural;
EM_cqcc{2}=EM_cqcc_s4;
Targetgmmscore=score_gmm_trials2(EM_cqcc(1),data_cqcc_natural_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_cqcc(2),data_cqcc_natural_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_cqcc(1),data_cqcc_s4_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_cqcc(2),data_cqcc_s4_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s4] = rocchdet(Target,NonTarget);
fileID = fopen('cqcc_s4_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('cqcc_s4_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('cqcc_s4_eer.txt','w');
fprintf(fileID,'%6s','eer_s4');
fprintf(fileID,'%12.8f',eer_s4*100);
fclose(fileID);
%% eer for cqcc_s4_cdd case 
load EM_cqcc_s4_cdd.mat;
load EM_cqcc_natural_cdd.mat;
EM_cqcc{1}=EM_cqcc_natural_cdd;
EM_cqcc{2}=EM_cqcc_s4_cdd;
Targetgmmscore=score_gmm_trials2(EM_cqcc(1),data_cqcc_natural_cdd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_cqcc(2),data_cqcc_natural_cdd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_cqcc(1),data_cqcc_s4_cdd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_cqcc(2),data_cqcc_s4_cdd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s4_cdd] = rocchdet(Target,NonTarget);

fileID = fopen('cqcc_s4_cdd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('cqcc_s4_cdd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('cqcc_s4_cdd_eer.txt','w');
fprintf(fileID,'%6s','eer_s4_cdd');
fprintf(fileID,'%12.8f',eer_s4_cdd*100);
fclose(fileID);
%% eer for cqcc_s4_dd case 
load EM_cqcc_s4_dd.mat;
load EM_cqcc_natural_dd.mat;
EM_cqcc{1}=EM_cqcc_natural_dd;
EM_cqcc{2}=EM_cqcc_s4_dd;
Targetgmmscore=score_gmm_trials2(EM_cqcc(1),data_cqcc_natural_dd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_cqcc(2),data_cqcc_natural_dd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_cqcc(1),data_cqcc_s4_dd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_cqcc(2),data_cqcc_s4_dd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s4_dd] = rocchdet(Target,NonTarget);

fileID = fopen('cqcc_s4_dd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('cqcc_s4_dd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('cqcc_s4_dd_eer.txt','w');
fprintf(fileID,'%6s','eer_s4_dd');
fprintf(fileID,'%12.8f',eer_s4_dd*100);
fclose(fileID);
toc
%% eer for cqcc_s4_dbd case 
load EM_cqcc_s4_dbd.mat;
load EM_cqcc_natural_dbd.mat;
EM_cqcc{1}=EM_cqcc_natural_dbd;
EM_cqcc{2}=EM_cqcc_s4_dbd;
Targetgmmscore=score_gmm_trials2(EM_cqcc(1),data_cqcc_natural_dbd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_cqcc(2),data_cqcc_natural_dbd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_cqcc(1),data_cqcc_s4_dbd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_cqcc(2),data_cqcc_s4_dbd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s4_dbd] = rocchdet(Target,NonTarget);

fileID = fopen('cqcc_s4_dbd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('cqcc_s4_dbd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('cqcc_s4_dbd_eer.txt','w');
fprintf(fileID,'%6s','eer_s4_dbd');
fprintf(fileID,'%12.8f',eer_s4_dbd*100);
fclose(fileID);
toc
%% score computation

clear all;clc;
tic
load EM_cqcc_s5.mat;
load EM_cqcc_natural.mat;
load trials_nat.mat
load trials.mat

load feature_cqcc_natural_test.mat
load features_cqcc_synth_s5_test.mat
EM_cqcc{1}=EM_cqcc_natural;
EM_cqcc{2}=EM_cqcc_s5;
Targetgmmscore=score_gmm_trials2(EM_cqcc(1),data_cqcc_natural_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_cqcc(2),data_cqcc_natural_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_cqcc(1),data_cqcc_s5_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_cqcc(2),data_cqcc_s5_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s5] = rocchdet(Target,NonTarget);
fileID = fopen('cqcc_s5_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('cqcc_s5_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('cqcc_s5_eer.txt','w');
fprintf(fileID,'%6s','eer_s5');
fprintf(fileID,'%12.8f',eer_s5*100);
fclose(fileID);
%% eer for cqcc_s5_cdd case 
load EM_cqcc_s5_cdd.mat;
load EM_cqcc_natural_cdd.mat;
EM_cqcc{1}=EM_cqcc_natural_cdd;
EM_cqcc{2}=EM_cqcc_s5_cdd;
Targetgmmscore=score_gmm_trials2(EM_cqcc(1),data_cqcc_natural_cdd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_cqcc(2),data_cqcc_natural_cdd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_cqcc(1),data_cqcc_s5_cdd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_cqcc(2),data_cqcc_s5_cdd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s5_cdd] = rocchdet(Target,NonTarget);

fileID = fopen('cqcc_s5_cdd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('cqcc_s5_cdd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('cqcc_s5_cdd_eer.txt','w');
fprintf(fileID,'%6s','eer_s5_cdd');
fprintf(fileID,'%12.8f',eer_s5_cdd*100);
fclose(fileID);
%% eer for cqcc_s5_dd case 
load EM_cqcc_s5_dd.mat;
load EM_cqcc_natural_dd.mat;
EM_cqcc{1}=EM_cqcc_natural_dd;
EM_cqcc{2}=EM_cqcc_s5_dd;
Targetgmmscore=score_gmm_trials2(EM_cqcc(1),data_cqcc_natural_dd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_cqcc(2),data_cqcc_natural_dd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_cqcc(1),data_cqcc_s5_dd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_cqcc(2),data_cqcc_s5_dd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s5_dd] = rocchdet(Target,NonTarget);

fileID = fopen('cqcc_s5_dd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('cqcc_s5_dd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('cqcc_s5_dd_eer.txt','w');
fprintf(fileID,'%6s','eer_s5_dd');
fprintf(fileID,'%12.8f',eer_s5_dd*100);
fclose(fileID);
toc
%% eer for cqcc_s5_dbd case 
load EM_cqcc_s5_dbd.mat;
load EM_cqcc_natural_dbd.mat;
EM_cqcc{1}=EM_cqcc_natural_dbd;
EM_cqcc{2}=EM_cqcc_s5_dbd;
Targetgmmscore=score_gmm_trials2(EM_cqcc(1),data_cqcc_natural_dbd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_cqcc(2),data_cqcc_natural_dbd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_cqcc(1),data_cqcc_s5_dbd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_cqcc(2),data_cqcc_s5_dbd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s5_dbd] = rocchdet(Target,NonTarget);

fileID = fopen('cqcc_s5_dbd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('cqcc_s5_dbd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('cqcc_s5_dbd_eer.txt','w');
fprintf(fileID,'%6s','eer_s5_dbd');
fprintf(fileID,'%12.8f',eer_s5_dbd*100);
fclose(fileID);
toc
