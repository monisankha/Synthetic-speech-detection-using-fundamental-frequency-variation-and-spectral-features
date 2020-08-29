%--------------------------------------------------------------------------
% Converted and original speech detection using fundamental frequency
% variation spectrum as a high level feature
%--------------------------------------------------------------------------
function [t1,t1_fd,t1_fD]=ffv_feature_2(wavefiles)
y1=readwav(wavefiles,'s',-1);
%-----------------------------------------------------------------
% Pre emphasis
%-----------------------------------------------------------------
% figure;specgram(y1,512,16000)
l=length(y1);
y(1)=y1(1);
y(2:l)=y1(2:l)-0.97*y1(1:l-1);
%---------------------------------------------------------------------
% Framing and spectrum
%---------------------------------------------------------------------
framedspeech=buffer(y,512,384,'nodelay');
% [y_framed, I]=winframe_varshift(y,16000,20,50);
framedspeech=framedspeech(:,1:end-1)';
% framedspeech=framedspeech';

%Energy based VAD---------------------
% E=20*log10(std(framedspeech')+eps);
% maxl=max(E);
% I=(E>maxl-30) & (E>-55);
% framedspeech=framedspeech(I,:);
%------------------------------------

w=hann(320);
% s=size(framedspeech);
% for i=1:s(1,1)
%     x1=framedspeech(i,1:320).*w';
%     x2=framedspeech(i,193:512).*w';
%     f1(i,:)=fft(x1,512);
%     f2(i,:)=fft(x2,512);
% end

x1=bsxfun(@times,framedspeech(:,1:320),w');
x2=bsxfun(@times,framedspeech(:,193:512),w');
f1=fft(x1',512);
f2=fft(x2',512);
f1=f1';
f2=f2';

% calculation of rho------------------------------------------------
r=-256:255;
N=512;
t1=0.008;t2=0.012;
rho=(4.*t2.*r)./(N.*t1);
k=-255:256;
%--------------------------------------------------------------------------
% FFV spectrum estimation
%--------------------------------------------------------------------------
s=size(f1,1);

parfor i=1:s
    
    ffv(i,:)=ffv_spec4(f1(i,:),f2(i,:),rho,k);
    
end

ffv1=ffv;

%-------------------------------------------------------------
% Filter bank output (Trapeziodal)
%-------------------------------------------------------------
% plot(rho,ffv(1,:));
f=8000*linspace(0,1,N);
% octave=log2(8000)-6.5;
% octave1=linspace(-octave,octave,27);
% f_oct=2.^(octave1+6.5);
% f_octave=log2(f)-6.5;
p=7;
x1=[117 139];
x2=[244 246 250 252];
x3=[248 250 254 256];
x4=[253 255 257 259];
x5=[256 258 262 264];
x6=[260 262 266 268];
x7=[373 395];
for i=1:p
    if i==1
        filterbank(:,i)=0.0435.*rect_mf(f,[f(x1(1)),f(x1(2))]); 
    elseif i==2
        filterbank(:,i)=0.167.*trapmf(f,[f(x2(1)),f(x2(2)),f(x2(3)),f(x2(4))]); 
    elseif i==3
        filterbank(:,i)=0.167.*trapmf(f,[f(x3(1)),f(x3(2)),f(x3(3)),f(x3(4))]); 
    elseif i==4
         filterbank(:,i)=0.25.*trapmf(f,[f(x4(1)),f(x4(2)),f(x4(3)),f(x4(4))]); 
    elseif i==5
         filterbank(:,i)=0.167.*trapmf(f,[f(x5(1)),f(x5(2)),f(x5(3)),f(x5(4))]); 
    elseif i==6
         filterbank(:,i)=0.167.*trapmf(f,[f(x6(1)),f(x6(2)),f(x6(3)),f(x6(4))]);
    elseif i==7
        filterbank(:,i)=0.0435.*rect_mf(f,[f(x7(1)),f(x7(2))]); 
    end
end
a1=nonzeros(filterbank(:,1));b1=ffv(:,1:23);
a2=nonzeros(filterbank(:,2));b2=ffv(:,24:30);
a3=nonzeros(filterbank(:,3));b3=ffv(:,28:34);
a4=nonzeros(filterbank(:,4));b4=ffv(:,33:37);
a5=nonzeros(filterbank(:,5));b5=ffv(:,36:42);
a6=nonzeros(filterbank(:,6));b6=ffv(:,40:46);
a7=nonzeros(filterbank(:,7));b7=ffv(:,47:69);
filerbank_output=zeros(s(1,1),7);
filerbank_output(:,1)=b1*a1;
filerbank_output(:,2)=b2*a2;
filerbank_output(:,3)=b3*a3;
filerbank_output(:,4)=b4*a4;
filerbank_output(:,5)=b5*a5;
filerbank_output(:,6)=b6*a6;
filerbank_output(:,7)=b7*a7;
%filerbank_output=log10(filerbank_output+eps);
D=dctmtx(7)';
t=filerbank_output*D(:,1:end);
d=deltas(t',3)';
d1=deltas(d',3)';
t_fd=[t d];
t_fD=[t d1];
t1=d';
t1_fd=t_fd';
t1_fD=t_fD';