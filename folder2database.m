function [] = folder2database(folder)
% Para crear la base de datos
%   Se toma una carpeta existente que contenga las canciones a almacenar.
%   Muestreo, eliminación de offset y obtención del espectrograma y el mapa
%   de constelación

    d = dir([folder '\*.wav']);
    for i = 1 : length(d)
        song = d(i).name(1:length(d(i).name)-4);
        [Y FS] = wavread([folder '\' song]);
        Y = resample(Y,8000,FS);
        Y = mean(Y,2); % Media entre dos canales al ser estéreo
        Y = Y-mean(Y); % Eliminamos offset
        Y = Y/max(Y);
        [S, ~, T] = spectrogram(Y,2048,128,256,8000);

        M = ones(13);
        N = (floor(13/2)+1);
        M(N,N) = 0;
        BW = abs(S) > imdilate(abs(S), M);
        imwrite(BW, ['songs\Constelacion ' song '.png']);
        
        save (['songs\Tiempo' song], 'T');
        
        matrix = BW;
    end
end