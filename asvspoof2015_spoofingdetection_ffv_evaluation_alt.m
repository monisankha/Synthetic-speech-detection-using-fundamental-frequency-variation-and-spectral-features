%% ffv training
% clear all;clc;
% Feature extraction of ASVspoof 2015 training data

load data_ffv_development_natural.mat;
load data_ffv_development_s1.mat;
load data_ffv_development_s2.mat;
load data_ffv_development_s3.mat;
load data_ffv_development_s4.mat;
load data_ffv_development_s5.mat;

data_ffv_synth=[data_ffv_s1;data_ffv_s2;data_ffv_s3;data_ffv_s4;data_ffv_s5];
data_ffv_synth_fdd=[data_ffv_s1_fdd;data_ffv_s2_fdd;data_ffv_s3_fdd;data_ffv_s4_fdd;data_ffv_s5_fdd];
data_ffv_synth_dd=[data_ffv_s1_dd;data_ffv_s2_dd;data_ffv_s3_dd;data_ffv_s4_dd;data_ffv_s5_dd];
data_ffv_synth_dbd=[data_ffv_s1_dbd;data_ffv_s2_dbd;data_ffv_s3_dbd;data_ffv_s4_dbd;data_ffv_s5_dbd];

%%
% %% ML algorithm/ EM training

nWorkers = 24;nmix =512;final_niter = 10;ds_factor = 1;

