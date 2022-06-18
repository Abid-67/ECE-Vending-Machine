function out_display(ret_money, value)
    
    taka50 = 0;
    taka20 = 0;
    taka10 = 0;
    taka5 = 0;
    tp=num2str(value);

    if ret_money/50 >= 1
        while ret_money/50 >= 1
            taka50 = taka50 + 1;
            ret_money = ret_money - 50;
        end
    end
    if ret_money/20 >= 1
        while ret_money/20 >= 1
            taka20 = taka20 + 1;
            ret_money = ret_money - 20;
        end
    end
    if ret_money/10 >= 1
        while ret_money/10 >= 1
            taka10 = taka10 + 1;
            ret_money = ret_money - 10;
        end
    end
    if ret_money/5 >= 1
        while ret_money/5 >= 1
            taka5 = taka5 + 1;
            ret_money = ret_money - 5;
        end
    end

    i = 1;
    if taka50 ~= 0
        for j = i:taka50
            Note_disp(1,j) = "db 50 taka.jpg";
            i = i + 1;
        end
    end
    if taka20 ~= 0
        for j = i:(taka50+taka20)
            Note_disp(1,j) = "db 20 taka.jpg";
            i = i + 1;
        end
    end
    if taka10 ~= 0
        for j = i:(taka50+taka20+taka10)
            Note_disp(1,j) = "db 10 taka.jpg";
            i = i + 1;
        end
    end
    if taka5 ~= 0
        for j = i:(taka50+taka20+taka10+taka5)
            Note_disp(1,j) = "db 5 taka.jpg";
            i = i + 1;
        end
    end

    figure
    montage(Note_disp)
    title(sprintf('Total Paid: %s . Returned Money:', tp))
end