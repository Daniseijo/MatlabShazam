function [grafica t match] = compareSongs(matrix)
% Comparar grabaci�n con base de datos.
%   Se hace xor entre los mapas de constelaci�n de la grabaci�n y de las
%   canciones de la base de datos. Se representa en una gr�fica el n�mero
%   de coincidencias en funci�n del instante de grabaci�n. Se reconoce la
%   canci�n o no en funci�n de un umbral.

    d = dir('songs\*.png');
    maximos = zeros(1,4);
    match = false;
    for i = 1 : length(d)
        if (~match)
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
            
            cancion = d(i).name;
            cancion = cancion(14:length(cancion)-4);

            grafica = grafica - mean(grafica);
            grafAux = grafica;
            [~, Imax] = max(grafica);
            for k = 1 : 4
                [X I] = max(grafAux);
                grafAux(I) = 0;
                maximos(k) = X;
                if ((maximos(1)/maximos(k) > 2) && maximos(1) > 12)
                    t = 1 : (aux(2)-aux1(2));
                    plot (t, grafica);
                    load(['songs\Tiempo' cancion]);
                    message = sprintf(['La cancion es: ' cancion '\n'...
                        'El momento de grabaci�n es aproximadamente: ' sec2mins(T(Imax))]);
                    uiwait(msgbox(message, 'Coincidencia encontrada'));
                    match = true;
                    break;
                end
            end

            t = 1 : (aux(2)-aux1(2));
        end
    end
end