EM_ffv_synth= gmm_em(data_ffv_synth, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_synth.mat EM_ffv_synth

EM_ffv_synth_fdd= gmm_em(data_ffv_synth_fdd, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_synth_fdd.mat EM_ffv_synth_fdd

EM_ffv_synth_dd= gmm_em(data_ffv_synth_dd, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_synth_dd.mat EM_ffv_synth_dd

EM_ffv_synth_dbd= gmm_em(data_ffv_synth_dbd, nmix, final_niter, ds_factor, nWorkers);
save EM_ffv_synth_dbd.mat EM_ffv_synth_dbd

%% eval utterences
% Feature extraction of evaluation utterances of ASVspoof 2015

clear all;clc; 
load aa_key_eval.mat;
data_ffv_natural_eval=cell(9404,1);data_ffv_natural_fdd_eval=cell(9404,1);data_ffv_natural_dd_eval=cell(9404,1);data_ffv_natural_dbd_eval=cell(9404,1);
j=1;
a='D:\ASVspoof2015\wav\Evaluation\';
for i=1:size(aa_key_eval,1)
    i
   if strcmp(aa_key_eval{i,4},'human')
             s=strcat(a,aa_key_eval{i,1},'\',aa_key_eval{i,2},'.wav');
             [c,c_fdd,c_dd,c_dbd]=ffv_feature_1(s);
             data_ffv_natural_eval{j,1}=c;
             data_ffv_natural_fdd_eval{j,1}=c_fdd;
             data_ffv_natural_dd_eval{j,1}=c_dd;
             data_ffv_natural_dbd_eval{j,1}=c_dbd;
             j=j+1;
             clear c c_fdd c_dd c_dbd
   end
end
save feature_ffv_natural_eval.mat -v7.3 data_ffv_natural_eval data_ffv_natural_fdd_eval data_ffv_natural_dd_eval data_ffv_natural_dbd_eval;
clear all;clc; 
load aa_key_eval.mat;
data_ffv_s1_eval=cell(18400,1);data_ffv_s1_fdd_eval=cell(18400,1);data_ffv_s1_dd_eval=cell(18400,1);data_ffv_s1_dbd_eval=cell(18400,1);
j_1=1;
a='D:\ASVspoof2015\wav\Evaluation\';
for i=1:size(aa_key_eval,1)
    i
   if strcmp(aa_key_eval{i,3},'S1')
             s=strcat(a,aa_key_eval{i,1},'\',aa_key_eval{i,2},'.wav');
             [c,c_fdd,c_dd,c_dbd]=ffv_feature_1(s);
             data_ffv_s1_eval{j_1,1}=c;
             data_ffv_s1_fdd_eval{j_1,1}=c_fdd;
             data_ffv_s1_dd_eval{j_1,1}=c_dd;
             data_ffv_s1_dbd_eval{j_1,1}=c_dbd;
             j_1=j_1+1;
             clear c c_fdd c_dd c_dbd
   end
end
save features_ffv_synth_s1_eval.mat -v7.3 data_ffv_s1_eval data_ffv_s1_fdd_eval data_ffv_s1_dd_eval data_ffv_s1_dbd_eval;
clear all;clc; 
load aa_key_eval.mat;
data_ffv_s2_eval=cell(18400,1);data_ffv_s2_fdd_eval=cell(18400,1);data_ffv_s2_dd_eval=cell(18400,1);data_ffv_s2_dbd_eval=cell(18400,1);
j_2=1;
a='D:\ASVspoof2015\wav\Evaluation\';
for i=1:size(aa_key_eval,1)
    i
   if strcmp(aa_key_eval{i,3},'S2')
             s=strcat(a,aa_key_eval{i,1},'\',aa_key_eval{i,2},'.wav');
             [c,c_fdd,c_dd,c_dbd]=ffv_feature_1(s);
             data_ffv_s2_eval{j_2,1}=c;
             data_ffv_s2_fdd_eval{j_2,1}=c_fdd;
             data_ffv_s2_dd_eval{j_2,1}=c_dd;
             data_ffv_s2_dbd_eval{j_2,1}=c_dbd;
             j_2=j_2+1;
             clear c c_fdd c_dd c_dbd
   end
end
save features_ffv_synth_s2_eval.mat -v7.3 data_ffv_s2_eval data_ffv_s2_fdd_eval data_ffv_s2_dd_eval data_ffv_s2_dbd_eval;
clear all;clc; 
load aa_key_eval.mat;
data_ffv_s3_eval=cell(18400,1);data_ffv_s3_fdd_eval=cell(18400,1);data_ffv_s3_dd_eval=cell(18400,1);data_ffv_s3_dbd_eval=cell(18400,1);
j_3=1;
a='D:\ASVspoof2015\wav\Evaluation\';
for i=1:size(aa_key_eval,1)
    i
   if strcmp(aa_key_eval{i,3},'S3')
             s=strcat(a,aa_key_eval{i,1},'\',aa_key_eval{i,2},'.wav');
             [c,c_fdd,c_dd,c_dbd]=ffv_feature_1(s);
             data_ffv_s3_eval{j_3,1}=c;
             data_ffv_s3_fdd_eval{j_3,1}=c_fdd;
             data_ffv_s3_dd_eval{j_3,1}=c_dd;
             data_ffv_s3_dbd_eval{j_3,1}=c_dbd;
             j_3=j_3+1;
             clear c c_fdd c_dd c_dbd
   end
end
save features_ffv_synth_s3_eval.mat -v7.3 data_ffv_s3_eval data_ffv_s3_fdd_eval data_ffv_s3_dd_eval data_ffv_s3_dbd_eval; 
clear all;clc; 
load aa_key_eval.mat;
data_ffv_s4_eval=cell(18400,1);data_ffv_s4_fdd_eval=cell(18400,1);data_ffv_s4_dd_eval=cell(18400,1);data_ffv_s4_dbd_eval=cell(18400,1);
j_4=1;
a='D:\ASVspoof2015\wav\Evaluation\';
for i=1:size(aa_key_eval,1)
    i
   if strcmp(aa_key_eval{i,3},'S4')
             s=strcat(a,aa_key_eval{i,1},'\',aa_key_eval{i,2},'.wav');
             [c,c_fdd,c_dd,c_dbd]=ffv_feature_1(s);
             data_ffv_s4_eval{j_4,1}=c;
             data_ffv_s4_fdd_eval{j_4,1}=c_fdd;
             data_ffv_s4_dd_eval{j_4,1}=c_dd;
             data_ffv_s4_dbd_eval{j_4,1}=c_dbd;
             j_4=j_4+1;
             clear c c_fdd c_dd c_dbd
   end
end
save features_ffv_synth_s4_eval.mat -v7.3 data_ffv_s4_eval data_ffv_s4_fdd_eval data_ffv_s4_dd_eval data_ffv_s4_dbd_eval;
clear all;clc; 
load aa_key_eval.mat;
data_ffv_s5_eval=cell(18400,1);data_ffv_s5_fdd_eval=cell(18400,1);data_ffv_s5_dd_eval=cell(18400,1);data_ffv_s5_dbd_eval=cell(18400,1);
j_5=1;
a='D:\ASVspoof2015\wav\Evaluation\';
for i=1:size(aa_key_eval,1)
    i
   if strcmp(aa_key_eval{i,3},'S5')
             s=strcat(a,aa_key_eval{i,1},'\',aa_key_eval{i,2},'.wav');
             [c,c_fdd,c_dd,c_dbd]=ffv_feature_1(s);
             data_ffv_s5_eval{j_5,1}=c;
             data_ffv_s5_fdd_eval{j_5,1}=c_fdd;
             data_ffv_s5_dd_eval{j_5,1}=c_dd;
             data_ffv_s5_dbd_eval{j_5,1}=c_dbd;
             j_5=j_5+1;
             clear c c_fdd c_dd c_dbd
   end
end
save features_ffv_synth_s5_eval.mat -v7.3 data_ffv_s5_eval data_ffv_s5_fdd_eval data_ffv_s5_dd_eval data_ffv_s5_dbd_eval;
clear all;clc; 
load aa_key_eval.mat;
data_ffv_s6_eval=cell(18400,1);data_ffv_s6_fdd_eval=cell(18400,1);data_ffv_s6_dd_eval=cell(18400,1);data_ffv_s6_dbd_eval=cell(18400,1);
j_6=1;
a='D:\ASVspoof2015\wav\Evaluation\';
for i=1:size(aa_key_eval,1)
    i
    if strcmp(aa_key_eval{i,3},'S6')
             s=strcat(a,aa_key_eval{i,1},'\',aa_key_eval{i,2},'.wav');
             [c,c_fdd,c_dd,c_dbd]=ffv_feature_1(s);
             data_ffv_s6_eval{j_6,1}=c;
             data_ffv_s6_fdd_eval{j_6,1}=c_fdd;
             data_ffv_s6_dd_eval{j_6,1}=c_dd;
             data_ffv_s6_dbd_eval{j_6,1}=c_dbd;
             j_6=j_6+1;
             clear c c_fdd c_dd c_dbd
    end
end
save features_ffv_synth_s6_eval.mat -v7.3 data_ffv_s6_eval data_ffv_s6_fdd_eval data_ffv_s6_dd_eval data_ffv_s6_dbd_eval;
clear all;clc; 
load aa_key_eval.mat;
data_ffv_s7_eval=cell(18400,1);data_ffv_s7_fdd_eval=cell(18400,1);data_ffv_s7_dd_eval=cell(18400,1);data_ffv_s7_dbd_eval=cell(18400,1);
j_7=1;
a='D:\ASVspoof2015\wav\Evaluation\';
for i=1:size(aa_key_eval,1)
    i
    if strcmp(aa_key_eval{i,3},'S7')
             s=strcat(a,aa_key_eval{i,1},'\',aa_key_eval{i,2},'.wav');
             [c,c_fdd,c_dd,c_dbd]=ffv_feature_1(s);
             data_ffv_s7_eval{j_7,1}=c;
             data_ffv_s7_fdd_eval{j_7,1}=c_fdd;
             data_ffv_s7_dd_eval{j_7,1}=c_dd;
             data_ffv_s7_dbd_eval{j_7,1}=c_dbd;
             j_7=j_7+1;
             clear c c_fdd c_dd c_dbd 
    end
end
save features_ffv_synth_s7_eval.mat -v7.3 data_ffv_s7_eval data_ffv_s7_fdd_eval data_ffv_s7_dd_eval data_ffv_s7_dbd_eval;
clear all;clc; 
load aa_key_eval.mat;
data_ffv_s8_eval=cell(18400,1);data_ffv_s8_fdd_eval=cell(18400,1);data_ffv_s8_dd_eval=cell(18400,1);data_ffv_s8_dbd_eval=cell(18400,1);
j_8=1;
a='D:\ASVspoof2015\wav\Evaluation\';
for i=1:size(aa_key_eval,1)
    i
    if strcmp(aa_key_eval{i,3},'S8')
             s=strcat(a,aa_key_eval{i,1},'\',aa_key_eval{i,2},'.wav');
             [c,c_fdd,c_dd,c_dbd]=ffv_feature_1(s);
             data_ffv_s8_eval{j_8,1}=c;
             data_ffv_s8_fdd_eval{j_8,1}=c_fdd;
             data_ffv_s8_dd_eval{j_8,1}=c_dd;
             data_ffv_s8_dbd_eval{j_8,1}=c_dbd;
             j_8=j_8+1;
             clear c c_fdd c_dd c_dbd 
    end
end
save features_ffv_synth_s8_eval.mat -v7.3 data_ffv_s8_eval data_ffv_s8_fdd_eval data_ffv_s8_dd_eval data_ffv_s8_dbd_eval;
clear all;clc; 
load aa_key_eval.mat;
data_ffv_s9_eval=cell(18400,1);data_ffv_s9_fdd_eval=cell(18400,1);data_ffv_s9_dd_eval=cell(18400,1);data_ffv_s9_dbd_eval=cell(18400,1);
j_9=1;
a='D:\ASVspoof2015\wav\Evaluation\';
for i=1:size(aa_key_eval,1)
    i
    if strcmp(aa_key_eval{i,3},'S9')
             s=strcat(a,aa_key_eval{i,1},'\',aa_key_eval{i,2},'.wav');
             [c,c_fdd,c_dd,c_dbd]=ffv_feature_1(s);
             data_ffv_s9_eval{j_9,1}=c;
             data_ffv_s9_fdd_eval{j_9,1}=c_fdd;
             data_ffv_s9_dd_eval{j_9,1}=c_dd;
             data_ffv_s9_dbd_eval{j_9,1}=c_dbd;
             j_9=j_9+1;
             clear c c_fdd c_dd c_dbd 
    end
end
save features_ffv_synth_s9_eval.mat -v7.3 data_ffv_s9_eval data_ffv_s9_fdd_eval data_ffv_s9_dd_eval data_ffv_s9_dbd_eval;
clear all;clc; 
load aa_key_eval.mat;
data_ffv_s10_eval=cell(18400,1);data_ffv_s10_fdd_eval=cell(18400,1);data_ffv_s10_dd_eval=cell(18400,1);data_ffv_s10_dbd_eval=cell(18400,1);
j_10=1;
a='D:\ASVspoof2015\wav\Evaluation\';
for i=1:size(aa_key_eval,1)
    i
    if strcmp(aa_key_eval{i,3},'S10')
             s=strcat(a,aa_key_eval{i,1},'\',aa_key_eval{i,2},'.wav');
             [c,c_fdd,c_dd,c_dbd]=ffv_feature_1(s);
             data_ffv_s10_eval{j_10,1}=c;
             data_ffv_s10_fdd_eval{j_10,1}=c_fdd;
             data_ffv_s10_dd_eval{j_10,1}=c_dd;
             data_ffv_s10_dbd_eval{j_10,1}=c_dbd;
             j_10=j_10+1;
             clear c c_fdd c_dd c_dbd          
   end
end
save features_ffv_synth_s10_eval.mat -v7.3 data_ffv_s10_eval data_ffv_s10_fdd_eval data_ffv_s10_dd_eval data_ffv_s10_dbd_eval;
clear all;clc; 

%% score computation
% % eer for ffv_s1 using FFV S (static) feature

clear;clc;
load feature_ffv_natural_eval.mat;
load features_ffv_synth_s1_eval.mat;
load EM_ffv_s1.mat;
load EM_ffv_natural.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural;
EM_ffv{2}=EM_ffv_s1;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s1_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s1_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s1] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s1_alt_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s1_alt_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s1_alt_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s1');
fprintf(fileID,'%12.8f',eer_s1*100);
fclose(fileID);
%%
% % eer for ffv_s1 using FFV SD (static + dynamic) feature

load EM_ffv_s1_fdd.mat;
load EM_ffv_natural_fdd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_fdd;
EM_ffv{2}=EM_ffv_s1_fdd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_fdd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_fdd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s1_fdd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s1_fdd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s1] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s1_alt_fdd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s1_alt_fdd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s1_alt_fdd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s1');
fprintf(fileID,'%12.8f',eer_s1*100);
fclose(fileID);

%%
% eer for ffv_s1 using FFV DA (dynamic + acceleration) feature

load EM_ffv_s1_dd.mat;
load EM_ffv_natural_dd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_dd;
EM_ffv{2}=EM_ffv_s1_dd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_dd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_dd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s1_dd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s1_dd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s1] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s1_alt_dd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s1_alt_dd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s1_alt_dd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s1');
fprintf(fileID,'%12.8f',eer_s1*100);
fclose(fileID);

%%
% eer for ffv_s1 using FFV A (acceleration) feature

load EM_ffv_s1_dbd.mat;
load EM_ffv_natural_dbd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_dbd;
EM_ffv{2}=EM_ffv_s1_dbd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_dbd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_dbd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s1_dbd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s1_dbd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s1] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s1_alt_dbd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s1_alt_dbd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s1_alt_dbd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s1');
fprintf(fileID,'%12.8f',eer_s1*100);
fclose(fileID);

%% score computation
% eer for ffv_s2
clear;clc;
load feature_ffv_natural_eval.mat;
load features_ffv_synth_s2_eval.mat;
load EM_ffv_s2.mat;
load EM_ffv_natural.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural;
EM_ffv{2}=EM_ffv_s2;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s2_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s2_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s2] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s2_alt_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s2_alt_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s2_alt_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s2');
fprintf(fileID,'%12.8f',eer_s2*100);
fclose(fileID);
%%
load EM_ffv_s2_fdd.mat;
load EM_ffv_natural_fdd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_fdd;
EM_ffv{2}=EM_ffv_s2_fdd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_fdd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_fdd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s2_fdd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s2_fdd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s2] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s2_alt_fdd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s2_alt_fdd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s2_alt_fdd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s2');
fprintf(fileID,'%12.8f',eer_s2*100);
fclose(fileID);

%%
load EM_ffv_s2_dd.mat;
load EM_ffv_natural_dd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_dd;
EM_ffv{2}=EM_ffv_s2_dd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_dd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_dd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s2_dd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s2_dd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s2] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s2_alt_dd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s2_alt_dd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s2_alt_dd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s2');
fprintf(fileID,'%12.8f',eer_s2*100);
fclose(fileID);

%%
load EM_ffv_s2_dbd.mat;
load EM_ffv_natural_dbd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_dbd;
EM_ffv{2}=EM_ffv_s2_dbd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_dbd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_dbd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s2_dbd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s2_dbd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s2] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s2_alt_dbd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s2_alt_dbd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s2_alt_dbd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s2');
fprintf(fileID,'%12.8f',eer_s2*100);
fclose(fileID);

%% score computation
% eer for ffv_s3
clear;clc;
load feature_ffv_natural_eval.mat;
load features_ffv_synth_s3_eval.mat;
load EM_ffv_s3.mat;
load EM_ffv_natural.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural;
EM_ffv{2}=EM_ffv_s3;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s3_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s3_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s3] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s3_alt_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s3_alt_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s3_alt_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s3');
fprintf(fileID,'%12.8f',eer_s3*100);
fclose(fileID);
%%
load EM_ffv_s3_fdd.mat;
load EM_ffv_natural_fdd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_fdd;
EM_ffv{2}=EM_ffv_s3_fdd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_fdd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_fdd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s3_fdd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s3_fdd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s3] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s3_alt_fdd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s3_alt_fdd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s3_alt_fdd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s3');
fprintf(fileID,'%12.8f',eer_s3*100);
fclose(fileID);

%%
load EM_ffv_s3_dd.mat;
load EM_ffv_natural_dd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_dd;
EM_ffv{2}=EM_ffv_s3_dd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_dd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_dd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s3_dd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s3_dd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s3] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s3_alt_dd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s3_alt_dd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s3_alt_dd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s3');
fprintf(fileID,'%12.8f',eer_s3*100);
fclose(fileID);

%%
load EM_ffv_s3_dbd.mat;
load EM_ffv_natural_dbd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_dbd;
EM_ffv{2}=EM_ffv_s3_dbd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_dbd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_dbd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s3_dbd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s3_dbd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s3] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s3_alt_dbd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s3_alt_dbd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s3_alt_dbd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s3');
fprintf(fileID,'%12.8f',eer_s3*100);
fclose(fileID);

%% score computation
% eer for ffv_s4
clear;clc;
load feature_ffv_natural_eval.mat;
load features_ffv_synth_s4_eval.mat;
load EM_ffv_s4.mat;
load EM_ffv_natural.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural;
EM_ffv{2}=EM_ffv_s4;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s4_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s4_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s4] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s4_alt_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s4_alt_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s4_alt_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s4');
fprintf(fileID,'%12.8f',eer_s4*100);
fclose(fileID);
%%
load EM_ffv_s4_fdd.mat;
load EM_ffv_natural_fdd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_fdd;
EM_ffv{2}=EM_ffv_s4_fdd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_fdd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_fdd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s4_fdd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s4_fdd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s4] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s4_alt_fdd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s4_alt_fdd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s4_alt_fdd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s4');
fprintf(fileID,'%12.8f',eer_s4*100);
fclose(fileID);

