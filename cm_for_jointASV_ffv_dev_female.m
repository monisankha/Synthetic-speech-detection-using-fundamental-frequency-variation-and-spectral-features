function [eer Target NonTarget]=cm_for_jointASV_ffv_dev_female(nat_list,synthetic_list,p)

load sfcc_antispoofing_filterbank_known.mat
load EM_ffv_natural.mat;
load EM_ffv_s1.mat;
load EM_ffv_s2.mat
load EM_ffv_s3.mat
load EM_ffv_s4.mat
load EM_ffv_s5.mat
load EM_ffv_synth.mat

models{1}=EM_ffv_natural.mat;
models{2}=EM_ffv_s1.mat;
models{3}=EM_ffv_s2.mat;
models{4}=EM_ffv_s3.mat;
models{5}=EM_ffv_s4.mat;
models{6}=EM_ffv_s5.mat;
models{7}=EM_ffv_synth.mat;

j=1;j1=1;
path='E:\Dipjyoti\ASVspoof2015\wav\Development\';

for i=1:size(nat_list,1)
             temp=strsplit(nat_list{i},' ');
             s=strcat('E:\Dipjyoti\ASVspoof2015\wav\Development\',temp{1},'\',temp{2},'.wav');
             [c]=ffv_feature_1(s);
             data_ffv_natural_test{j,1}=c;j=j+1;
             clear c 
end
for i=1:size(synthetic_list,1)
             temp=strsplit(synthetic_list{i},' ');
             s=strcat('E:\Dipjyoti\ASVspoof2015\wav\Development\',temp{1},'\',temp{2},'.wav');
             [c]=ffv_feature_1(s);
             data_ffv_syn_test{j1,1}=c;j1=j1+1;
             clear c 
   
end

%% score computation

load trials_nat.mat
load trials.mat
EM_ffv{1}=models{1,1};
EM_ffv{2}=models{1,p};
Targetgmmscore=score_gmm_trials(EM_ffv(1),data_ffv_natural_test,trials_nat(1:(j-1),:));
Targetgmmscore_1=score_gmm_trials(EM_ffv(2),data_ffv_natural_test, trials_nat(1:(j-1),:));

NonTargetgmmscores = score_gmm_trials(EM_ffv(1),data_ffv_syn_test, trials(1:(j1-1),:));
NonTargetgmmscores_1 = score_gmm_trials(EM_ffv(2),data_ffv_syn_test, trials(1:(j1-1),:));

Target=Targetgmmscore-Targetgmmscore_1;
NonTarget=NonTargetgmmscores-NonTargetgmmscores_1;
[x,y,eer] = rocchdet(Target,NonTarget);


