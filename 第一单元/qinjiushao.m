% 使用matlab语言编写一个程序，要求使用秦九邵算法计算多项式函数的值
coefficients = [3, 0, -2, 0, 1, 7]; % 多项式的系数，从高次到低次排列
x_value = 3; % 要计算的x值

result = calculate1(coefficients, x_value);
disp(['多项式在 x = ', num2str(x_value), ' 处的值为 ', num2str(result)]);

function result = calculate1(coeffs, x)
    n = length(coeffs);
    result = coeffs(1);
    for i = 2:n
        result = result * x + coeffs(i);
    end
end
