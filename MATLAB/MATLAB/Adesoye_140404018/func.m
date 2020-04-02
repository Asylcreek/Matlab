function [ z ] = func(y1, y2, y3, n )
%     f function that decides the solution for params Y
    if(n == 1)
        z = f1(y2);
        
    elseif(n == 2)
        z = f2(y3);
        
    else
        z = f3(y1, y3);
        
    end
end

function [z] = f1(y2)
    z = y2;
end


function [z] = f2(y3)
    z = y3;
end


function [z] = f3(y1, y3)
    z = -0.5*y1*y3;
end