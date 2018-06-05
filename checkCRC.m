function [corr] = checkCRC (Vec,D)
%  det=crc.detector('Polynomial','0x8005','ReflectInput',true,'ReflectRemainder',true);
  m=length(D)-1;
  for i=1:length(Vec)-m
    if (Vec(i) == 0)
      continue;
    end
    Vec(i:i+m) = xor(Vec(i:i+m),D);
  end
  Vec
  if Vec==zeros(1,length(Vec))
    corr=1;
  else
    corr=0;
  end
endfunction