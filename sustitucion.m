function cadena_sust = sustitucion(matriz,mensaje)
% Funcion que se encarga de realizar la sustitucion de cada caracter del mensaje por su correspondiente pareja de letras cifradas.

    % Compruebo la matriz introducida
    [filas,columnas] = size(matriz);
    if (filas~=6 && columnas~=6)
        disp('Error [sustitucion]: la matriz de cifrado no es de dimension 6x6.');
        cadena_sust = 0;
        return;
    end

    % Compruebo el mensaje introducido
    if(~ischar(mensaje))
        disp('Error [sustitucion]: el mensaje introducido no es una cadena.');
        cadena_sust = 0;
        return;
    end
    
    % Paso el mensaje a mayuscula
    mensaje = upper(mensaje);
    
    % Con ayuda de una cadena con la cifra del metodo
    cifra = 'ADFGVX';
    
    % Recorro el mensaje, busco cada caracter en la matriz y lo sustituyo
    % por una pareja de letras cifradas: 
    % Primera letra --> indice de la fila que sera sustituido por la
    % correspondiente letra de la variable cifra
    % Segunda letra --> indice de la columna que sera sustituido por la
    % correspondiente letra de la variable cifra    
    cadena_sust='';
    for i = mensaje 
        [fila,columna] = find(matriz==i);
        cadena_sust = strcat(cadena_sust,cifra(fila),cifra(columna));
    end
    
end