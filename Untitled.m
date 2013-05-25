%% Canciones base de datos
[mat S T] = folder2database('Canciones');

%% Muestra a comparar
clear;
numSong = input('Elija una canción\n 1-Falling Slowly Pic\n 2-Cum on Feel the Noize Pic\n 3-Get It On Pic\n 4-Inmigrant Song Pic\n 5-Piano Man Pic\n 6-House of the Rising Sun Pic\n 7-Rock & Roll Band Pic\n 8-Sunday Bloody Sunday Pic\n 9-Whole Lotta Love Pic\n');

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
        
    otherwise
        disp('Unknown song.')
end
        
[matrix Y] = song2hash(song, 0.0);
[Img grafica t cancion maximos] = compareSongs(matrix);