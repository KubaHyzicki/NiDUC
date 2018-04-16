function [Signal] = canalVN (Signal,sigma,amplify)
#tu teoretycznie można dodać jeszcze jakieś niwelowanie zakłóceń w postaci np. wzmocnienia sygnału
for i=1:(length(Signal))
  Signal(i)*=amplify;
  Signal(i)=Signal(i)+normrnd(0,sigma);
  Signal(i)/=amplify;
end
endfunction