%%
load EM_ffv_s4_dd.mat;
load EM_ffv_natural_dd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_dd;
EM_ffv{2}=EM_ffv_s4_dd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_dd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_dd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s4_dd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s4_dd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s4] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s4_alt_dd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s4_alt_dd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s4_alt_dd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s4');
fprintf(fileID,'%12.8f',eer_s4*100);
fclose(fileID);

%%
load EM_ffv_s4_dbd.mat;
load EM_ffv_natural_dbd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_dbd;
EM_ffv{2}=EM_ffv_s4_dbd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_dbd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_dbd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s4_dbd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s4_dbd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s4] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s4_alt_dbd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s4_alt_dbd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s4_alt_dbd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s4');
fprintf(fileID,'%12.8f',eer_s4*100);
fclose(fileID);

%% score computation
% eer for ffv_s5
clear;clc;
load feature_ffv_natural_eval.mat;
load features_ffv_synth_s5_eval.mat;
load EM_ffv_s5.mat;
load EM_ffv_natural.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural;
EM_ffv{2}=EM_ffv_s5;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s5_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s5_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s5] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s5_alt_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s5_alt_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s5_alt_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s5');
fprintf(fileID,'%12.8f',eer_s5*100);
fclose(fileID);
%%
load EM_ffv_s5_fdd.mat;
load EM_ffv_natural_fdd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_fdd;
EM_ffv{2}=EM_ffv_s5_fdd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_fdd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_fdd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s5_fdd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s5_fdd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s5] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s5_alt_fdd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s5_alt_fdd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s5_alt_fdd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s5');
fprintf(fileID,'%12.8f',eer_s5*100);
fclose(fileID);

