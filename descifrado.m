function mensaje_des = descifrado(mensaje, publica, privada)
% Funcion que descifra un mensaje cifrado utilizando las claves privada y
% publica.

    % Compruebo el mensaje introducido
    if(~ischar(mensaje))
        disp('Error [descifrado]: el mensaje introducido no es una cadena.');
        mensaje_des = 0;
        return;
    end
    
    % Compruebo el mensaje introducido
    if(~ischar(publica))
        disp('Error [descifrado]: la clave publica no es una cadena.');
        mensaje_des = 0;
        return;
    end
    
    % Compruebo el mensaje introducido
    if(~ischar(privada))
        disp('Error [descifrado]: la clave privada no es una cadena.');
        mensaje_des = 0;
        return;
    end
    privada = upper(privada);
    
    % Dividimos el mensaje cifrado en bloques de longitud del mensaje /
    % longitud de la clave privada.
    tam_bloque = length(mensaje)/length(privada);
    matriz = char(zeros(tam_bloque,length(privada))+'0');
    
    bloque = '';
    for i=1:length(privada)
       bloque = mensaje(1:tam_bloque);
       matriz(:,i)=bloque';
       mensaje = erase(mensaje,bloque);       
    end
    
    % Concatenamos verticalmente la clave privada ordenada para poder
    % deshacer las permutaciones realizadas.
    priv_ordenada = sort(privada);
    matriz = vertcat(priv_ordenada,matriz);
    
    % Utilizamos una matriz auxiliar para deshacer la permutación
    matriz_desordenada = char(zeros(tam_bloque,length(privada))+'0');
    for i=1:length(privada)
        [~,columna] = find(matriz(1,:)==privada(i));
        matriz_desordenada(:,i)=matriz(2:end,columna);
    end
    
    % Leemos la matriz por filas para deshacer la sustitucion realizada.
    cadena_sustituida = reshape(matriz_desordenada',1,numel(matriz_desordenada));

    % Obtenemos la matriz de cifrado utilizada a partir de la clave publica
    matriz_descifrado = init_matrix(publica);
    
    % Obtenemos el mensaje descifrado
    mensaje_des = deshacer_sustitucion(matriz_descifrado,cadena_sustituida);
    

end