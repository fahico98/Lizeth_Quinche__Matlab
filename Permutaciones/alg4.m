
clear all;
clc;

fprintf('Ingrese a continuacion el valor de n: ');

% Se recibe por consola el valor de 'n'.
n = input('');

% Se inicia la matriz A como una matriz de ceros de tamaño n x n.
A = zeros(n, n);

% Bucle for desde 1 hasta 'n'.
for i = 1 : n
    
    fprintf('\nIngrese los valores de la fila %i de A separados por espacio.\n', i);
    
    % Se recibe por consola una cadena de caracteres con los numeros la
    % fila i-esima de la matriz A.
    inputStr = input('>> ', 's');
    
    % Se convierte la cadena de caracteres en un arreglo de caracteres y se
    % almacena en el vector 'inputArray'.
    inputArray = strsplit(inputStr, ' ');
    
    % Bucle for desde 1 hasta 'n'.
    for j = 1 : n
        
        % Se convierte a numero el valor del vector 'inputArray' y se
        % almacena en 'temp'.
        temp = str2double(inputArray(j));
        
        % Si el valor de 'temp' no es invalodo se almacena en la matriz A
        % en la posicion (i, j).
        if ~isnan(temp)
            A(i, j) = temp;
        end
    end
end

% Se imprime la matriz A.
fprintf('\nMatriz A.\n');
A

% Se calcula el determinante de A y se almacena en la variable 'detA'.
detA = det(A);

% Se imprime 'detA'.
fprintf('Determinante de A: %i.\n', detA);