%%
load EM_ffv_s5_dd.mat;
load EM_ffv_natural_dd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_dd;
EM_ffv{2}=EM_ffv_s5_dd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_dd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_dd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s5_dd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s5_dd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s5] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s5_alt_dd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s5_alt_dd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s5_alt_dd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s5');
fprintf(fileID,'%12.8f',eer_s5*100);
fclose(fileID);

%%
load EM_ffv_s5_dbd.mat;
load EM_ffv_natural_dbd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_dbd;
EM_ffv{2}=EM_ffv_s5_dbd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_dbd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_dbd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s5_dbd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s5_dbd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s5] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s5_alt_dbd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s5_alt_dbd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s5_alt_dbd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s5');
fprintf(fileID,'%12.8f',eer_s5*100);
fclose(fileID);

%% score computation
% eer for ffv_s6
clear;clc;
load feature_ffv_natural_eval.mat;
load features_ffv_synth_s6_eval.mat;
load EM_ffv_synth.mat;
load EM_ffv_natural.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural;
EM_ffv{2}=EM_ffv_synth;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s6_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s6_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s6] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s6_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s6_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s6_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s6');
fprintf(fileID,'%12.8f',eer_s6*100);
fclose(fileID);
%%
load EM_ffv_synth_fdd.mat;
load EM_ffv_natural_fdd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_fdd;
EM_ffv{2}=EM_ffv_synth_fdd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_fdd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_fdd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s6_fdd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s6_fdd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s6] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s6_fdd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s6_fdd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s6_fdd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s6');
fprintf(fileID,'%12.8f',eer_s6*100);
fclose(fileID);

