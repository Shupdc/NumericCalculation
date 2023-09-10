% 给定的节点和对应的函数值
x = [0.2, 0.4, 0.6, 0.8, 1.0]; % 节点的 x 坐标
y = [0.98, 0.92, 0.81, 0.64, 0.38]; % 节点的函数值

% 要进行插值的点
x_interpolate = [0.2, 0.28, 1.08, 1.0]; % 要插值的点的 x 坐标

% 初始化插值结果
y_interpolate = zeros(size(x_interpolate));

% 开始插值
for k = 1:length(x_interpolate)
    % 计算拉格朗日插值多项式 
    L = ones(size(x)); % 记得初始化！
    %l_k(x) = （x-x0)...(x-x_(k-1))(x-x_(k+1))...(x-x_n)/((x_k-x_0)...(x_k-x_(k-1))(x_k-x_(k+1))...(x_k-x_n))
    for i = 1:length(x) % 节点的个数,遍历k个
        for j = 1:length(x) % 这一层循环计算l_k(x)
            if i ~= j 
                L(i) = L(i) * (x_interpolate(k) - x(j)) / (x(i) - x(j));
            end
        end
    end
    
    % 计算插值结果 Ln(xj)=sum(0,n, y_k*l_k)
    y_interpolate(k) = sum(L .* y);
end

% 输出插值结果
disp('插值结果1：');
disp([x_interpolate', y_interpolate']);
