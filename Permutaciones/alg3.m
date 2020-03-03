
clc;
clear all;

fprintf('Ingrese a continuacion un secuencia de n enteros separados por\n');
fprintf('espacio, estos numeros deben ser un subconjunto no vacio del\n');
fprintf('conjunto {1, 2, 3, 4, 5, 6, 7, 8, 9}.\n\n');

% Se recibe por consola una cadena de caracteres con los numeros de la
% permutacion separados por espacio.
inputStr = input('>> ', 's');

% Se convierte la cadena de caracteres en un arreglo de caracteres y se
% almacena en el vector 'inputArray'.
inputArray = strsplit(inputStr, ' ');

% Se obtiene la longitud de arreglo y se almacena en 'n'.
n = length(inputArray);

% Se define un vector de ceros de tamaño 'n'.
input = zeros(1, n);

% Bucle for desde 1 hasta 'n'.
for i = 1 : n
    
    % Se convierte a numero el valor del vector 'inputArray' y se almacena
    % en 'temp'.
    temp = str2double(inputArray(i));
    
    % Si el valor de 'temp' no es invalodo se almacena en el vector 'input'
    % en la posicion 'i'.
    if ~isnan(temp)
        
        % Si el valor de 'temp' no pertenece al subconjunto {1, 2, 3, 4, 5,
        % 6, 7, 8, 9} entonces se lanza un error.
        if temp >= 1 && temp <= 9
            input(i) = temp;
        end
    end
end

% Varible donde se almacenaran el numero de permutaciones del subconjunto.
permutaciones = 1;

% Se calcula el numero de permutaciones por medio del factorial de 'n'.
for i = 2 : n
    permutaciones = permutaciones * i;
end

% Se imprime el numero de permutaciones.
fprintf('\nNumero de permutaciones: %i.\n\n', permutaciones);

% Se calculan y se imprimen las permutaciones del subconjunto.
fprintf('Impresion de las permutaciones:\n');
matrizPerms = perms(input)



















