# Synthetic-speech-detection-using-fundamental-frequency-variation-and-spectral-features
Recent works on the vulnerability of automatic speaker verification (ASV) systems confirm that malicious spoofing attacksusing synthetic speech can provoke 
significant increase in false acceptance rate. A reliable detection of synthetic speech is key to develop countermeasure for synthetic speech based spoofing 
attacks.

% Database used: ASVspoof 2015

% Paper published: Pal, Monisankha, Dipjyoti Paul, and Goutam Saha. "Synthetic speech detection using fundamental frequency variation and spectral features." 
Computer Speech & Language 48 (2018): 31-50.

Stand-alone spoofing detection or CM:
-------------------------------------

1. asvspoof2015_spoofingdetection_apgdcc_development.m---> ASVspoof 2015 development data spoof detection using APGDF feature

2. asvspoof2015_spoofingdetection_apgdcc_evaluation_alt.m---> ASVspoof 2015 evaluation data spoof detection using APGDF feature

3. asvspoof2015_spoofingdetection_cqcc_development---> ASVspoof 2015 development data spoof detection using CQCC feature

4. asvspoof2015_spoofingdetection_cqcc_evaluation_alt.m---> ASVspoof 2015 evaluation data spoof detection using CQCC feature

5. asvspoof2015_spoofingdetection_ffv_development.m---> ASVspoof 2015 development data spoof detection using FFV feature

6. asvspoof2015_spoofingdetection_ffv_evaluation_alt.m---> ASVspoof 2015 evaluation data spoof detection using FFV feature (S,DA,A,SDA)

7. asvspoof2015_spoofingdetection_ffv_evaluation_alt_fd.m---> ASVspoof 2015 evaluation data spoof detection using FFV feature (SD)

8. fusion_asvspoof2015_evaluation_cqccdbd_apgdfdbd_ffvfd.m---> Score level fusion of CQCC(A), APGDF(A) and FFV(SD) feature or proposed method for anti-spoofing

CM+ASV spoofing detection:
---------------------------

9. Complete_Train_Test_Female_Dev_Eval_MFCC_withcm.M---> Countermeasure+ASV for development and evaluation data using GMM-UBM ASV. It is for female data.

10. CS1_Complete_Train_Test_Female_Dev_Eval_RMFCC_60_IV.m---> Countermeasure+ASV for development and evaluation data using i-vector based ASV. 
It is for female data.

*** For any query pls contact at monisankha.pal@gmail.com

