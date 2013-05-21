%%logon;
clear;
[Y FS N] = wavread('Falling Slowly');
Y = resample(Y,8000,FS);
Y = mean(Y,2);
Y = Y-mean(Y);
[S F T] = spectrogram(Y,2048,1024,4096,8000);

[Y1 FS1 N1] = wavread('Falling Slowly Pic');
Y1 = resample(Y1,8000,FS);
Y1 = mean(Y1,2);
Y1 = Y1-mean(Y1);
S1=spectrogram(Y1,2048,1024,4096,8000);

% subplot(421);
% plot(real(Y));
% subplot(422);
% plot(abs(S));
% subplot(423);
% plot(real(Y1));
% subplot(424);
% surf(T,F,abs(S),'edgecolor','none'); axis tight; 
% view(0,90);
% xlabel('Time (Seconds)'); ylabel('Hz');
N = 10;
CS = circshift(S,[0,-1]);
P = ((S-CS)>0);
for i = -N : N
    for j = -N : N
        if (~((i == j) && (i == 0)))
            CS = circshift(S,[i,j]);
            P = P & ((S-CS)>0);
        end
    end
end
P = +P;

surf(T,F,10*log(abs(S)),'edgecolor','none'); axis tight; 
view(0,90);
xlabel('Time (Seconds)'); ylabel('Hz');
%pause;
imshow(S);
%pause;
imshow(P);
colormap (1-gray);
imwrite(P, 'Constelacion.png');

N = 10;
CS1 = circshift(S1,[0,-1]);
P1 = ((S1-CS1)>0);
for i = -N : N
    for j = -N : N
        if (~((i == j) && (i == 0)))
            CS1 = circshift(S1,[i,j]);
            P1 = P1 & ((S1-CS1)>0);
        end
    end
end
P1 = +P1;

imwrite(P1, 'ConstelacionCorta.png');
%plot(abs(S1));

%%
t=0:0.001:2;                    % 2 secs @ 1kHz sample rate
y=chirp(t,100,1,200,'q');       % Start @ 100Hz, cross 200Hz at t=1sec 
spectrogram(y,64,63,800,1E3); % Display the spectrogram
title('Quadratic Chirp: start at 100Hz and cross 200Hz at t=1sec');