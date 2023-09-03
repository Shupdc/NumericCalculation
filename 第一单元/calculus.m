disp(cal_a(9))
disp(cal_b(9))

function list1 = cal_a(n)
    step1 = 0.6321;
    list1 = zeros(1,n); 
    list1(1) = step1;
    for i = 1: 1: n
        step1 = 1 - i* step1;
        list1(i+1) = step1;
    end
end

function list2 = cal_b(n)
   step2 = 1/2*(exp(-1)/(n+1) + 1/(n+1));
   list2 = zeros(1,n+1);
   list2(n+1) = step2;
   for i = n-1: -1: 0
        step2 = 1/(i+1)*(1-step2);
        list2(i+1) = step2;
   end
end