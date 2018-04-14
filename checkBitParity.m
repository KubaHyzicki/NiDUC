function [corr] = checkBitParity (Vec,frameSize)
%zmiana rozmiaru ramki do tego uwzględniającego bit parzystości
  parityBitPos=frameSize+1;
  b=0;
  i=1;
  corr=[];
%  VecOrig=[];
  for n=1:(length(Vec))
%jeśli licznik miejsca dochodzi do bitu parzystości sprawdzana jest jego poprawność, wynik zapisywany jest do wektora, a licznik ramki i licznik poprawności bitu jest resetowany
    if i==parityBitPos
      i=1;
      if b==Vec(n)
        corr=[corr,1];
      else
        corr=[corr,0];
      end
      b=0;
      continue;
    end;
%przepisywanie wektora z pominięciem bitu parzystości oraz liczenie jego poprawności
    b=xor(b,Vec(n));
%    VecOrig=[VecOrig,Vec(n)];
    i++;
  end
endfunction
%funkcja alternatywnie może zwracać albo wektor poprawności ramek(corr) albo wektor po usunięciu bitów parzystości(VecOrig)