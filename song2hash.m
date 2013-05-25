function [matrix Y] = song2hash(song, ruido)
% Para obtener mapa de constelación
%   Se toma la muestra grabada.
%   Muestreo, eliminación de offset, adición de ruido y obtención del
%   espectrograma y el mapa de constelación.

    [Y FS] = wavread(['Pics\' song]);
    Y = resample(Y,8000,FS);
    Y = mean(Y,2);
    Y = Y-mean(Y);
    Y = Y/max(Y);
    dim = size(Y);
    Y = Y + (ruido/5)*(randn(dim(1),dim(2)));
    S = spectrogram(Y,2048,128,256,8000);

    M = ones(13);
    N = (floor(13/2)+1);
    M(N,N) = 0;
    BW = abs(S) > imdilate(abs(S), M);
    imwrite(BW, ['Constelacion ' song '.png']);

    matrix = BW;

end

