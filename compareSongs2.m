function [Img grafica t cancion maximos] = compareSongs2(matrix)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    d = dir('songs\*.png');
    maximos = zeros(1,4);
    match = false;
   for i = 1 : length(d)
       if (~match)
        Img = imread(['songs\' d(i).name]);
        aux = size(Img);
        aux1 = size(matrix);
        grafica = zeros(1,aux(2)-aux1(2));
        for j = 0 : (aux(2)-aux1(2)-1)
            div = Img(1:100,((1+j):(aux1(2)+j)));
            aux2 = xor(div,matrix(1:100,:));
            grafica(j+1) = length(aux2(aux2==0));
        end
        
        cancion = d(i).name;
            cancion = cancion(14:length(cancion)-4);

            grafica = grafica - mean(grafica);
            grafAux = grafica;
            [~, Imax] = max(grafica);
            for k = 1 : 4
                [X I] = max(grafAux);
                grafAux(I) = 0;
                maximos(k) = X;
                if ((maximos(1)/maximos(k) > 2) && maximos(1) > 15)
                    disp(['La cancion es: ' cancion]);
                    load(['songs\Tiempo' cancion]);
                    disp(['El momento de grabación es aproximadamente: ' sec2mins(T(Imax))]);
                    match = true;
                    break;
                end
            end
            
   t = 1 : (aux(2)-aux1(2));
   end
end

%% 

%Las matrices son muy grandes
% Dividir la original en trozos pequeños y comparar cada uno.

%- Sacar gráfica
%- Comprobar qué canción es