%%
load EM_ffv_synth_dd.mat;
load EM_ffv_natural_dd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_dd;
EM_ffv{2}=EM_ffv_synth_dd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_dd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_dd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s6_dd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s6_dd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s6] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s6_dd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s6_dd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s6_dd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s6');
fprintf(fileID,'%12.8f',eer_s6*100);
fclose(fileID);

%%
load EM_ffv_synth_dbd.mat;
load EM_ffv_natural_dbd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_dbd;
EM_ffv{2}=EM_ffv_synth_dbd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_dbd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_dbd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s6_dbd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s6_dbd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s6] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s6_dbd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s6_dbd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s6_dbd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s6');
fprintf(fileID,'%12.8f',eer_s6*100);
fclose(fileID);

%% score computation
% eer for ffv_s7
clear;clc;
load feature_ffv_natural_eval.mat;
load features_ffv_synth_s7_eval.mat;
load EM_ffv_synth.mat;
load EM_ffv_natural.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural;
EM_ffv{2}=EM_ffv_synth;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s7_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s7_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s7] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s7_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s7_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s7_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s7');
fprintf(fileID,'%12.8f',eer_s7*100);
fclose(fileID);
%%
load EM_ffv_synth_fdd.mat;
load EM_ffv_natural_fdd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_fdd;
EM_ffv{2}=EM_ffv_synth_fdd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_fdd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_fdd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s7_fdd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s7_fdd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s7] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s7_fdd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s7_fdd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s7_fdd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s7');
fprintf(fileID,'%12.8f',eer_s7*100);
fclose(fileID);

