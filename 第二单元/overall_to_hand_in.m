% 给定的节点和对应的函数值
x = [0.2, 0.4, 0.6, 0.8, 1.0]; % 节点的 x 坐标
y = [0.98, 0.92, 0.81, 0.64, 0.38]; % 节点的函数值

% 要进行插值的点
x_interpolate = [0.2, 0.28, 1.08, 1.0]; % 要插值的点的 x 坐标

% 初始化插值结果
y_interpolate = zeros(size(x_interpolate));

% 计算差商
n = length(x) - 1;
F = zeros(n+1, n+1);
F(:,1) = y';
% 参考表格p44，用矩阵的方式写，而不是递归会比较快
for j = 2:n+1  % 注意，只需要下三角即可
    for i = j:n+1
        F(i,j) = (F(i,j-1) - F(i-1,j-1)) / (x(i) - x(i-j+1));
    end
end


% 开始插值
for k = 1:length(x_interpolate) % 开始计算Pn(x)=f(x0)+f[x0,x1](x-x0)+...+f[x,x0,...,xn](x-x0)
    P = F(1,1); % f(x0)
    for j = 2:n+1
        term = 1;
        for i = 1:j-1
            term = term * (x_interpolate(k) - x(i));
        end
        P = P + F(j,j) * term;
    end
    y_interpolate(k) = P;
end

% 输出插值结果
disp('插值结果2：');
disp([x_interpolate', y_interpolate']);
scatter(x_interpolate', y_interpolate')
hold on;  % 保持图形打开以添加额外元素
title('插值法-牛顿示意图（注意拉格朗日情况与之相同)');
xlabel('X轴');
ylabel('Y轴');
hold off;  % 关闭图形的“保持”状态以允许进一步绘制
