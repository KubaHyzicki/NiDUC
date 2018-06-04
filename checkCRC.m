function [corr] = checkBitParity (Vec,baseFrameSize,crcLen)
  det=crc.detector('Polynomial','0x8005','ReflectInput',true,'ReflectRemainder',true);
  fraSize=baseFrameSize+crcLen;
%  outdata=[];
  while true
    if b>length(Vec)
      break;
    end
    if b+frameSize>length(Vec)
      frameSize=length(Vec)-b;
    end
    VecTemp=Vec(b:b+frameSize);
    [outdata error]=detect(det,Vec);
    corr=[corr,error];
    b=b+frameSize+1;
  end
endfunction