%%
load EM_ffv_synth_dd.mat;
load EM_ffv_natural_dd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_dd;
EM_ffv{2}=EM_ffv_synth_dd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_dd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_dd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s7_dd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s7_dd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s7] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s7_dd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s7_dd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s7_dd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s7');
fprintf(fileID,'%12.8f',eer_s7*100);
fclose(fileID);

%%
load EM_ffv_synth_dbd.mat;
load EM_ffv_natural_dbd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_dbd;
EM_ffv{2}=EM_ffv_synth_dbd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_dbd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_dbd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s7_dbd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s7_dbd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s7] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s7_dbd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s7_dbd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s7_dbd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s7');
fprintf(fileID,'%12.8f',eer_s7*100);
fclose(fileID);

%% score computation
% eer for ffv_s8
clear;clc;
load feature_ffv_natural_eval.mat;
load features_ffv_synth_s8_eval.mat;
load EM_ffv_synth.mat;
load EM_ffv_natural.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural;
EM_ffv{2}=EM_ffv_synth;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s8_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s8_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s8] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s8_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s8_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s8_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s8');
fprintf(fileID,'%12.8f',eer_s8*100);
fclose(fileID);
%%
load EM_ffv_synth_fdd.mat;
load EM_ffv_natural_fdd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_fdd;
EM_ffv{2}=EM_ffv_synth_fdd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_fdd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_fdd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s8_fdd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s8_fdd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s8] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s8_fdd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s8_fdd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s8_fdd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s8');
fprintf(fileID,'%12.8f',eer_s8*100);
fclose(fileID);

