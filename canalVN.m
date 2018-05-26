function [Signal] = canalVN (Signal,sigma,amplify)
for i=1:(length(Signal))
  Signal(i)*=amplify;
  Signal(i)=Signal(i)+normrnd(0,sigma);
end
endfunction