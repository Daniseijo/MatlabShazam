function [Img grafica t cancion] = compareSongs(matrix)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    d = dir('songs\*.png');
    cancion = d(1).name;
    cancion = cancion(14:length(song)-4);
    for i = 1 : length(d)
        Img = imread(['songs\' d(i).name]);
        aux = size(Img);
        aux1 = size(matrix);
        auxMat = zeros(aux(1), aux(2));
        grafica = zeros(1,(aux(2)-aux1(2)));
        for j = 1 : (aux(2)-aux1(2))
            mat = auxMat;
            mat(:, j:(aux1(2)+(j-1))) = matrix;
            auxMat2 = xor(Img, mat);
            grafica(j) = length(auxMat2(auxMat2==0));
        end
        
        t = 1 : (aux(2)-aux1(2));
    end
end

%% 

%Las matrices son muy grandes

%- Sacar gráfica
%- Comprobar qué canción es

