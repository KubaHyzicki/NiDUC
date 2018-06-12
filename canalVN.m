function [Signal] = canalVN (Signal,sigma,amplify)
  for i=1:(length(Signal))
    Signal(i)*=amplify;
%rozciągnięcie również zera(dla niego samo wymnożenie nie działa)
    if Signal(i)==0
      Signal(i)=1-amplify;
    Signal(i)=Signal(i)+normrnd(0,sigma);
  end
endfunction