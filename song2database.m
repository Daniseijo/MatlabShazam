function [matrix] = song2database(song)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    [Y FS] = wavread(song);
    Y = resample(Y,8000,FS);
    Y = mean(Y,2);
    Y = Y-mean(Y);
    S = spectrogram(Y,2048,1024,4096,8000);

    M = ones(13);
    N = (floor(13/2)+1);
    M(N,N) = 0;
    BW = abs(S) > imdilate(abs(S), M);
    imwrite(BW, ['songs\Constelacion' song '.png']);

    matrix = BW;

end

