%% Canciones base de datos
[mat S T] = song2database('Falling Slowly');
song2database('Rising Sun');

%% Muestra a comparar

[matrix Y] = song2hash('Falling Slowly Pic', 0.2);
[Img grafica t song] = compareSongs(matrix);
imshow(Img);