clear all;clc;
load a_key.mat
j=1;j_1=j;j_2=j;j_3=j;j_4=j;j_5=j;
data_ffv_natural=cell(3750,1);data_ffv_natural_fdd=cell(3750,1);data_ffv_natural_dd=cell(3750,1);data_ffv_natural_dbd=cell(3750,1);
data_ffv_s1=cell(2525,1);data_ffv_s1_fdd=cell(2525,1);data_ffv_s1_dd=cell(2525,1);data_ffv_s1_dbd=cell(2525,1);
data_ffv_s2=cell(2525,1);data_ffv_s2_fdd=cell(2525,1);data_ffv_s2_dd=cell(2525,1);data_ffv_s2_dbd=cell(2525,1);
data_ffv_s3=cell(2525,1);data_ffv_s3_fdd=cell(2525,1);data_ffv_s3_dd=cell(2525,1);data_ffv_s3_dbd=cell(2525,1);
data_ffv_s4=cell(2525,1);data_ffv_s4_fdd=cell(2525,1);data_ffv_s4_dd=cell(2525,1);data_ffv_s4_dbd=cell(2525,1);
data_ffv_s5=cell(2525,1);data_ffv_s5_fdd=cell(2525,1);data_ffv_s5_dd=cell(2525,1);data_ffv_s5_dbd=cell(2525,1);
a='E:\Dipjyoti\ASVspoof2015\wav\training\';

for i=1:size(a_key,1)
    i
   if strcmp(aa_key{i,4},'human')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_fdd,c_dd,c_dbd]=ffv_feature_1(s);
             data_ffv_natural{j,1}=c;
             data_ffv_natural_fdd{j,1}=c_fdd;
             data_ffv_natural_dd{j,1}=c_dd;
             data_ffv_natural_dbd{j,1}=c_dbd;j=j+1;
             clear c c_fdd c_dd
   elseif strcmp(aa_key{i,3},'S1')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_fdd,c_dd,c_dbd]=ffv_feature_1(s);
             data_ffv_s1{j_1,1}=c;
             data_ffv_s1_fdd{j_1,1}=c_fdd;
             data_ffv_s1_dd{j_1,1}=c_dd;
             data_ffv_s1_dbd{j_1,1}=c_dbd;j_1=j_1+1;
             clear c c_fdd c_dd
   elseif strcmp(aa_key{i,3},'S2')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_fdd,c_dd,c_dbd]=ffv_feature_1(s);
             data_ffv_s2{j_2,1}=c;
             data_ffv_s2_fdd{j_2,1}=c_fdd;
             data_ffv_s2_dd{j_2,1}=c_dd;
             data_ffv_s2_dbd{j_2,1}=c_dbd;j_2=j_2+1;
             clear c c_fdd c_dd
   elseif strcmp(aa_key{i,3},'S3')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_fdd,c_dd,c_dbd]=ffv_feature_1(s);
             data_ffv_s3{j_3,1}=c;
             data_ffv_s3_fdd{j_3,1}=c_fdd;
             data_ffv_s3_dd{j_3,1}=c_dd;
             data_ffv_s3_dbd{j_3,1}=c_dbd;j_3=j_3+1;
             clear c c_fdd c_dd
   elseif strcmp(aa_key{i,3},'S4')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_fdd,c_dd,c_dbd]=ffv_feature_1(s);
             data_ffv_s4{j_4,1}=c;
             data_ffv_s4_fdd{j_4,1}=c_fdd;
             data_ffv_s4_dd{j_4,1}=c_dd;
             data_ffv_s4_dbd{j_4,1}=c_dbd;j_4=j_4+1;
             clear c c_fdd c_dd
   elseif strcmp(aa_key{i,3},'S5')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_fdd,c_dd,c_dbd]=ffv_feature_1(s);
             data_ffv_s5{j_5,1}=c;
             data_ffv_s5_fdd{j_5,1}=c_fdd;
             data_ffv_s5_dd{j_5,1}=c_dd;
             data_ffv_s5_dbd{j_5,1}=c_dbd;j_5=j_5+1;
             clear c c_fdd c_dd
   end
end
   
