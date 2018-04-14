function [Signal] = canalV2 (Signal,range)
for i=1:(length(Signal))
  x=rand(1);
  if x<=range
    if Signal(i)==0
      Signal(i)=1;
    else
      Signal(i)=0;
    end
  end
end
endfunction