%%
load EM_ffv_synth_dd.mat;
load EM_ffv_natural_dd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_dd;
EM_ffv{2}=EM_ffv_synth_dd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_dd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_dd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s8_dd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s8_dd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s8] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s8_dd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s8_dd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s8_dd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s8');
fprintf(fileID,'%12.8f',eer_s8*100);
fclose(fileID);

%%
load EM_ffv_synth_dbd.mat;
load EM_ffv_natural_dbd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_dbd;
EM_ffv{2}=EM_ffv_synth_dbd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_dbd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_dbd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s8_dbd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s8_dbd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s8] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s8_dbd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s8_dbd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s8_dbd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s8');
fprintf(fileID,'%12.8f',eer_s8*100);
fclose(fileID);

%% score computation
% eer for ffv_s9
clear;clc;
load feature_ffv_natural_eval.mat;
load features_ffv_synth_s9_eval.mat;
load EM_ffv_synth.mat;
load EM_ffv_natural.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural;
EM_ffv{2}=EM_ffv_synth;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s9_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s9_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s9] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s9_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s9_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s9_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s9');
fprintf(fileID,'%12.8f',eer_s9*100);
fclose(fileID);
%%
load EM_ffv_synth_fdd.mat;
load EM_ffv_natural_fdd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_fdd;
EM_ffv{2}=EM_ffv_synth_fdd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_fdd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_fdd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s9_fdd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s9_fdd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s9] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s9_fdd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s9_fdd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s9_fdd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s9');
fprintf(fileID,'%12.8f',eer_s9*100);
fclose(fileID);

