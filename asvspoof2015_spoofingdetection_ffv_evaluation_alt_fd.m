%% ffv training
% clear all;clc;

load data_ffv_development_s1_1.mat;
load data_ffv_development_s2_1.mat;
load data_ffv_development_s3_1.mat;
load data_ffv_development_s4_1.mat;
load data_ffv_development_s5_1.mat;

data_ffv_synth_fd=[data_ffv_s1_fd;data_ffv_s2_fd;data_ffv_s3_fd;data_ffv_s4_fd;data_ffv_s5_fd];

%%
% %% ML algorithm 

nWorkers = 24;nmix =512;final_niter = 10;ds_factor = 1;

EM_ffv_synth_fd= gmm_em(data_ffv_synth_fd, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_synth_fd.mat EM_ffv_synth_fd

%% eval utterences
clear all;clc; 
load aa_key_eval.mat;
data_ffv_natural_fd_eval=cell(9404,1);
j=1;
a='D:\ASVspoof2015\wav\Evaluation\';
for i=1:size(aa_key_eval,1)
    i
   if strcmp(aa_key_eval{i,4},'human')
             s=strcat(a,aa_key_eval{i,1},'\',aa_key_eval{i,2},'.wav');
             [d,c_fd,c_fA]=ffv_feature_2(s);
             data_ffv_natural_fd_eval{j,1}=c_fd;
             j=j+1;
             clear d c_fd c_fA
   end
end
save feature_ffv_natural_1_eval.mat -v7.3 data_ffv_natural_fd_eval;
clear all;clc; 
load aa_key_eval.mat;
data_ffv_s1_fd_eval=cell(18400,1);
j_1=1;
a='D:\ASVspoof2015\wav\Evaluation\';
for i=1:size(aa_key_eval,1)
    i
   if strcmp(aa_key_eval{i,3},'S1')
             s=strcat(a,aa_key_eval{i,1},'\',aa_key_eval{i,2},'.wav');
             [d,c_fd,c_fA]=ffv_feature_2(s);
             data_ffv_s1_fd_eval{j_1,1}=c_fd;
             j_1=j_1+1;
             clear d c_fd c_fA
   end
end
save features_ffv_synth_s1_1_eval.mat -v7.3 data_ffv_s1_fd_eval;
clear all;clc; 
load aa_key_eval.mat;
data_ffv_s2_fd_eval=cell(18400,1);
j_2=1;
a='D:\ASVspoof2015\wav\Evaluation\';
for i=1:size(aa_key_eval,1)
    i
   if strcmp(aa_key_eval{i,3},'S2')
             s=strcat(a,aa_key_eval{i,1},'\',aa_key_eval{i,2},'.wav');
             [d,c_fd,c_fA]=ffv_feature_2(s);
             data_ffv_s2_fd_eval{j_2,1}=c_fd;
             j_2=j_2+1;
             clear d c_fd c_fA
   end
end
save features_ffv_synth_s2_1_eval.mat -v7.3 data_ffv_s2_fd_eval;
clear all;clc; 
load aa_key_eval.mat;
data_ffv_s3_fd_eval=cell(18400,1);
j_3=1;
a='D:\ASVspoof2015\wav\Evaluation\';
for i=1:size(aa_key_eval,1)
    i
   if strcmp(aa_key_eval{i,3},'S3')
             s=strcat(a,aa_key_eval{i,1},'\',aa_key_eval{i,2},'.wav');
             [d,c_fd,c_fA]=ffv_feature_2(s);
             data_ffv_s3_fd_eval{j_3,1}=c_fd;
             j_3=j_3+1;
             clear d c_fd c_fA
   end
end
save features_ffv_synth_s3_1_eval.mat -v7.3 data_ffv_s3_fd_eval;
clear all;clc; 
load aa_key_eval.mat;
data_ffv_s4_fd_eval=cell(18400,1);
j_4=1;
a='D:\ASVspoof2015\wav\Evaluation\';
for i=1:size(aa_key_eval,1)
    i
   if strcmp(aa_key_eval{i,3},'S4')
             s=strcat(a,aa_key_eval{i,1},'\',aa_key_eval{i,2},'.wav');
             [d,c_fd,c_fA]=ffv_feature_2(s);
             data_ffv_s4_fd_eval{j_4,1}=c_fd;
             j_4=j_4+1;
             clear d c_fd c_fA
   end
end
save features_ffv_synth_s4_1_eval.mat -v7.3 data_ffv_s4_fd_eval;
clear all;clc; 
load aa_key_eval.mat;
data_ffv_s5_fd_eval=cell(18400,1);
j_5=1;
a='D:\ASVspoof2015\wav\Evaluation\';
for i=1:size(aa_key_eval,1)
    i
   if strcmp(aa_key_eval{i,3},'S5')
             s=strcat(a,aa_key_eval{i,1},'\',aa_key_eval{i,2},'.wav');
             [d,c_fd,c_fA]=ffv_feature_2(s);
             data_ffv_s5_fd_eval{j_5,1}=c_fd;
             j_5=j_5+1;
             clear d c_fd c_fA
   end
end
save features_ffv_synth_s5_1_eval.mat -v7.3 data_ffv_s5_fd_eval;
clear all;clc; 
load aa_key_eval.mat;
data_ffv_s6_fd_eval=cell(18400,1);
j_6=1;
a='D:\ASVspoof2015\wav\Evaluation\';
for i=1:size(aa_key_eval,1)
    i
   if strcmp(aa_key_eval{i,3},'S6')
             s=strcat(a,aa_key_eval{i,1},'\',aa_key_eval{i,2},'.wav');
             [d,c_fd,c_fA]=ffv_feature_2(s);
             data_ffv_s6_fd_eval{j_6,1}=c_fd;
             j_6=j_6+1;
             clear d c_fd c_fA
   end
end
save features_ffv_synth_s6_1_eval.mat -v7.3 data_ffv_s6_fd_eval;
clear all;clc; 
load aa_key_eval.mat;
data_ffv_s7_fd_eval=cell(18400,1);
j_7=1;
a='D:\ASVspoof2015\wav\Evaluation\';
for i=1:size(aa_key_eval,1)
    i
   if strcmp(aa_key_eval{i,3},'S7')
             s=strcat(a,aa_key_eval{i,1},'\',aa_key_eval{i,2},'.wav');
             [d,c_fd,c_fA]=ffv_feature_2(s);
             data_ffv_s7_fd_eval{j_7,1}=c_fd;
             j_7=j_7+1;
             clear d c_fd c_fA
   end
end
save features_ffv_synth_s7_1_eval.mat -v7.3 data_ffv_s7_fd_eval;
clear all;clc; 
load aa_key_eval.mat;
data_ffv_s8_fd_eval=cell(18400,1);
j_8=1;
a='D:\ASVspoof2015\wav\Evaluation\';
for i=1:size(aa_key_eval,1)
    i
   if strcmp(aa_key_eval{i,3},'S8')
             s=strcat(a,aa_key_eval{i,1},'\',aa_key_eval{i,2},'.wav');
             [d,c_fd,c_fA]=ffv_feature_2(s);
             data_ffv_s8_fd_eval{j_8,1}=c_fd;
             j_8=j_8+1;
             clear d c_fd c_fA
   end
end
save features_ffv_synth_s8_1_eval.mat -v7.3 data_ffv_s8_fd_eval;
clear all;clc; 
load aa_key_eval.mat;
data_ffv_s9_fd_eval=cell(18400,1);
j_9=1;
a='D:\ASVspoof2015\wav\Evaluation\';
for i=1:size(aa_key_eval,1)
    i
   if strcmp(aa_key_eval{i,3},'S9')
             s=strcat(a,aa_key_eval{i,1},'\',aa_key_eval{i,2},'.wav');
             [d,c_fd,c_fA]=ffv_feature_2(s);
             data_ffv_s9_fd_eval{j_9,1}=c_fd;
             j_9=j_9+1;
             clear d c_fd c_fA
   end
end
save features_ffv_synth_s9_1_eval.mat -v7.3 data_ffv_s9_fd_eval;
clear all;clc; 
load aa_key_eval.mat;
data_ffv_s10_fd_eval=cell(18400,1);
j_10=1;
a='D:\ASVspoof2015\wav\Evaluation\';
for i=1:size(aa_key_eval,1)
    i
   if strcmp(aa_key_eval{i,3},'S10')
             s=strcat(a,aa_key_eval{i,1},'\',aa_key_eval{i,2},'.wav');
             [d,c_fd,c_fA]=ffv_feature_2(s);
             data_ffv_s10_fd_eval{j_10,1}=c_fd;
             j_10=j_10+1;
             clear d c_fd c_fA
   end
end
save features_ffv_synth_s10_1_eval.mat -v7.3 data_ffv_s10_fd_eval;
clear all;clc; 

%% score computation
% % eer for ffv_s1 using FFV SD (static+dynamic) feature

clear;clc;
load feature_ffv_natural_1_eval.mat;
load features_ffv_synth_s1_1_eval.mat;
load EM_ffv_s1_fd.mat;
load EM_ffv_natural_fd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_fd;
EM_ffv{2}=EM_ffv_s1_fd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_fd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_fd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s1_fd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s1_fd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s1] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s1_alt_fd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s1_alt_fd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s1_alt_fd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s1');
fprintf(fileID,'%12.8f',eer_s1*100);
fclose(fileID);

%% score computation
% eer for ffv_s2
clear;clc;
load feature_ffv_natural_1_eval.mat;
load features_ffv_synth_s2_1_eval.mat;
load EM_ffv_s2_fd.mat;
load EM_ffv_natural_fd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_fd;
EM_ffv{2}=EM_ffv_s2_fd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_fd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_fd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s2_fd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s2_fd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s2] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s2_alt_fd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s2_alt_fd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s2_alt_fd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s2');
fprintf(fileID,'%12.8f',eer_s2*100);
fclose(fileID);

%% score computation
% eer for ffv_s3
clear;clc;
load feature_ffv_natural_1_eval.mat;
load features_ffv_synth_s3_1_eval.mat;
load EM_ffv_s3_fd.mat;
load EM_ffv_natural_fd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_fd;
EM_ffv{2}=EM_ffv_s3_fd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_fd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_fd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s3_fd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s3_fd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s3] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s3_alt_fd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s3_alt_fd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s3_alt_fd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s3');
fprintf(fileID,'%12.8f',eer_s3*100);
fclose(fileID);

%% score computation
% eer for ffv_s4
clear;clc;
load feature_ffv_natural_1_eval.mat;
load features_ffv_synth_s4_1_eval.mat;
load EM_ffv_s4_fd.mat;
load EM_ffv_natural_fd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_fd;
EM_ffv{2}=EM_ffv_s4_fd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_fd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_fd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s4_fd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s4_fd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s4] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s4_alt_fd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s4_alt_fd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s4_alt_fd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s4');
fprintf(fileID,'%12.8f',eer_s4*100);
fclose(fileID);

%% score computation
% eer for ffv_s5
clear;clc;
load feature_ffv_natural_1_eval.mat;
load features_ffv_synth_s5_1_eval.mat;
load EM_ffv_s5_fd.mat;
load EM_ffv_natural_fd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_fd;
EM_ffv{2}=EM_ffv_s5_fd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_fd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_fd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s5_fd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s5_fd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s5] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s5_alt_fd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s5_alt_fd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s5_alt_fd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s5');
fprintf(fileID,'%12.8f',eer_s5*100);
fclose(fileID);

%% score computation
% eer for ffv_s6
clear;clc;
load feature_ffv_natural_1_eval.mat;
load features_ffv_synth_s6_1_eval.mat;
load EM_ffv_synth_fd.mat;
load EM_ffv_natural_fd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_fd;
EM_ffv{2}=EM_ffv_synth_fd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_fd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_fd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s6_fd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s6_fd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s6] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s6_fd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s6_fd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s6_fd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s6');
fprintf(fileID,'%12.8f',eer_s6*100);
fclose(fileID);

%% score computation
% eer for ffv_s7
clear;clc;
load feature_ffv_natural_1_eval.mat;
load features_ffv_synth_s7_1_eval.mat;
load EM_ffv_synth_fd.mat;
load EM_ffv_natural_fd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_fd;
EM_ffv{2}=EM_ffv_synth_fd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_fd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_fd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s7_fd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s7_fd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s7] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s7_fd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s7_fd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s7_fd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s7');
fprintf(fileID,'%12.8f',eer_s7*100);
fclose(fileID);

%% score computation
% eer for ffv_s8
clear;clc;
load feature_ffv_natural_1_eval.mat;
load features_ffv_synth_s8_1_eval.mat;
load EM_ffv_synth_fd.mat;
load EM_ffv_natural_fd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_fd;
EM_ffv{2}=EM_ffv_synth_fd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_fd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_fd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s8_fd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s8_fd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s8] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s8_fd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s8_fd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s8_fd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s8');
fprintf(fileID,'%12.8f',eer_s8*100);
fclose(fileID);

%% score computation
% eer for ffv_s9
clear;clc;
load feature_ffv_natural_1_eval.mat;
load features_ffv_synth_s9_1_eval.mat;
load EM_ffv_synth_fd.mat;
load EM_ffv_natural_fd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_fd;
EM_ffv{2}=EM_ffv_synth_fd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_fd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_fd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s9_fd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s9_fd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s9] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s9_fd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s9_fd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s9_fd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s9');
fprintf(fileID,'%12.8f',eer_s9*100);
fclose(fileID);

%% score computation
% eer for ffv_s10
clear;clc;
load feature_ffv_natural_1_eval.mat;
load features_ffv_synth_s10_1_eval.mat;
load EM_ffv_synth_fd.mat;
load EM_ffv_natural_fd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_fd;
EM_ffv{2}=EM_ffv_synth_fd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_fd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_fd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s10_fd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s10_fd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s10] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s10_fd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s10_fd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s10_fd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s10');
fprintf(fileID,'%12.8f',eer_s10*100);
fclose(fileID);

