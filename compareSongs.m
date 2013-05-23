function [Img grafica t] = compareSongs(matrix)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    d = dir('songs\*.png');
    %for i = 1 : length(d)
    i = 1;
        Img = imread(['songs\' d(i).name]);
        aux = size(Img);
        aux1 = size(matrix);
        auxMat = zeros(aux(1), aux(2)-aux1(2));
        mat = [matrix auxMat];
        grafica = zeros(1,(aux(2)-aux1(2)));
        for j = 1 : (aux(2)-aux1(2))
            mat = circshift(mat, [0 1]);
            auxMat2 = xor(Img, mat);
            grafica(j) = length(auxMat2(auxMat2==0));
        end
        t = 1 : (aux(2)-aux1(2));
    %end
end

%% 

%Las matrices son muy grandes

%- Sacar gráfica
%- Comprobar qué canción es

