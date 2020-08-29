%--------------------------------------------------------------------------
clc; 
clear;
TargetList=importdata('ASV_male_enrolment.ndx');
load timit_ubm_512_mfcc_nvad_rasta_60_ivec.mat;
load TIMIT_RSR_TV_300_mfcc_nvad_rasta_60_GMM_512_ivec.mat;
mix=ubm_model_male;
ubm.mu=mix.centres';
ubm.sigma=mix.covars';
ubm.w=mix.priors;

for i=1:15
    temp=strsplit(TargetList{i},',');
    count=0;
    for j=2:size(temp,2)
        filepath=strcat('E:\Dipjyoti\ASVspoof2015\wav\Development\',temp{1},'\',temp{j},'.wav');
        count=count+1;
        data=mfcc_nvad_rasta(filepath,20);
        [N,F] = compute_bw_stats(data', ubm); 
        stats = [N; F];
        IV_Train(:,count)= extract_ivector(stats, ubm, T_male);
    end
    IV_Train=mean(IV_Train,2);
    save(strcat('E:\Dipjyoti\ASV_sahid\ivec_models\',temp{1},'.mat'),'IV_Train');
    clear IV_Train;
    disp(i);
end

for i=16:35
    temp=strsplit(TargetList{i},',');
    count=0;
    for j=2:size(temp,2)
        filepath=strcat('E:\Dipjyoti\ASVspoof2015\wav\Evaluation\',temp{1},'\',temp{j},'.wav');
        count=count+1;
        data=mfcc_nvad_rasta(filepath,20);
        [N,F] = compute_bw_stats(data', ubm); 
        stats = [N; F];
        IV_Train(:,count)= extract_ivector(stats, ubm, T_male);
    end
    IV_Train=mean(IV_Train,2);
    save(strcat('E:\Dipjyoti\ASV_sahid\ivec_models\',temp{1},'.mat'),'IV_Train');
    clear IV_Train;
    disp(i);
end
% %--------------------------------------------------------------------------
% %--------------------------------------------------------------------------
clc;
clear;
fid = fopen('ASV_male_development.ndx');
ListOfTrialFiles  = textscan(fid,'%s','delimiter',sprintf('\n'));
ListOfTrialFiles = ListOfTrialFiles{1};
fclose(fid);
load timit_ubm_512_mfcc_nvad_rasta_60_ivec.mat;
load TIMIT_RSR_TV_300_mfcc_nvad_rasta_60_GMM_512_ivec.mat;
mix=ubm_model_male;
ubm.mu=mix.centres';
ubm.sigma=mix.covars';
ubm.w=mix.priors;

Score=zeros(1,size(ListOfTrialFiles,1));
for i=1:size(ListOfTrialFiles,1)
    temp=strsplit(ListOfTrialFiles{i},' ');
    load(strcat('E:\Dipjyoti\ASV_sahid\ivec_models\',temp{1},'.mat'));
    filepath=strcat('E:\Dipjyoti\ASVspoof2015\wav\Development\',temp{1},'\',temp{2},'.wav');
    data=mfcc_nvad_rasta(filepath,20);
    [N,F] = compute_bw_stats(data', ubm);
    stats = [N; F];
    IV_Test= extract_ivector(stats, ubm, T_male);
    
    IV_Train=length_norm(IV_Train);
    IV_Test=length_norm(IV_Test);
    
    Score(i)= IV_Train'*IV_Test;
    disp(i);
end
save Score_ASVspoof_Joint_ASV_CM_Male_Dev_mfcc_nvad_rasta_60_GMMUBM_512_T_300.mat Score;
%--------------------------------------------------------------------------
%% eer computation (dev)
clc;
clear;
fid = fopen('ASV_male_development.ndx');
ListOfTrialFiles  = textscan(fid,'%s','delimiter',sprintf('\n'));
ListOfTrialFiles = ListOfTrialFiles{1};
fclose(fid);
for i=1:length(ListOfTrialFiles)
    ListOfTrialFiles1(i,:)=strsplit(ListOfTrialFiles{i},' ');
end
load Score_ASVspoof_Joint_ASV_CM_Male_Dev_mfcc_nvad_rasta_60_GMMUBM_512_T_300.mat
spk{1}='D18';spk{2}='D7';spk{3}='D4';spk{4}='D14';spk{5}='D16';...
spk{6}='D17';spk{7}='D6';spk{8}='D21';spk{9}='D24';spk{10}='D15';...
spk{11}='D28';spk{12}='D30';spk{13}='D31';spk{14}='D33';spk{15}='D34';
j1=1;j2=1;j3=1;j4=1;j5=1;j6=1;j7=1;index=zeros(1,length(ListOfTrialFiles));
for i=1:size(ListOfTrialFiles,1)
    for j=1:15
    if strcmp(ListOfTrialFiles1{i,1},spk{j}) && strcmp(ListOfTrialFiles1{i,3},'genuine') && strcmp(ListOfTrialFiles1{i,4},'human')==1
    target_score(j1)=Score(i);
    j1=j1+1;
    index(i)=1;
    elseif strcmp(ListOfTrialFiles1{i,1},spk{j}) && strcmp(ListOfTrialFiles1{i,3},'impostor') && strcmp(ListOfTrialFiles1{i,4},'human')==1
    nontarget_score_imp(j2)=Score(i);
    j2=j2+1;
    index(i)=2;
    elseif strcmp(ListOfTrialFiles1{i,1},spk{j}) && strcmp(ListOfTrialFiles1{i,4},'S1') ==1
    nontarget_score_s1(j3)=Score(i);
    j3=j3+1;
    index(i)=3;
    elseif strcmp(ListOfTrialFiles1{i,1},spk{j}) && strcmp(ListOfTrialFiles1{i,4},'S2')==1
    nontarget_score_s2(j4)=Score(i);
    j4=j4+1;
    index(i)=4;
    elseif strcmp(ListOfTrialFiles1{i,1},spk{j}) && strcmp(ListOfTrialFiles1{i,4},'S3') ==1
    nontarget_score_s3(j5)=Score(i);
    j5=j5+1;
    index(i)=5;
    elseif strcmp(ListOfTrialFiles1{i,1},spk{j}) && strcmp(ListOfTrialFiles1{i,4},'S4')==1
    nontarget_score_s4(j6)=Score(i);
    j6=j6+1;
    index(i)=6;
    elseif strcmp(ListOfTrialFiles1{i,1},spk{j}) && strcmp(ListOfTrialFiles1{i,4},'S5')==1
    nontarget_score_s5(j7)=Score(i);
    j7=j7+1;
    index(i)=7;
    end
    end
end

[x,y,eer_baseline] = rocchdet(target_score,nontarget_score_imp);
[x,y,eer_s1] = rocchdet(target_score,nontarget_score_s1);
[x,y,eer_s2] = rocchdet(target_score,nontarget_score_s2);
[x,y,eer_s3] = rocchdet(target_score,nontarget_score_s3);
[x,y,eer_s4] = rocchdet(target_score,nontarget_score_s4);
[x,y,eer_s5] = rocchdet(target_score,nontarget_score_s5);

fileID = fopen('development_spoofing_male_ivec.txt','w');
fprintf(fileID,'%6s %6s %6s %6s %6s %6s \r\n','eer_baseline','eer_s1','eer_s2','eer_s3','eer_s4','eer_s5');
fprintf(fileID,'%6.4f %6.4f %6.4f %6.4f %6.4f %6.4f\r\n',(eer_baseline*100),(eer_s1*100),(eer_s2*100),(eer_s3*100),(eer_s4*100),(eer_s5*100));
fclose(fileID);
%--------------------------------------------------------------------------
%% joint CM+ASV eer calculation development

j=1;j1=1;j2=1;j3=1;j4=1;j5=1;
EER_Threshold_s1=threshold_at_eer(target_score,nontarget_score_s1);
EER_Threshold_s2=threshold_at_eer(target_score,nontarget_score_s2);
EER_Threshold_s3=threshold_at_eer(target_score,nontarget_score_s3);
EER_Threshold_s4=threshold_at_eer(target_score,nontarget_score_s4);
EER_Threshold_s5=threshold_at_eer(target_score,nontarget_score_s5);
for i=1:length(index)
    if index(i)==1
        nat_list(j,1)=ListOfTrialFiles(i);
         j=j+1;
    end
if index(i)==3
    if Score(i)> EER_Threshold_s1
        synthetic_list_s1(j1,1)=ListOfTrialFiles(i);
        j1=j1+1;
    end
end
if index(i)==4
    if Score(i)> EER_Threshold_s2
        synthetic_list_s2(j2,1)=ListOfTrialFiles(i);
        j2=j2+1;
    end
end    
if index(i)==5
    if Score(i)> EER_Threshold_s3
        synthetic_list_s3(j3,1)=ListOfTrialFiles(i);
        j3=j3+1;
    end
end
if index(i)==6
    if Score(i)> EER_Threshold_s4
        synthetic_list_s4(j4,1)=ListOfTrialFiles(i);
        j4=j4+1;
    end
end
if index(i)==7
    if Score(i)> EER_Threshold_s5
        synthetic_list_s5(j5,1)=ListOfTrialFiles(i);
        j5=j5+1;
    end
end
end
eer_s1_cm = cm_for_jointASV_isfcc_obtc(nat_list,synthetic_list_s1,2);
eer_s2_cm = cm_for_jointASV_isfcc_obtc(nat_list,synthetic_list_s2,3);
eer_s3_cm = cm_for_jointASV_isfcc_obtc(nat_list,synthetic_list_s3,4);
eer_s4_cm = cm_for_jointASV_isfcc_obtc(nat_list,synthetic_list_s4,5);
eer_s5_cm = cm_for_jointASV_isfcc_obtc(nat_list,synthetic_list_s5,6);

fileID = fopen('development_spoofing_joint_cm_ASV_male_ivec.txt','w');
fprintf(fileID,'%6s %6s %6s %6s %6s \r\n','eer_s1_cm','eer_s2_cm','eer_s3_cm','eer_s4_cm','eer_s5_cm');
fprintf(fileID,'%6.4f %6.4f %6.4f %6.4f %6.4f \r\n',(eer_s1_cm*100),(eer_s2_cm*100),(eer_s3_cm*100),(eer_s4_cm*100),(eer_s5_cm*100));
fclose(fileID);


% %--------------------------------------------------------------------------
clc;
clear;
fid = fopen('ASV_male_evaluation.ndx');
ListOfTrialFiles  = textscan(fid,'%s','delimiter',sprintf('\n'));
ListOfTrialFiles = ListOfTrialFiles{1};
fclose(fid);
load timit_ubm_512_mfcc_nvad_rasta_60_ivec.mat;
load TIMIT_RSR_TV_300_mfcc_nvad_rasta_60_GMM_512_ivec.mat;
mix=ubm_model_male;
ubm.mu=mix.centres';
ubm.sigma=mix.covars';
ubm.w=mix.priors;

Score=zeros(1,size(ListOfTrialFiles,1));
for i=1:size(ListOfTrialFiles,1)
    temp=strsplit(ListOfTrialFiles{i},' ');
    load(strcat('E:\Dipjyoti\ASV_sahid\ivec_models\',temp{1},'.mat'));
    filepath=strcat('E:\Dipjyoti\ASVspoof2015\wav\Evaluation\',temp{1},'\',temp{2},'.wav');
    data=mfcc_nvad_rasta(filepath,20);
    [N,F] = compute_bw_stats(data', ubm);
    stats = [N; F];
    IV_Test= extract_ivector(stats, ubm, T_male);
    
    IV_Train=length_norm(IV_Train);
    IV_Test=length_norm(IV_Test);
    
    Score(i)= IV_Train'*IV_Test;
    disp(i);
end
save Score_ASVspoof_Joint_ASV_CM_Male_Eval_mfcc_nvad_rasta_60_GMMUBM_512_T_300.mat Score;

%% eer calculation (eval)
clc;
clear;
fid = fopen('ASV_male_evaluation.ndx');
ListOfTrialFiles  = textscan(fid,'%s','delimiter',sprintf('\n'));
ListOfTrialFiles = ListOfTrialFiles{1};
fclose(fid);
for i=1:length(ListOfTrialFiles)
    ListOfTrialFiles1(i,:)=strsplit(ListOfTrialFiles{i},' ');
end
load Score_ASVspoof_Joint_ASV_CM_Male_Eval_mfcc_nvad_rasta_60_GMMUBM_512_T_300.mat
spk{1}='E4';spk{2}='E9';spk{3}='E12';spk{4}='E36';spk{5}='E18';spk{6}='E21';spk{7}='E23';...
spk{8}='E24';spk{9}='E25';spk{10}='E26';spk{11}='E28';spk{12}='E29';spk{13}='E32';spk{14}='E34';...
spk{15}='E38';spk{16}='E44';spk{17}='E27';spk{18}='E35';spk{19}='E42';spk{20}='E37';

j1=1;j2=1;j3=1;j4=1;j5=1;j6=1;j7=1;j8=1;j9=1;j10=1;j11=1;j12=1;
index=zeros(1,length(ListOfTrialFiles));
for i=1:size(ListOfTrialFiles,1)
    for j=1:20
    if strcmp(ListOfTrialFiles1{i,1},spk{j}) && strcmp(ListOfTrialFiles1{i,3},'genuine') && strcmp(ListOfTrialFiles1{i,4},'human')==1
    target_score(j1)=Score(i);
    j1=j1+1;
    index(i)=1;
    elseif strcmp(ListOfTrialFiles1{i,1},spk{j}) && strcmp(ListOfTrialFiles1{i,3},'impostor') && strcmp(ListOfTrialFiles1{i,4},'human')==1
    nontarget_score_imp(j2)=Score(i);
    j2=j2+1;
    index(i)=2;
    elseif strcmp(ListOfTrialFiles1{i,1},spk{j}) && strcmp(ListOfTrialFiles1{i,4},'S1') ==1
    nontarget_score_s1(j3)=Score(i);
    j3=j3+1;
    index(i)=3;
    elseif strcmp(ListOfTrialFiles1{i,1},spk{j}) && strcmp(ListOfTrialFiles1{i,4},'S2')==1
    nontarget_score_s2(j4)=Score(i);
    j4=j4+1;
    index(i)=4;
    elseif strcmp(ListOfTrialFiles1{i,1},spk{j}) && strcmp(ListOfTrialFiles1{i,4},'S3') ==1
    nontarget_score_s3(j5)=Score(i);
    j5=j5+1;
    index(i)=5;
    elseif strcmp(ListOfTrialFiles1{i,1},spk{j}) && strcmp(ListOfTrialFiles1{i,4},'S4')==1
    nontarget_score_s4(j6)=Score(i);
    j6=j6+1;
    index(i)=6;
    elseif strcmp(ListOfTrialFiles1{i,1},spk{j}) && strcmp(ListOfTrialFiles1{i,4},'S5')==1
    nontarget_score_s5(j7)=Score(i);
    j7=j7+1;
    index(i)=7;
    elseif strcmp(ListOfTrialFiles1{i,1},spk{j}) && strcmp(ListOfTrialFiles1{i,4},'S6')==1
    nontarget_score_s6(j8)=Score(i);
    j8=j8+1;
    index(i)=8;
    elseif strcmp(ListOfTrialFiles1{i,1},spk{j}) && strcmp(ListOfTrialFiles1{i,4},'S7')==1
    nontarget_score_s7(j9)=Score(i);
    j9=j9+1;
    index(i)=9;
    elseif strcmp(ListOfTrialFiles1{i,1},spk{j}) && strcmp(ListOfTrialFiles1{i,4},'S8')==1
    nontarget_score_s8(j10)=Score(i);
    j10=j10+1;
    index(i)=10;
    elseif strcmp(ListOfTrialFiles1{i,1},spk{j}) && strcmp(ListOfTrialFiles1{i,4},'S9')==1
    nontarget_score_s9(j11)=Score(i);
    j11=j11+1;
    index(i)=11;
    elseif strcmp(ListOfTrialFiles1{i,1},spk{j}) && strcmp(ListOfTrialFiles1{i,4},'S10')==1
    nontarget_score_s10(j12)=Score(i);
    j12=j12+1;
    index(i)=12;
    end
    end
end

[x,y,eer_baseline] = rocchdet(target_score,nontarget_score_imp);
[x,y,eer_s1] = rocchdet(target_score,nontarget_score_s1);
[x,y,eer_s2] = rocchdet(target_score,nontarget_score_s2);
[x,y,eer_s3] = rocchdet(target_score,nontarget_score_s3);
[x,y,eer_s4] = rocchdet(target_score,nontarget_score_s4);
[x,y,eer_s5] = rocchdet(target_score,nontarget_score_s5);
[x,y,eer_s6] = rocchdet(target_score,nontarget_score_s6);
[x,y,eer_s7] = rocchdet(target_score,nontarget_score_s7);
[x,y,eer_s8] = rocchdet(target_score,nontarget_score_s8);
[x,y,eer_s9] = rocchdet(target_score,nontarget_score_s9);
[x,y,eer_s10] = rocchdet(target_score,nontarget_score_s10);


fileID = fopen('evaluation_spoofing_male_known_attacks_ivec.txt','w');
fprintf(fileID,'%6s %6s %6s %6s %6s %6s \r\n','eer_baseline','eer_s1','eer_s2','eer_s3','eer_s4','eer_s5');
fprintf(fileID,'%6.4f %6.4f %6.4f %6.4f %6.4f %6.4f\r\n',(eer_baseline*100),(eer_s1*100),(eer_s2*100),(eer_s3*100),(eer_s4*100),(eer_s5*100));
fclose(fileID);

fileID = fopen('evaluation_spoofing_male_unknown_attacks_ivec.txt','w');
fprintf(fileID,'%6s %6s %6s %6s %6s \r\n','eer_s6','eer_s7','eer_s8','eer_s9','eer_s10');
fprintf(fileID,'%6.4f %6.4f %6.4f %6.4f %6.4f\r\n',(eer_s6*100),(eer_s7*100),(eer_s8*100),(eer_s9*100),(eer_s10*100));
fclose(fileID);
%% joint CM+ASV eer calculation evaluation

j=1;j1=1;j2=1;j3=1;j4=1;j5=1;j6=1;j7=1;j8=1;j9=1;j10=1;
EER_Threshold_s1=threshold_at_eer(target_score,nontarget_score_s1);
EER_Threshold_s2=threshold_at_eer(target_score,nontarget_score_s2);
EER_Threshold_s3=threshold_at_eer(target_score,nontarget_score_s3);
EER_Threshold_s4=threshold_at_eer(target_score,nontarget_score_s4);
EER_Threshold_s5=threshold_at_eer(target_score,nontarget_score_s5);
EER_Threshold_s6=threshold_at_eer(target_score,nontarget_score_s6);
EER_Threshold_s7=threshold_at_eer(target_score,nontarget_score_s7);
EER_Threshold_s8=threshold_at_eer(target_score,nontarget_score_s8);
EER_Threshold_s9=threshold_at_eer(target_score,nontarget_score_s9);
EER_Threshold_s10=threshold_at_eer(target_score,nontarget_score_s10);

for i=1:length(index)
    if index(i)==1
        nat_list(j,1)=ListOfTrialFiles(i);
         j=j+1;
    end
if index(i)==3
    if Score(i)> EER_Threshold_s1
        synthetic_list_s1(j1,1)=ListOfTrialFiles(i);
        j1=j1+1;
    end
end
if index(i)==4
    if Score(i)> EER_Threshold_s2
        synthetic_list_s2(j2,1)=ListOfTrialFiles(i);
        j2=j2+1;
    end
end    
if index(i)==5
    if Score(i)> EER_Threshold_s3
        synthetic_list_s3(j3,1)=ListOfTrialFiles(i);
        j3=j3+1;
    end
end
if index(i)==6
    if Score(i)> EER_Threshold_s4
        synthetic_list_s4(j4,1)=ListOfTrialFiles(i);
        j4=j4+1;
    end
end
if index(i)==7
    if Score(i)> EER_Threshold_s5
        synthetic_list_s5(j5,1)=ListOfTrialFiles(i);
        j5=j5+1;
    end
end
if index(i)==8
    if Score(i)> EER_Threshold_s6
        synthetic_list_s6(j6,1)=ListOfTrialFiles(i);
        j6=j6+1;
    end
end
if index(i)==9
    if Score(i)> EER_Threshold_s7
        synthetic_list_s7(j7,1)=ListOfTrialFiles(i);
        j7=j7+1;
    end
end
if index(i)==10
    if Score(i)> EER_Threshold_s8
        synthetic_list_s8(j8,1)=ListOfTrialFiles(i);
        j8=j8+1;
    end
end
if index(i)==11
    if Score(i)> EER_Threshold_s9
        synthetic_list_s9(j9,1)=ListOfTrialFiles(i);
        j9=j9+1;
    end
end
if index(i)==12
    if Score(i)> EER_Threshold_s10
        synthetic_list_s10(j10,1)=ListOfTrialFiles(i);
        j10=j10+1;
    end
end
end

eer_s1_cm = cm_for_jointASV_isfcc_obtc_eval(nat_list,synthetic_list_s1,1,2);
eer_s2_cm = cm_for_jointASV_isfcc_obtc_eval(nat_list,synthetic_list_s2,1,3);
eer_s3_cm = cm_for_jointASV_isfcc_obtc_eval(nat_list,synthetic_list_s3,1,4);
eer_s4_cm = cm_for_jointASV_isfcc_obtc_eval(nat_list,synthetic_list_s4,1,5);
eer_s5_cm = cm_for_jointASV_isfcc_obtc_eval(nat_list,synthetic_list_s5,1,6);
eer_s6_cm = cm_for_jointASV_isfcc_obtc_eval(nat_list,synthetic_list_s6,1,7);
eer_s7_cm = cm_for_jointASV_isfcc_obtc_eval(nat_list,synthetic_list_s7,1,7);
eer_s8_cm = cm_for_jointASV_isfcc_obtc_eval(nat_list,synthetic_list_s8,1,7);
eer_s9_cm = cm_for_jointASV_isfcc_obtc_eval(nat_list,synthetic_list_s9,1,7);
eer_s10_cm = cm_for_jointASV_isfcc_obtc_eval(nat_list,synthetic_list_s10,8,9);

fileID = fopen('evaluation_spoofing_joint_cm_ASV_male_known_attacks_ivec.txt','w');
fprintf(fileID,'%6s %6s %6s %6s %6s \r\n','eer_s1_cm','eer_s2_cm','eer_s3_cm','eer_s4_cm','eer_s5_cm');
fprintf(fileID,'%6.4f %6.4f %6.4f %6.4f %6.4f\r\n',(eer_s1_cm*100),(eer_s2_cm*100),(eer_s3_cm*100),(eer_s4_cm*100),(eer_s5_cm*100));
fclose(fileID);

fileID = fopen('evaluation_spoofing_joint_cm_ASV_male_unknown_attacks_ivec.txt','w');
fprintf(fileID,'%6s %6s %6s %6s %6s \r\n','eer_s6_cm','eer_s7_cm','eer_s8_cm','eer_s9_cm','eer_s10_cm');
fprintf(fileID,'%6.4f %6.4f %6.4f %6.4f %6.4f\r\n',(eer_s6_cm*100),(eer_s7_cm*100),(eer_s8_cm*100),(eer_s9_cm*100),(eer_s10_cm*100));
fclose(fileID);