%%
load EM_ffv_synth_dd.mat;
load EM_ffv_natural_dd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_dd;
EM_ffv{2}=EM_ffv_synth_dd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_dd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_dd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s9_dd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s9_dd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s9] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s9_dd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s9_dd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s9_dd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s9');
fprintf(fileID,'%12.8f',eer_s9*100);
fclose(fileID);

%%
load EM_ffv_synth_dbd.mat;
load EM_ffv_natural_dbd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_dbd;
EM_ffv{2}=EM_ffv_synth_dbd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_dbd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_dbd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s9_dbd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s9_dbd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s9] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s9_dbd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s9_dbd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s9_dbd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s9');
fprintf(fileID,'%12.8f',eer_s9*100);
fclose(fileID);

%% score computation
% eer for ffv_s10
clear;clc;
load feature_ffv_natural_eval.mat;
load features_ffv_synth_s10_eval.mat;
load EM_ffv_synth.mat;
load EM_ffv_natural.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural;
EM_ffv{2}=EM_ffv_synth;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s10_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s10_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s10] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s10_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s10_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s10_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s10');
fprintf(fileID,'%12.8f',eer_s10*100);
fclose(fileID);
%%
load EM_ffv_synth_fdd.mat;
load EM_ffv_natural_fdd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_fdd;
EM_ffv{2}=EM_ffv_synth_fdd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_fdd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_fdd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s10_fdd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s10_fdd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s10] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s10_fdd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s10_fdd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s10_fdd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s10');
fprintf(fileID,'%12.8f',eer_s10*100);
fclose(fileID);

%%
load EM_ffv_synth_dd.mat;
load EM_ffv_natural_dd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_dd;
EM_ffv{2}=EM_ffv_synth_dd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_dd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_dd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s10_dd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s10_dd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s10] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s10_dd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s10_dd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s10_dd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s10');
fprintf(fileID,'%12.8f',eer_s10*100);
fclose(fileID);

%%
load EM_ffv_synth_dbd.mat;
load EM_ffv_natural_dbd.mat;
load trials_nat_eval.mat;
load trials_eval.mat;

EM_ffv{1}=EM_ffv_natural_dbd;
EM_ffv{2}=EM_ffv_synth_dbd;
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_dbd_eval,trials_nat_eval);
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_dbd_eval, trials_nat_eval);

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_s10_dbd_eval, trials_eval);
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_s10_dbd_eval, trials_eval);

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer_s10] = rocchdet(Target,NonTarget);
fileID = fopen('ffv_s10_dbd_score_target_eval.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s10_dbd_score_nontarget_eval.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s10_dbd_eer_eval.txt','w');
fprintf(fileID,'%6s','eer_s10');
fprintf(fileID,'%12.8f',eer_s10*100);
fclose(fileID);