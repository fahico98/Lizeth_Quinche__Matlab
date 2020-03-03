
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

% Arreglo con las longitudes de los ciclos de la permutacion.
ciclos = zeros(1, n);

% Numero de inversiones de la permutacion.
inversiones = 0;

% Valor del decremento de la permutancion.
decremento = 0;

% Signo de la permutacion.
signo = 0;

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

% Se establece el numero de inversiones, el cual se obtiene calculando el
% factorial de 'n'.
for i = 1 : n
    for j = i : n
        if input(i) > input(j)
            inversiones = inversiones + 1;
        end
    end
end

% Variables necesarias para calcular los ciclos de la permutacion.
index = 1;
ciclo = 1;
endWhile = false;
r = 0;

% Bucle while que termina cuando la variable 'endWhile' se vuelva
% verdadera.
while ~endWhile
    
    % Si 'input' en al posicion 'index' es diferente de cero, se almacena
    % en index este valor y se establece en -1, esto indica que este valor
    % ya pertenece a un ciclo de la permutacion.
    if input(index) ~= -1
        indexOld = index;
        index = input(index);
        input(indexOld) = -1;
        
        % La variable 'r' representa la longitud del ciclo que se esta
        % calculando.
        r = r + 1;
    else
        
        % Cuando el ciclo termina, es decir, cuando se encuentra con un -1,
        % se almacena la longitud del ciclo en el arreglo 'ciclos', se le
        % suma 1 a la variable 'ciclo' y se reinicia la variable 'r' en
        % cero.
        ciclos(ciclo) = r;
        ciclo = ciclo + 1;
        r = 0;
        
        % Se determina si todos los ciclos de la permutacion han sido
        % recorridos, si es asi, se termina el bucle while principal, es
        % decir, se le da el valor de true a la variable 'endWhile'.
        endWhile = true;
        for i = 1 : n
            if input(i) ~= -1
                endWhile = false;
                index = i;
                break;
            end
        end
    end
end

% Se calcula el valor del decremento de la permutacion y se almacena en la
% variable 'decremento'.
for i = 1 : ciclo - 1
    decremento = decremento + (ciclos(i) - 1);
end

% Si imprime el numero de inversiones de la permutacion.
fprintf('Numero de inversiones: %i\n', inversiones);

% Si el valor de (-1)^decremento es 1 entonces la permutacion es par, si es
% igual a -1 entonces esta es impar.
if (-1)^decremento == 1
    fprintf('Signo de la permutacion: par !\n');
else
    fprintf('Signo de la permutacion: impar !\n');
end























