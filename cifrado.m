function mensaje_cifrado = cifrado(mensaje,publica,privada)
% Funcion que se encarga de obtener un mensaje cifrado utilizando el metodo
% ADFGVX.

    % Compruebo el mensaje introducido
    if(~ischar(mensaje))
        disp('Error [cifrado]: el mensaje introducido no es una cadena.');
        mensaje_cifrado = 0;
        return;
    end
    
    % Compruebo la clave publica introducida
    if(~ischar(publica))
        disp('Error [cifrado]: la clave publica introducida no es una cadena.');
        mensaje_cifrado = 0;
        return;
    end
    
    % Compruebo la clave privada introducida
    if(~ischar(privada))
        disp('Error [cifrado]: la clave privada introducida no es una cadena.');
        mensaje_cifrado = 0;
        return;
    end
    
    % Obtengo la matriz de cifrado a partir de la clave publica
    matriz_cifrado = init_matrix(publica);
    
    % Obtengo la sustitucion del mensaje por su representacion cifrada a
    % partir de la matriz obtenida.
    mensaje_sustituido = sustitucion(matriz_cifrado,mensaje);

    % Convertimos el mensaje sustituido en una matriz con tantas columnas
    % como letras tenga la clave privada.
    while mod(length(mensaje_sustituido)/length(privada),1)~=0
       mensaje_sustituido=strcat(mensaje_sustituido,'X'); 
    end
    mensaje_sustituido = reshape(mensaje_sustituido,length(privada),length(mensaje_sustituido)/length(privada))';
    
    % Ordeno la matriz por columnas en base a la ordenacion alfabetica de
    % la clave privada
    [~,privada_ordenada] = sort(privada);   
    mensaje_sustituido_ordenado = mensaje_sustituido(:,privada_ordenada);
    
    
    % Por ultimo, obtenemos el mensaje cifrado leyendo por columnas la
    % matriz ordenada en el paso anterior.
    mensaje_cifrado='';
    for i=1:length(privada)
       mensaje_cifrado = strcat(mensaje_cifrado,mensaje_sustituido_ordenado(:,i)'); 
    end

end