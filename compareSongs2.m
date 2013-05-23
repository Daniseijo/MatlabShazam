function [Img grafica t] = compareSongs2(matrix)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    d = dir('songs\*.png');
   for i = 1 : length(d)
        Img = imread(['songs\' d(i).name]);
        aux = size(Img);
        aux1 = size(matrix);
        grafica = zeros(1,aux(2)-aux1(2));
        for j = 0 : (aux(2)-aux1(2)-1)
            div = Img(1:100,((1+j):(aux1(2)+j)));
            aux2 = xor(div,matrix(1:100,:));
            grafica(j+1) = length(aux2(aux2==0));
        end
        imwrite (div, 'division.png');
   t = 1 : (aux(2)-aux1(2));
   end
end

%% 

%Las matrices son muy grandes
% Dividir la original en trozos pequeños y comparar cada uno.

%- Sacar gráfica
%- Comprobar qué canción es


