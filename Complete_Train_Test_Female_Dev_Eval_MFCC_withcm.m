% %% Timit ubm generation
% clc;
% clear;
% timit=importdata('female_list.txt');
% parfor i=1:length(timit)
%     dataforubm{i,1}=mfcc_nvad_rasta(timit{i},20);
% end
% 
% Data_ubm=cell2mat(dataforubm);
% 
% ncentres=512;input_dim=60;
% mix=gmm(input_dim,ncentres,'diag');
% options=foptions;
% mix=gmminit_vq(mix,Data_ubm,ncentres,options);
% options(1)=1;
% options(14)=10;
% ubm=gmmem(mix,Data_ubm,options);
% save timit_ubm_512_mfcc_nvad_rasta_60_female.mat ubm
% %%--------------------------------------------------------------------------
% clc;
% clear;
% TargetList=importdata('ASV_female_enrolment.ndx');
% load timit_ubm_512_mfcc_nvad_rasta_60_female.mat;
% for i=1:20
%     temp=strsplit(TargetList{i},',');
%     count=0;
%     for j=2:size(temp,2)
%         filepath=strcat('E:\Dipjyoti\ASVspoof2015\wav\Development\',temp{1},'\',temp{j},'.wav');
%         count=count+1;
%         train_data{1,count}=mfcc_nvad_rasta(filepath,20);
%     end
%     data=cell2mat(train_data');
%     spk_model=gmmmap(ubm,data,3);
%     save(strcat('E:\Dipjyoti\ASV_sahid\',temp{1},'.mat'),'spk_model');
%     clear train_data;
%     disp(i);
% end
% 
% for i=21:46
%     temp=strsplit(TargetList{i},',');
%     count=0;
%     for j=2:size(temp,2)
%         filepath=strcat('E:\Dipjyoti\ASVspoof2015\wav\Evaluation\',temp{1},'\',temp{j},'.wav');
%         count=count+1;
%         train_data{1,count}=mfcc_nvad_rasta(filepath,20);
%     end
%     data=cell2mat(train_data');
%     spk_model=gmmmap(ubm,data,3);
%     save(strcat('E:\Dipjyoti\ASV_sahid\',temp{1},'.mat'),'spk_model');
%     clear train_data;
%     disp(i);
% end
% %--------------------------------------------------------------------------
% % %--------------------------------------------------------------------------
% clc;
% clear;
% fid = fopen('ASV_female_development.ndx');
% ListOfTrialFiles  = textscan(fid,'%s','delimiter',sprintf('\n'));
% ListOfTrialFiles = ListOfTrialFiles{1};
% fclose(fid);
% load timit_ubm_512_mfcc_nvad_rasta_60_female.mat;
% ubm_model=netlab2msr(ubm);
% Score=zeros(1,size(ListOfTrialFiles,1));
% for i=1:size(ListOfTrialFiles,1)
%     temp=strsplit(ListOfTrialFiles{i},' ');
%     load(strcat('E:\Dipjyoti\ASV_sahid\',temp{1},'.mat'));
%     filepath=strcat('E:\Dipjyoti\ASVspoof2015\wav\Development\',temp{1},'\',temp{2},'.wav');
%     tgt_model=netlab2msr(spk_model);
%     test_data=mfcc_nvad_rasta(filepath,20);
%     Score(i)= mean(compute_llk(test_data',tgt_model))-mean(compute_llk(test_data',ubm_model));
%     i
% end
% save ASVspoof_Joint_ASV_CM_Female_Dev_GMMUBM_512_SCORE_mfcc_nvad_rasta_60_R_3.mat Score;

 %% eer computation (dev)
clc;
clear;
fid = fopen('ASV_female_development.ndx');
ListOfTrialFiles  = textscan(fid,'%s','delimiter',sprintf('\n'));
ListOfTrialFiles = ListOfTrialFiles{1};
fclose(fid);
for i=1:length(ListOfTrialFiles)
    ListOfTrialFiles1(i,:)=strsplit(ListOfTrialFiles{i},' ');
end
load ASVspoof_Joint_ASV_CM_Female_Dev_GMMUBM_512_SCORE_mfcc_nvad_rasta_60_R_3.mat
spk{1}='D19';spk{2}='D10';spk{3}='D11';spk{4}='D12';spk{5}='D13';...
spk{6}='D5';spk{7}='D9';spk{8}='D20';spk{9}='D22';spk{10}='D23';...
spk{11}='D25';spk{12}='D1';spk{13}='D26';spk{14}='D27';spk{15}='D29';...
spk{16}='D35';spk{17}='D8';spk{18}='D2';spk{19}='D32';spk{20}='D3';

j1=1;j2=1;j3=1;j4=1;j5=1;j6=1;j7=1;index=zeros(1,length(ListOfTrialFiles));
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
    end
    end
end

[x,y,eer_baseline] = rocchdet(target_score,nontarget_score_imp);
[x,y,eer_s1] = rocchdet(target_score,nontarget_score_s1);
[x,y,eer_s2] = rocchdet(target_score,nontarget_score_s2);
[x,y,eer_s3] = rocchdet(target_score,nontarget_score_s3);
[x,y,eer_s4] = rocchdet(target_score,nontarget_score_s4);
[x,y,eer_s5] = rocchdet(target_score,nontarget_score_s5);

fileID = fopen('development_spoofing_female.txt','w');
fprintf(fileID,'%6s %6s %6s %6s %6s %6s \r\n','eer_baseline','eer_s1','eer_s2','eer_s3','eer_s4','eer_s5');
fprintf(fileID,'%6.4f %6.4f %6.4f %6.4f %6.4f %6.4f\r\n',(eer_baseline*100),(eer_s1*100),(eer_s2*100),(eer_s3*100),(eer_s4*100),(eer_s5*100));
fclose(fileID);
%--------------------------------------------------------------------------
% joint CM+ASV eer calculation for female development data

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
[eer_s1 Target NonTarget] = cm_for_jointASV_ffv_dev_female(nat_list,synthetic_list_s1,2);
fileID = fopen('ffv_s1_score_target_cm_dev.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s1_score_nontarget_cm_dev.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s1_eer_cm_dev.txt','w');
fprintf(fileID,'%6s','eer_s1');
fprintf(fileID,'%12.8f',eer_s1*100);
fclose(fileID);
[eer_s2 Target NonTarget] = cm_for_jointASV_ffv_dev_female(nat_list,synthetic_list_s2,3);
fileID = fopen('ffv_s2_score_target_cm_dev.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s2_score_nontarget_cm_dev.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s2_eer_cm_dev.txt','w');
fprintf(fileID,'%6s','eer_s2');
fprintf(fileID,'%12.8f',eer_s2*100);
fclose(fileID);
[eer_s3 Target NonTarget] = cm_for_jointASV_ffv_dev_female(nat_list,synthetic_list_s3,4);
fileID = fopen('ffv_s3_score_target_cm_dev.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s3_score_nontarget_cm_dev.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s3_eer_cm_dev.txt','w');
fprintf(fileID,'%6s','eer_s3');
fprintf(fileID,'%12.8f',eer_s3*100);
fclose(fileID);
[eer_s4 Target NonTarget] = cm_for_jointASV_ffv_dev_female(nat_list,synthetic_list_s4,5);
fileID = fopen('ffv_s4_score_target_cm_dev.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s4_score_nontarget_cm_dev.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s4_eer_cm_dev.txt','w');
fprintf(fileID,'%6s','eer_s4');
fprintf(fileID,'%12.8f',eer_s4*100);
fclose(fileID);
[eer_s5 Target NonTarget] = cm_for_jointASV_ffv_dev_female(nat_list,synthetic_list_s5,6);
fileID = fopen('ffv_s5_score_target_cm_dev.txt','w');
fprintf(fileID,'%6s\r\n','Target');
fprintf(fileID,'%6.2f\r\n',Target);
fclose(fileID);
fileID = fopen('ffv_s5_score_nontarget_cm_dev.txt','w');
fprintf(fileID,'%6s\r\n','NonTarget');
fprintf(fileID,'%6.2f\r\n',NonTarget);
fclose(fileID);
fileID = fopen('ffv_s5_eer_cm_dev.txt','w');
fprintf(fileID,'%6s','eer_s5');
fprintf(fileID,'%12.8f',eer_s5*100);
fclose(fileID);

%--------------------------------------------------------------------------
% %--------------------------------------------------------------------------
% evaluation score
clc;
clear;
fid = fopen('ASV_female_evaluation.ndx');
ListOfTrialFiles  = textscan(fid,'%s','delimiter',sprintf('\n'));
ListOfTrialFiles = ListOfTrialFiles{1};
fclose(fid);
load timit_ubm_512_mfcc_nvad_rasta_60_female.mat;
ubm_model=netlab2msr(ubm);
Score=zeros(1,size(ListOfTrialFiles,1));
for i=1:size(ListOfTrialFiles,1)
    temp=strsplit(ListOfTrialFiles{i},' ');
    load(strcat('E:\Dipjyoti\ASV_sahid\',temp{1},'.mat'));
    filepath=strcat('E:\Dipjyoti\ASVspoof2015\wav\Evaluation\',temp{1},'\',temp{2},'.wav');
    tgt_model=netlab2msr(spk_model);
        test_data=mfcc_nvad_rasta(filepath,20);
        Score(i)= mean(compute_llk(test_data',tgt_model))-mean(compute_llk(test_data',ubm_model)); 
    disp(i);
end
save ASVspoof_Joint_ASV_CM_Female_Eval_GMMUBM_512_SCORE_mfcc_nvad_rasta_60_R_3.mat Score;
%--------------------------------------------------------------------------
clc;
clear;
fid = fopen('ASV_female_evaluation.ndx');
ListOfTrialFiles  = textscan(fid,'%s','delimiter',sprintf('\n'));
ListOfTrialFiles = ListOfTrialFiles{1};
fclose(fid);
for i=1:length(ListOfTrialFiles)
    ListOfTrialFiles1(i,:)=strsplit(ListOfTrialFiles{i},' ');
end
load ASVspoof_Joint_ASV_CM_Female_Eval_GMMUBM_512_SCORE_mfcc_nvad_rasta_60_R_3.mat

spk{1}='E1';spk{2}='E2';spk{3}='E3';spk{4}='E5';spk{5}='E6';spk{6}='E7';spk{7}='E8';...
spk{8}='E11';spk{9}='E13';spk{10}='E14';spk{11}='E15';spk{12}='E16';spk{13}='E17';spk{14}='E20';...
spk{15}='E22';spk{16}='E30';spk{17}='E31';spk{18}='E33';spk{19}='E10';spk{20}='E39';...
spk{21}='E40';spk{22}='E41';spk{23}='E19';spk{24}='E43';spk{25}='E45';spk{26}='E46';

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

fileID = fopen('evaluation_spoofing_female_known_attacks.txt','w');
fprintf(fileID,'%6s %6s %6s %6s %6s %6s \r\n','eer_baseline','eer_s1','eer_s2','eer_s3','eer_s4','eer_s5');
fprintf(fileID,'%6.4f %6.4f %6.4f %6.4f %6.4f %6.4f\r\n',(eer_baseline*100),(eer_s1*100),(eer_s2*100),(eer_s3*100),(eer_s4*100),(eer_s5*100));
fclose(fileID);

fileID = fopen('evaluation_spoofing_female_unknown_attacks.txt','w');
fprintf(fileID,'%6s %6s %6s %6s %6s \r\n','eer_s6','eer_s7','eer_s8','eer_s9','eer_s10');
fprintf(fileID,'%6.4f %6.4f %6.4f %6.4f %6.4f\r\n',(eer_s6*100),(eer_s7*100),(eer_s8*100),(eer_s9*100),(eer_s10*100));
fclose(fileID);
%% joint CM+ASV eer calculation development

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
        synthetic_list_s7(j8,1)=ListOfTrialFiles(i);
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

fileID = fopen('evaluation_spoofing_joint_cm_ASV_female_known_attacks.txt','w');
fprintf(fileID,'%6s %6s %6s %6s %6s \r\n','eer_s1_cm','eer_s2_cm','eer_s3_cm','eer_s4_cm','eer_s5_cm');
fprintf(fileID,'%6.4f %6.4f %6.4f %6.4f %6.4f\r\n',(eer_s1_cm*100),(eer_s2_cm*100),(eer_s3_cm*100),(eer_s4_cm*100),(eer_s5_cm*100));
fclose(fileID);

fileID = fopen('evaluation_spoofing_joint_cm_ASV_female_unknown_attacks.txt','w');
fprintf(fileID,'%6s %6s %6s %6s %6s \r\n','eer_s6_cm','eer_s7_cm','eer_s8_cm','eer_s9_cm','eer_s10_cm');
fprintf(fileID,'%6.4f %6.4f %6.4f %6.4f %6.4f\r\n',(eer_s6_cm*100),(eer_s7_cm*100),(eer_s8_cm*100),(eer_s9_cm*100),(eer_s10_cm*100));
fclose(fileID);