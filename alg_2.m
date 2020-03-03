
clear all;
clc;

fprintf('Ejercicio 2...\n');

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

M = zeros(n, n);

fprintf('\nIngrese los coeficientes de cada ecuacion de la matriz a formatear\n');
fprintf('separados por espacio...\n\n');

for i = 1 : n
    fprintf('Fila %i: ', i);
    inputStr = input('', 's');
    inputArray = strsplit(inputStr, ' ');
    for j = 1 : n
        temp = str2double(inputArray(j));
        if ~isnan(temp)
            M(i, j) = temp;
        end
    end
end

nnz = 0;

for i = 1 : n
    for j = 1 : n
        if M(i, j) ~= 0
            nnz = nnz + 1;
        end
    end
end

val = zeros(1, nnz);
ja = zeros(1, nnz);
aa = zeros(1, n);

indexVal = 1;
index = 1;

for i = 1 : n
    rowBegin = false;
    for j = 1 : j
        if M(i, j) ~= 0
            val(1, indexVal) = M(i, j);
            ja(1, indexVal) = j - 1;
            if ~rowBegin
                aa(1, index) = indexVal - 1;
                index = index + 1;
                rowBegin = true;
            end
            indexVal = indexVal + 1;
        end
    end
end

fprintf('\nVector de valores:\n');
val

fprintf('\nVector JA:\n');
ja

fprintf('\nVector AA:\n');
aa

























