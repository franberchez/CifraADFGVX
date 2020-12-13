function matriz = init_matrix(publica)
% Funcion que se encarga de inicializar la matriz de cifrado a partir de
% una clave publica.

    if(~ischar(publica))
        disp('Error [init_matrix]: la clave publica introducida no es una cadena.');
        matriz = 0;
        return;
    end
    
    % Convertimos la cadena a mayuscula
    publica = upper(publica);
    % Coger los elementos unicos de la cadena
    publica = unique(publica,'stable');
    % Elimino espacios
    publica = strrep(publica,' ','');
    
    % Alfabeto permitido, eliminamos aquellos caracteres que no lo esten.
    alfabeto = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    
    for i = publica
       if contains(alfabeto,i)==0
           publica = erase(publica,i);
       end
    end
    
    % De cara a rellenar toda la matriz, nos quedamos tambien con los
    % caracteres del alfabeto que no estaban en el mensaje
    concatPubAlf = strcat(publica,alfabeto);
    concatPubAlf = unique(concatPubAlf,'stable');

    
    % Creamos y rellenamos la matriz.
    matriz = char(zeros(6,6)+'0');
    
    contador = 1; % Indicador del caracter a introducir
    for i = 1:6 
        for j = 1:6 
            matriz(i,j)=concatPubAlf(contador); 
            contador=contador+1;
        end 
    end   
end