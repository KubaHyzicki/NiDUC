function [VecNew] = codeCRC (Vec,D)
%  gen=crc.generator('Polynomial','0x8005','ReflectInput',true,'ReflectRemainder',true);
  VecNew=[];
  m=length(D)-1;
  VecNew=[Vec zeros(1,m)];
  for i=1:length(Vec)
    if (VecNew(i) == 0)
      continue;
    end
    VecNew(i:i+m) = xor(VecNew(i:i+m),D);
  end
  VecNew=[Vec VecNew(length(Vec)+1:length(VecNew))];
  %codeCRC=VecNew(length(Vec)+1:length(VecNew));
endfunction