save data_ffv_development_natural.mat -v7.3 data_ffv_natural data_ffv_natural_fdd data_ffv_natural_dd data_ffv_natural_dbd 
save data_ffv_development_s1.mat -v7.3 data_ffv_s1 data_ffv_s1_fdd data_ffv_s1_dd data_ffv_s1_dbd
save data_ffv_development_s2.mat -v7.3 data_ffv_s2 data_ffv_s2_fdd data_ffv_s2_dd data_ffv_s2_dbd
save data_ffv_development_s3.mat -v7.3 data_ffv_s3 data_ffv_s3_fdd data_ffv_s3_dd data_ffv_s3_dbd
save data_ffv_development_s4.mat -v7.3 data_ffv_s4 data_ffv_s4_fdd data_ffv_s4_dd data_ffv_s4_dbd
save data_ffv_development_s5.mat -v7.3 data_ffv_s5 data_ffv_s5_fdd data_ffv_s5_dd data_ffv_s5_dbd
%% ML algorithm 
nWorkers = 24;nmix =512;final_niter = 10;ds_factor = 1;
EM_ffv_natural= gmm_em(data_ffv_natural, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_natural.mat EM_ffv_natural

EM_ffv_natural_fdd= gmm_em(data_ffv_natural_fdd, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_natural_fdd.mat EM_ffv_natural_fdd

EM_ffv_natural_dd= gmm_em(data_ffv_natural_dd, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_natural_dd.mat EM_ffv_natural_dd

EM_ffv_natural_dbd= gmm_em(data_ffv_natural_dbd, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_natural_dbd.mat EM_ffv_natural_dbd

EM_ffv_s1= gmm_em(data_ffv_s1, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_s1.mat EM_ffv_s1

EM_ffv_s1_fdd= gmm_em(data_ffv_s1_fdd, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_s1_fdd.mat EM_ffv_s1_fdd

EM_ffv_s1_dd= gmm_em(data_ffv_s1_dd, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_s1_dd.mat EM_ffv_s1_dd

EM_ffv_s1_dbd= gmm_em(data_ffv_s1_dbd, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_s1_dbd.mat EM_ffv_s1_dbd

EM_ffv_s2= gmm_em(data_ffv_s2, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_s2.mat EM_ffv_s2

EM_ffv_s2_fdd= gmm_em(data_ffv_s2_fdd, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_s2_fdd.mat EM_ffv_s2_fdd

EM_ffv_s2_dd= gmm_em(data_ffv_s2_dd, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_s2_dd.mat EM_ffv_s2_dd

EM_ffv_s2_dbd= gmm_em(data_ffv_s2_dbd, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_s2_dbd.mat EM_ffv_s2_dbd

EM_ffv_s3= gmm_em(data_ffv_s3, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_s3.mat EM_ffv_s3

EM_ffv_s3_fdd= gmm_em(data_ffv_s3_fdd, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_s3_fdd.mat EM_ffv_s3_fdd

EM_ffv_s3_dd= gmm_em(data_ffv_s3_dd, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_s3_dd.mat EM_ffv_s3_dd

EM_ffv_s3_dbd= gmm_em(data_ffv_s3_dbd, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_s3_dbd.mat EM_ffv_s3_dbd

EM_ffv_s4= gmm_em(data_ffv_s4, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_s4.mat EM_ffv_s4

EM_ffv_s4_fdd= gmm_em(data_ffv_s4_fdd, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_s4_fdd.mat EM_ffv_s4_fdd

EM_ffv_s4_dd= gmm_em(data_ffv_s4_dd, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_s4_dd.mat EM_ffv_s4_dd

EM_ffv_s4_dbd= gmm_em(data_ffv_s4_dbd, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_s4_dbd.mat EM_ffv_s4_dbd

EM_ffv_s5= gmm_em(data_ffv_s5, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_s5.mat EM_ffv_s5

EM_ffv_s5_fdd= gmm_em(data_ffv_s5_fdd, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_s5_fdd.mat EM_ffv_s5_fdd

EM_ffv_s5_dd= gmm_em(data_ffv_s5_dd, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_s5_dd.mat EM_ffv_s5_dd

EM_ffv_s5_dbd= gmm_em(data_ffv_s5_dbd, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_s5_dbd.mat EM_ffv_s5_dbd
%% test utterences
clear all;clc; 
load a_key_test.mat
data_ffv_natural_test=cell(3497,1);data_ffv_natural_fdd_test=cell(3497,1);data_ffv_natural_dd_test=cell(3497,1);data_ffv_natural_dbd_test=cell(3497,1);
data_ffv_s1_test=cell(9975,1);data_ffv_s1_fdd_test=cell(9975,1);data_ffv_s1_dd_test=cell(9975,1);data_ffv_s1_dbd_test=cell(9975,1);
data_ffv_s2_test=cell(9975,1);data_ffv_s2_fdd_test=cell(9975,1);data_ffv_s2_dd_test=cell(9975,1);data_ffv_s2_dbd_test=cell(9975,1);
data_ffv_s3_test=cell(9975,1);data_ffv_s3_fdd_test=cell(9975,1);data_ffv_s3_dd_test=cell(9975,1);data_ffv_s3_dbd_test=cell(9975,1);
data_ffv_s4_test=cell(9975,1);data_ffv_s4_fdd_test=cell(9975,1);data_ffv_s4_dd_test=cell(9975,1);data_ffv_s4_dbd_test=cell(9975,1);
data_ffv_s5_test=cell(9975,1);data_ffv_s5_fdd_test=cell(9975,1);data_ffv_s5_dd_test=cell(9975,1);data_ffv_s5_dbd_test=cell(9975,1);
j=1;j_1=j;j_2=j;j_3=j;j_4=j;j_5=j;
a='E:\Dipjyoti\ASVspoof2015\wav\Development\';
for i=1:size(a_key,1)
    i
   if strcmp(aa_key{i,4},'human')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_fdd,c_dd,c_dbd]=ffv_feature_1(s);
             data_ffv_natural_test{j,1}=c;
             data_ffv_natural_fdd_test{j,1}=c_fdd;
             data_ffv_natural_dd_test{j,1}=c_dd;
             data_ffv_natural_dbd_test{j,1}=c_dbd;j=j+1;
             clear c c_fdd c_dd
   elseif strcmp(aa_key{i,3},'S1')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_fdd,c_dd,c_dbd]=ffv_feature_1(s);
             data_ffv_s1_test{j_1,1}=c;
             data_ffv_s1_fdd_test{j_1,1}=c_fdd;
             data_ffv_s1_dd_test{j_1,1}=c_dd;
             data_ffv_s1_dbd_test{j_1,1}=c_dbd;j_1=j_1+1;
             clear c c_fdd c_dd
    elseif strcmp(aa_key{i,3},'S2')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_fdd,c_dd,c_dbd]=ffv_feature_1(s);
             data_ffv_s2_test{j_2,1}=c;
             data_ffv_s2_fdd_test{j_2,1}=c_fdd;
             data_ffv_s2_dd_test{j_2,1}=c_dd;
             data_ffv_s2_dbd_test{j_2,1}=c_dbd;j_2=j_2+1;
             clear c c_fdd c_dd
    elseif strcmp(aa_key{i,3},'S3')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_fdd,c_dd,c_dbd]=ffv_feature_1(s);
             data_ffv_s3_test{j_3,1}=c;
             data_ffv_s3_fdd_test{j_3,1}=c_fdd;
             data_ffv_s3_dd_test{j_3,1}=c_dd;
             data_ffv_s3_dbd_test{j_3,1}=c_dbd;j_3=j_3+1;
             clear c c_fdd c_dd
   elseif strcmp(aa_key{i,3},'S4')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_fdd,c_dd,c_dbd]=ffv_feature_1(s);
             data_ffv_s4_test{j_4,1}=c;
             data_ffv_s4_fdd_test{j_4,1}=c_fdd;
             data_ffv_s4_dd_test{j_4,1}=c_dd;
             data_ffv_s4_dbd_test{j_4,1}=c_dbd;j_4=j_4+1;
             clear c c_fdd c_dd
   elseif strcmp(aa_key{i,3},'S5')
             s=strcat(a,aa_key{i,1},'\',aa_key{i,2},'.wav');
             [c,c_fdd,c_dd,c_dbd]=ffv_feature_1(s);
             data_ffv_s5_test{j_5,1}=c;
             data_ffv_s5_fdd_test{j_5,1}=c_fdd;
             data_ffv_s5_dd_test{j_5,1}=c_dd;
             data_ffv_s5_dbd_test{j_5,1}=c_dbd;j_5=j_5+1;
             clear c c_fdd c_dd
   end
end
save feature_ffv_natural_test.mat -v7.3 data_ffv_natural_test data_ffv_natural_fdd_test data_ffv_natural_dd_test data_ffv_natural_dbd_test
save features_ffv_synth_s1_test.mat -v7.3 data_ffv_s1_test data_ffv_s1_fdd_test data_ffv_s1_dd_test data_ffv_s1_dbd_test
save features_ffv_synth_s2_test.mat -v7.3 data_ffv_s2_test data_ffv_s2_fdd_test data_ffv_s2_dd_test data_ffv_s2_dbd_test
save features_ffv_synth_s3_test.mat -v7.3 data_ffv_s3_test data_ffv_s3_fdd_test data_ffv_s3_dd_test data_ffv_s3_dbd_test
save features_ffv_synth_s4_test.mat -v7.3 data_ffv_s4_test data_ffv_s4_fdd_test data_ffv_s4_dd_test data_ffv_s4_dbd_test
save features_ffv_synth_s5_test.mat -v7.3 data_ffv_s5_test data_ffv_s5_fdd_test data_ffv_s5_dd_test data_ffv_s5_dbd_test

%% score computation

clear all;clc;
tic
load EM_ffv_s1.mat;
load EM_ffv_natural.mat;
load trials_nat.mat
load trials.mat

load feature_ffv_natural_test.mat
load features_ffv_synth_s1_test.mat
EM_ffv{1}=EM_ffv_natural;
EM_ffv{2}=EM_ffv_s1;
Targetgmmscore=score_gmm_trials2(EM_ffv(1),data_ffv_natural_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_ffv(2),data_ffv_natural_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_ffv(1),data_ffv_s1_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_ffv(2),data_ffv_s1_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s1] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s1_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s1_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s1_eer.txt','w');
fprintf(fileID,'%6s','eer_s1');
fprintf(fileID,'%12.8f',eer_s1*100);
fclose(fileID);
%% eer for ffv_s1_fdd case 
load EM_ffv_s1_fdd.mat;
load EM_ffv_natural_fdd.mat;
EM_ffv{1}=EM_ffv_natural_fdd;
EM_ffv{2}=EM_ffv_s1_fdd;
Targetgmmscore=score_gmm_trials2(EM_ffv(1),data_ffv_natural_fdd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_ffv(2),data_ffv_natural_fdd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_ffv(1),data_ffv_s1_fdd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_ffv(2),data_ffv_s1_fdd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s1_fdd] = rocchdet(Target,NonTarget);

fileID = fopen('ffv_s1_fdd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s1_fdd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s1_fdd_eer.txt','w');
fprintf(fileID,'%6s','eer_s1_fdd');
fprintf(fileID,'%12.8f',eer_s1_fdd*100);
fclose(fileID);
%% eer for ffv_s1_dd case 
load EM_ffv_s1_dd.mat;
load EM_ffv_natural_dd.mat;
EM_ffv{1}=EM_ffv_natural_dd;
EM_ffv{2}=EM_ffv_s1_dd;
Targetgmmscore=score_gmm_trials2(EM_ffv(1),data_ffv_natural_dd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_ffv(2),data_ffv_natural_dd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_ffv(1),data_ffv_s1_dd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_ffv(2),data_ffv_s1_dd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s1_dd] = rocchdet(Target,NonTarget);

fileID = fopen('ffv_s1_dd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s1_dd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s1_dd_eer.txt','w');
fprintf(fileID,'%6s','eer_s1_dd');
fprintf(fileID,'%12.8f',eer_s1_dd*100);
fclose(fileID);
toc
%% eer for ffv_s1_dbd case 
load EM_ffv_s1_dbd.mat;
load EM_ffv_natural_dbd.mat;
EM_ffv{1}=EM_ffv_natural_dbd;
EM_ffv{2}=EM_ffv_s1_dbd;
Targetgmmscore=score_gmm_trials2(EM_ffv(1),data_ffv_natural_dbd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_ffv(2),data_ffv_natural_dbd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_ffv(1),data_ffv_s1_dbd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_ffv(2),data_ffv_s1_dbd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s1_dbd] = rocchdet(Target,NonTarget);

fileID = fopen('ffv_s1_dbd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s1_dbd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s1_dbd_eer.txt','w');
fprintf(fileID,'%6s','eer_s1_dbd');
fprintf(fileID,'%12.8f',eer_s1_dbd*100);
fclose(fileID);
toc
%% score computation

clear all;clc;
tic
load EM_ffv_s2.mat;
load EM_ffv_natural.mat;
load trials_nat.mat
load trials.mat

load feature_ffv_natural_test.mat
load features_ffv_synth_s2_test.mat
EM_ffv{1}=EM_ffv_natural;
EM_ffv{2}=EM_ffv_s2;
Targetgmmscore=score_gmm_trials2(EM_ffv(1),data_ffv_natural_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_ffv(2),data_ffv_natural_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_ffv(1),data_ffv_s2_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_ffv(2),data_ffv_s2_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s2] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s2_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s2_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s2_eer.txt','w');
fprintf(fileID,'%6s','eer_s2');
fprintf(fileID,'%12.8f',eer_s2*100);
fclose(fileID);
%% eer for ffv_s2_fdd case 
load EM_ffv_s2_fdd.mat;
load EM_ffv_natural_fdd.mat;
EM_ffv{1}=EM_ffv_natural_fdd;
EM_ffv{2}=EM_ffv_s2_fdd;
Targetgmmscore=score_gmm_trials2(EM_ffv(1),data_ffv_natural_fdd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_ffv(2),data_ffv_natural_fdd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_ffv(1),data_ffv_s2_fdd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_ffv(2),data_ffv_s2_fdd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s2_fdd] = rocchdet(Target,NonTarget);

fileID = fopen('ffv_s2_fdd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s2_fdd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s2_fdd_eer.txt','w');
fprintf(fileID,'%6s','eer_s2_fdd');
fprintf(fileID,'%12.8f',eer_s2_fdd*100);
fclose(fileID);
%% eer for ffv_s2_dd case 
load EM_ffv_s2_dd.mat;
load EM_ffv_natural_dd.mat;
EM_ffv{1}=EM_ffv_natural_dd;
EM_ffv{2}=EM_ffv_s2_dd;
Targetgmmscore=score_gmm_trials2(EM_ffv(1),data_ffv_natural_dd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_ffv(2),data_ffv_natural_dd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_ffv(1),data_ffv_s2_dd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_ffv(2),data_ffv_s2_dd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s2_dd] = rocchdet(Target,NonTarget);

fileID = fopen('ffv_s2_dd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s2_dd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s2_dd_eer.txt','w');
fprintf(fileID,'%6s','eer_s2_dd');
fprintf(fileID,'%12.8f',eer_s2_dd*100);
fclose(fileID);
toc
%% eer for ffv_s2_dbd case 
load EM_ffv_s2_dbd.mat;
load EM_ffv_natural_dbd.mat;
EM_ffv{1}=EM_ffv_natural_dbd;
EM_ffv{2}=EM_ffv_s2_dbd;
Targetgmmscore=score_gmm_trials2(EM_ffv(1),data_ffv_natural_dbd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_ffv(2),data_ffv_natural_dbd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_ffv(1),data_ffv_s2_dbd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_ffv(2),data_ffv_s2_dbd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s2_dbd] = rocchdet(Target,NonTarget);

fileID = fopen('ffv_s2_dbd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s2_dbd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s2_dbd_eer.txt','w');
fprintf(fileID,'%6s','eer_s2_dbd');
fprintf(fileID,'%12.8f',eer_s2_dbd*100);
fclose(fileID);
toc
%% score computation

clear all;clc;
tic
load EM_ffv_s3.mat;
load EM_ffv_natural.mat;
load trials_nat.mat
load trials.mat

load feature_ffv_natural_test.mat
load features_ffv_synth_s3_test.mat
EM_ffv{1}=EM_ffv_natural;
EM_ffv{2}=EM_ffv_s3;
Targetgmmscore=score_gmm_trials2(EM_ffv(1),data_ffv_natural_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_ffv(2),data_ffv_natural_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_ffv(1),data_ffv_s3_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_ffv(2),data_ffv_s3_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s3] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s3_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s3_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s3_eer.txt','w');
fprintf(fileID,'%6s','eer_s3');
fprintf(fileID,'%12.8f',eer_s3*100);
fclose(fileID);
%% eer for ffv_s3_fdd case 
load EM_ffv_s3_fdd.mat;
load EM_ffv_natural_fdd.mat;
EM_ffv{1}=EM_ffv_natural_fdd;
EM_ffv{2}=EM_ffv_s3_fdd;
Targetgmmscore=score_gmm_trials2(EM_ffv(1),data_ffv_natural_fdd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_ffv(2),data_ffv_natural_fdd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_ffv(1),data_ffv_s3_fdd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_ffv(2),data_ffv_s3_fdd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s3_fdd] = rocchdet(Target,NonTarget);

fileID = fopen('ffv_s3_fdd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s3_fdd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s3_fdd_eer.txt','w');
fprintf(fileID,'%6s','eer_s3_fdd');
fprintf(fileID,'%12.8f',eer_s3_fdd*100);
fclose(fileID);
%% eer for ffv_s3_dd case 
load EM_ffv_s3_dd.mat;
load EM_ffv_natural_dd.mat;
EM_ffv{1}=EM_ffv_natural_dd;
EM_ffv{2}=EM_ffv_s3_dd;
Targetgmmscore=score_gmm_trials2(EM_ffv(1),data_ffv_natural_dd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_ffv(2),data_ffv_natural_dd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_ffv(1),data_ffv_s3_dd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_ffv(2),data_ffv_s3_dd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s3_dd] = rocchdet(Target,NonTarget);

fileID = fopen('ffv_s3_dd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s3_dd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s3_dd_eer.txt','w');
fprintf(fileID,'%6s','eer_s3_dd');
fprintf(fileID,'%12.8f',eer_s3_dd*100);
fclose(fileID);
toc
%% eer for ffv_s3_dbd case 
load EM_ffv_s3_dbd.mat;
load EM_ffv_natural_dbd.mat;
EM_ffv{1}=EM_ffv_natural_dbd;
EM_ffv{2}=EM_ffv_s3_dbd;
Targetgmmscore=score_gmm_trials2(EM_ffv(1),data_ffv_natural_dbd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_ffv(2),data_ffv_natural_dbd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_ffv(1),data_ffv_s3_dbd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_ffv(2),data_ffv_s3_dbd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s3_dbd] = rocchdet(Target,NonTarget);

fileID = fopen('ffv_s3_dbd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s3_dbd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s3_dbd_eer.txt','w');
fprintf(fileID,'%6s','eer_s3_dbd');
fprintf(fileID,'%12.8f',eer_s3_dbd*100);
fclose(fileID);
toc
%% score computation

clear all;clc;
tic
load EM_ffv_s4.mat;
load EM_ffv_natural.mat;
load trials_nat.mat
load trials.mat

load feature_ffv_natural_test.mat
load features_ffv_synth_s4_test.mat
EM_ffv{1}=EM_ffv_natural;
EM_ffv{2}=EM_ffv_s4;
Targetgmmscore=score_gmm_trials2(EM_ffv(1),data_ffv_natural_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_ffv(2),data_ffv_natural_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_ffv(1),data_ffv_s4_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_ffv(2),data_ffv_s4_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s4] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s4_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s4_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s4_eer.txt','w');
fprintf(fileID,'%6s','eer_s4');
fprintf(fileID,'%12.8f',eer_s4*100);
fclose(fileID);
%% eer for ffv_s4_fdd case 
load EM_ffv_s4_fdd.mat;
load EM_ffv_natural_fdd.mat;
EM_ffv{1}=EM_ffv_natural_fdd;
EM_ffv{2}=EM_ffv_s4_fdd;
Targetgmmscore=score_gmm_trials2(EM_ffv(1),data_ffv_natural_fdd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_ffv(2),data_ffv_natural_fdd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_ffv(1),data_ffv_s4_fdd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_ffv(2),data_ffv_s4_fdd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s4_fdd] = rocchdet(Target,NonTarget);

fileID = fopen('ffv_s4_fdd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s4_fdd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s4_fdd_eer.txt','w');
fprintf(fileID,'%6s','eer_s4_fdd');
fprintf(fileID,'%12.8f',eer_s4_fdd*100);
fclose(fileID);
%% eer for ffv_s4_dd case 
load EM_ffv_s4_dd.mat;
load EM_ffv_natural_dd.mat;
EM_ffv{1}=EM_ffv_natural_dd;
EM_ffv{2}=EM_ffv_s4_dd;
Targetgmmscore=score_gmm_trials2(EM_ffv(1),data_ffv_natural_dd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_ffv(2),data_ffv_natural_dd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_ffv(1),data_ffv_s4_dd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_ffv(2),data_ffv_s4_dd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s4_dd] = rocchdet(Target,NonTarget);

fileID = fopen('ffv_s4_dd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s4_dd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s4_dd_eer.txt','w');
fprintf(fileID,'%6s','eer_s4_dd');
fprintf(fileID,'%12.8f',eer_s4_dd*100);
fclose(fileID);
toc
%% eer for ffv_s4_dbd case 
load EM_ffv_s4_dbd.mat;
load EM_ffv_natural_dbd.mat;
EM_ffv{1}=EM_ffv_natural_dbd;
EM_ffv{2}=EM_ffv_s4_dbd;
Targetgmmscore=score_gmm_trials2(EM_ffv(1),data_ffv_natural_dbd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_ffv(2),data_ffv_natural_dbd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_ffv(1),data_ffv_s4_dbd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_ffv(2),data_ffv_s4_dbd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s4_dbd] = rocchdet(Target,NonTarget);

fileID = fopen('ffv_s4_dbd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s4_dbd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s4_dbd_eer.txt','w');
fprintf(fileID,'%6s','eer_s4_dbd');
fprintf(fileID,'%12.8f',eer_s4_dbd*100);
fclose(fileID);
toc
%% score computation

clear all;clc;
tic
load EM_ffv_s5.mat;
load EM_ffv_natural.mat;
load trials_nat.mat
load trials.mat

load feature_ffv_natural_test.mat
load features_ffv_synth_s5_test.mat
EM_ffv{1}=EM_ffv_natural;
EM_ffv{2}=EM_ffv_s5;
Targetgmmscore=score_gmm_trials2(EM_ffv(1),data_ffv_natural_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_ffv(2),data_ffv_natural_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_ffv(1),data_ffv_s5_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_ffv(2),data_ffv_s5_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s5] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s5_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s5_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s5_eer.txt','w');
fprintf(fileID,'%6s','eer_s5');
fprintf(fileID,'%12.8f',eer_s5*100);
fclose(fileID);
%% eer for ffv_s5_fdd case 
load EM_ffv_s5_fdd.mat;
load EM_ffv_natural_fdd.mat;
EM_ffv{1}=EM_ffv_natural_fdd;
EM_ffv{2}=EM_ffv_s5_fdd;
Targetgmmscore=score_gmm_trials2(EM_ffv(1),data_ffv_natural_fdd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_ffv(2),data_ffv_natural_fdd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_ffv(1),data_ffv_s5_fdd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_ffv(2),data_ffv_s5_fdd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s5_fdd] = rocchdet(Target,NonTarget);

fileID = fopen('ffv_s5_fdd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s5_fdd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s5_fdd_eer.txt','w');
fprintf(fileID,'%6s','eer_s5_fdd');
fprintf(fileID,'%12.8f',eer_s5_fdd*100);
fclose(fileID);
%% eer for ffv_s5_dd case 
load EM_ffv_s5_dd.mat;
load EM_ffv_natural_dd.mat;
EM_ffv{1}=EM_ffv_natural_dd;
EM_ffv{2}=EM_ffv_s5_dd;
Targetgmmscore=score_gmm_trials2(EM_ffv(1),data_ffv_natural_dd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_ffv(2),data_ffv_natural_dd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_ffv(1),data_ffv_s5_dd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_ffv(2),data_ffv_s5_dd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s5_dd] = rocchdet(Target,NonTarget);

fileID = fopen('ffv_s5_dd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s5_dd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s5_dd_eer.txt','w');
fprintf(fileID,'%6s','eer_s5_dd');
fprintf(fileID,'%12.8f',eer_s5_dd*100);
fclose(fileID);
toc
%% eer for ffv_s5_dbd case 
load EM_ffv_s5_dbd.mat;
load EM_ffv_natural_dbd.mat;
EM_ffv{1}=EM_ffv_natural_dbd;
EM_ffv{2}=EM_ffv_s5_dbd;
Targetgmmscore=score_gmm_trials2(EM_ffv(1),data_ffv_natural_dbd_test,trials_nat);
Targetgmmscore_1=score_gmm_trials2(EM_ffv(2),data_ffv_natural_dbd_test, trials_nat);

NonTargetgmmscores = score_gmm_trials2(EM_ffv(1),data_ffv_s5_dbd_test, trials);
NonTargetgmmscores_1 = score_gmm_trials2(EM_ffv(2),data_ffv_s5_dbd_test, trials);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s5_dbd] = rocchdet(Target,NonTarget);

fileID = fopen('ffv_s5_dbd_score_target.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%12.8f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s5_dbd_score_nontarget.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%12.8f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s5_dbd_eer.txt','w');
fprintf(fileID,'%6s','eer_s5_dbd');
fprintf(fileID,'%12.8f',eer_s5_dbd*100);
fclose(fileID);
toc
