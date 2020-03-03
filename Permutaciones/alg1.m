
clc;
clear all;

fprintf('Ingrese a continuacion un secuencia de n enteros separados por espacio:\n\n');

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
        input(i) = temp;
    end
end

% Se ordena el vector 'input' por medio del algoritmo de ordenamiento
% burbuja.
for i = 1 : n
    for j = 1 : n - i
        if input(j) > input(j + 1)
            temp = input(j + 1);
            input(j + 1) = input(j);
            input(j) = temp;
        end
    end
end

% Se establece la variable 'permutacion' en true.
permutacion = true;

% Bucle for desde 1 hasta n - 1.
for i = 1 : n - 1
    
    % Si el valor de 'input' en la posicion i es diferente al valor de
    % 'input' en la posicion i + 1, menos 1, se descarta que input sea
    % una permutacion.
    if input(i) ~= input(i + 1) - 1
        permutacion = false;
        break;
    end
end

% Se imprime el vector 'input'.
fprintf('\nLos numeros ingresados de menor a mayor son:\n');

input

% Se imprime si 'input' es o no una permutacion.
if permutacion
    fprintf('\nPor tanto es una permutacion !\n');
else
    fprintf('\nPor tanto no es una permutacion !\n');
end


















