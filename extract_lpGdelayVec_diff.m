
% Extracts LP group delay using forward difference
% Vector based processing
% tau = extract_lpGdelay_diff(speechFrames,lpOrder,nfft)
% where all the frames are passed at once
%

function [tau,apgd_mdd,apgd_dd,apgd_dbd] = extract_lpGdelayVec_diff(a, lpOrder,num_coeff)

y1=readwav(a,'s',-1);
%-------------------------- PRE-EMPHASIS ----------------------------------
l=length(y1);
y(1)=y1(1);
y(2:l)=y1(2:l)-0.97*y1(1:l-1);
%---------------------------FRAMING & WINDOWING----------------------------
y_framed=winframe_varshift(y);

NFFT = 512;
speechFrames=y_framed;
% add a small dither
speechFrames = speechFrames + 1e-8;

% Do LP analysis and compute all-pole phase spectra

[a,g] = lpc(speechFrames',lpOrder);
A = fft(a',NFFT);
A = 1 ./ A;
phaseA = unwrap(angle(A));
phaseA = phaseA(1:NFFT/2,:);
tauA = -1 * diff(phaseA);
% diff has one fft bin less, so we repeat the last one
tau = [tauA;tauA(end,:)];
%tau = tau';

t = dct(tau);
t = t(2:num_coeff+1, :)';

d=deltas(t',3)';
d1=deltas(d',3)';
t_mdd=[t d d1];
t_dd=[d d1];
t_dbd=d1;

tau=t';
apgd_mdd=t_mdd';
apgd_dd=t_dd';
apgd_dbd=t_dbd';
end
