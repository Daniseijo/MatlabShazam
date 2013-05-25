function [matrix S T] = song2database(song)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    folder = ['Canciones\' song '.wav'];
    [Y FS] = wavread(folder);
    Y = resample(Y,8000,FS);
    Y = mean(Y,2); % Media entre dos canales al ser estéreo
    Y = Y-mean(Y); % Eliminamos offset
    Y = Y/max(Y);
    [S F T] = spectrogram(Y,2048,1024,4096,8000);

    M = ones(13);
    N = (floor(13/2)+1);
    M(N,N) = 0;
    BW = abs(S) > imdilate(abs(S), M);
    imwrite(BW, ['songs\Constelacion ' song '.png']);
    
    save (['songs\Tiempo' song], 'T');
    
    matrix = BW;

end

