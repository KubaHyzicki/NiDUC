function [VecNew] = codeParityBit (Vec,frameSize)
  gen=crc.generator('Polynomial','0x8005','ReflectInput',true,'ReflectRemainder',true);
  VecNew=[];
  VecTemp=[];
  b=1;
  while true
    if b>length(Vec)
      break;
    end
    if b+frameSize>length(Vec)
      frameSize=length(Vec)-b;
    end
    VecTemp=generate(gen,Vec(b:b+frameSize));
    VecNew=[VecNew,VecTemp];
    b=b+frameSize+1;
  end
endfunction