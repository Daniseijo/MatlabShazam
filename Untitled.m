%% Canciones a la base de datos
folder2database('Canciones');

%% Muestra a comparar y programa para presentar

clear;
numSong = input(['Elija una canci�n\n'...
    '1-Falling Slowly Pic\n' ...
    '2-Cum on Feel the Noize Pic\n'...
    '3-Get It On Pic\n'...
    '4-Inmigrant Song Pic\n'...
    '5-Piano Man Pic\n'...
    '6-House of the Rising Sun Pic\n'...
    '7-Rock & Roll Band Pic\n'...
    '8-Sunday Bloody Sunday Pic\n'...
    '9-Whole Lotta Love Pic\n'...
    '10-Cum on Feel the Noize Grabada de M�vil\n'...
    '11-Get It On Grabada de M�vil\n'...
    '12-Rock & Roll Band Grabada de M�vil\n']);
ruido = input('Elija un factor de ruido (0-1)\n');

switch numSong
    case 1
        song = 'Falling Slowly Pic';
    case 2
        song = 'Cum on Feel the Noize Pic';
    case 3
        song = 'Get It On Pic';
    case 4
        song = 'Inmigrant Song Pic';
    case 5
        song = 'Piano Man Pic';
    case 6
        song = 'Rising Sun Pic';
    case 7
        song = 'Rock & Roll Band Pic';
    case 8
        song = 'Sunday Bloody Sunday Pic';
    case 9
        song = 'Whole Lotta Love Pic';
    case 10
        song = 'Cum on M�vil';
    case 11
        song = 'Get It On M�vil';
    case 12
        song = 'Rock M�vil';
        
    otherwise
        disp('Unknown song.')
end
        
[matrix Y NB] = song2hash(song, ruido);
[grafica t match] = compareSongs(matrix);

if (match)
    plot (t, grafica);
else
    h = msgbox('No se han encontrado coincidencias','Warning', 'warn');
end

muestra = audioplayer(Y, 8000, NB);