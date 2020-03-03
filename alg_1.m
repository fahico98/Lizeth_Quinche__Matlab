
clear all;
clc;

fprintf('Ejercicio 1...\n');

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

sup = false;
inf = false;

for i = 1 : n - 1
    for j = i + 1 : n
        if A(i, j) ~= 0
            sup = true;
            break;
        end
    end
    if sup
        break;
    end
end

for i = 2 : n
    for j = 1 : i - 1
        if A(i, j) ~= 0
            inf = true;
            break;
        end
    end
    if inf
        break;
    end
end

eof = false;

if sup && ~inf
    fprintf('\nLa matriz A es triangular superior...!\n');
    fprintf('El sistema se resolvera por medio de sustitucion hacia atras.\n');
elseif ~sup && inf
    fprintf('\nLa matriz A es triangular inferior...!\n');
    fprintf('El sistema se resolvera por medio de sustitucion hacia adelante.\n');
elseif sup && inf
    fprintf('\nLa matriz A no es triangular...!\n');
    eof = true;
end

solucion = zeros(n, 1);

if ~eof
    if sup
        for i = n : -1 : 1
            diagonal = A(i, i);
            suma = b(i, 1);
            if i ~= n
                for j = n : -1 : i + 1
                    suma = suma - solucion(j, 1) * A(i, j);
                end
            end
            solucion(i, 1) = suma / diagonal;
        end
    else
        for i = 1 : n
            diagonal = A(i, i);
            suma = b(i, 1);
            if i ~= 1
                for j = 1 : i - 1
                    suma = suma - solucion(j, 1) * A(i, j);
                end
            end
            solucion(i, 1) = suma / diagonal;
        end
    end
    fprintf('\nVector solucion: \n');
    solucion
end



























