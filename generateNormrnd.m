function [Vec] = generateNormrnd (size)
Vec=normrnd(0.5,0.5,[1,size]);
    for n=1:size
        if Vec(n)<0.5
          Vec(n)=0;
        else
          Vec(n)=1;
        end
    end
endfunction
