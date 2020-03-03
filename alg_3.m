
clear all;
clc;

fprintf('Ejercicio 3...\n');

while(true)
    in = input("\nIngrese el valor de n: ", "s");
    if(isnan(str2double(in)))
        fprintf("\n>>> El valor ingresado no es valido.\nPor favor intentelo de nuevo...!\n");
        continue;
    else
        n = str2double(in);
        break;
    end
end

A = zeros(n, n);

fprintf('\nIngrese los coeficientes de cada ecuacion de la matriz A separados\n');
fprintf('por espacio...\n\n');

for i = 1 : n
    fprintf('Fila %i: ', i);
    inputStr = input('', 's');
    inputArray = strsplit(inputStr, ' ');
    for j = 1 : n
        temp = str2double(inputArray(j));
        if ~isnan(temp)
            A(i, j) = temp;
        end
    end
end

fprintf('\nIngrese los coeficientes del vector b separados por espacio...\n\n');

b = zeros(n, 1);

inputStr = input('>>> ', 's');
inputArray = strsplit(inputStr, ' ');
for i = 1 : n
    temp = str2double(inputArray(i));
    if ~isnan(temp)
        b(i, 1) = temp;
    end
end

F = zeros(n, n, 1);
P = zeros(n, n, 1);
F_index = 1;
P_index = 1;

for i = 1 : n - 1
    
    F_i = eye(n);
    P_i = eye(n);
    tempArray = A(i, :);
    
    maxIndex = 1;
    
    for k = i + 1 : n
        if abs(A(k, i)) > abs(A(maxIndex, i))
            maxIndex = k;
        end
    end
    
    P_i(i, :) = zeros(1, n);
    P_i(maxIndex, :) = zeros(1, n);
    P_i(maxIndex, i) = 1;
    P_i(i, maxIndex) = 1;
    
    for j = i + 1 : n
        l = A(j, i) / tempArray(1, i);
        F_i(j, :) = F_i(j, :) - l .* F_i(i, :);
        b(j, 1) = b(j, 1) - l * b(i, 1);
    end
    
    P(:, :, P_index) = P_i;
    P_index = P_index + 1;
    
    F(:, :, F_index) = F_i;
    F_index = F_index + 1;
    
end

fprintf('\nMatrices de Frobenius.\n');
F

fprintf('\nMatrices de permutaciones.\n');
P

R = eye(n);
c = eye(n);

for i = n - 1 : -1 : 1
    R = R * F(:, :, i) * P(:, :, i);
    c = c * F(:, :, i) * P(:, :, i);
end

R = R * A;
c = c * b;

fprintf('\nSolucion a partir del sistema (R, c).');
R\c

fprintf('\nSolucion a partir del sistema (A, b).');
A\b

























