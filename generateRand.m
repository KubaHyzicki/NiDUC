function [Vec] = generateRand(size)
Vec=rand(1,size);
    for n=1:size
        if Vec(n)>0.5
          Vec(n)=1;
        else
          Vec(n)=0;
        end
    end
endfunction
              