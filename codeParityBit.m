function [VecNew] = codeParityBit (Vec,frameSize)
  VecNew=[];
  b=0;
  for n=1:length(Vec)
%przepisywanie wektora i liczenie bitu parzystości
      b=xor(b,Vec(n));
      VecNew=[VecNew,Vec(n)];
%w razie wykrycia końca ramki, dodaje się bit parzystości i resetuje jego wartość
      if mod(n,frameSize)==0
        VecNew=[VecNew,b];
        b=0;
      end
  end
endfunction
