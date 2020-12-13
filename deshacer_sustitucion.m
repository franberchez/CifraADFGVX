function des_mensaje = deshacer_sustitucion(matriz, mensaje)
% Funcion que deshace la sustitucion de un caracter por dos caracteres de
% la cifra ADFGVX.

    % Compruebo la matriz introducida
    [filas,columnas] = size(matriz);
    if (filas~=6 && columnas~=6)
        disp('Error [deshacer_sustitucion]: la matriz de descifrado no es de dimension 6x6.');
        des_mensaje = 0;
        return;
    end
    
    % Compruebo el mensaje introducido
    if(~ischar(mensaje))
        disp('Error [deshacer_sustitucion]: el mensaje introducido no es una cadena.');
        des_mensaje = 0;
        return;
    end
    
    % Para cada par de letras del mensaje, sustituirlos por el caracter
    % indicado en la matriz de descifrado.
    des_mensaje='';
    cifra = 'ADFGVX';
    for i=1:2:length(mensaje)
        fila = find(cifra==mensaje(i));
        columna = find(cifra==mensaje(i+1));
        des_mensaje = strcat(des_mensaje,matriz(fila,columna));
    end    

end