function [output] = signalSimulation (n,frameSize,sigma,range,amplify)
%tworzenie losowego ciągu binarnego za pomocą rand()
signal=[];
signal=generateRand(n);
%alternatywnie za pomocą normrnd():
%signal=generateNormrnd(n);

recivedBitsVB=0;        %BER=błędne/wszystkie
missedBitsVB=0;         %E=poprawnie/błędnie
correctBitsVB=0;

recivedBitsVN=0;        %BER=błędne/wszystkie
missedBitsVN=0;         %E=poprawnie/błędnie
correctBitsVN=0;



tempVec=[];
frameStart=1;
%breaker=0;
%breakingAt=n*10;
while(true)
%  breaker++;
  frameEnd=frameStart+frameSize-1;
  if frameEnd>n
    frameEnd=n;
  end
  tempVec=codeParityBit(signal(frameStart:frameEnd),frameSize);
  tempVec=canalVB(tempVec,range);
  tempVec=decoder(tempVec);
  
  recivedBitsVB+=frameEnd-frameStart+2;
  if checkBitParity(tempVec,frameSize)(1)==1
    frameStart+=frameSize;                      %poprawnie przesłana paczka
    if frameEnd==n
      break;
    end
  else
    missedBitsVB+=frameEnd-frameStart+2;                  %niepoprawnie przesłana paczka-powtórzenie pętli
  end
%  breaker
%  if breaker==breakingAt
%    "no nie poszło"
%    break;
%  end
end

tempVec=[];
frameStart=1;
%breaker=0;
while(true)
%  breaker++;
  frameEnd=frameStart+frameSize-1;
  if frameEnd>n
    frameEnd=n;
  end
  
  tempVec=codeParityBit(signal(frameStart:frameEnd),frameSize);
  tempVec=canalVN(tempVec,sigma,amplify);
  tempVec=decoder(tempVec);
  
  recivedBitsVN+=frameSize+1;
  if checkBitParity(tempVec,frameSize)(1)==1
    frameStart+=frameSize;                      %poprawnie przesłana paczka
    if frameEnd==n
      break;
    end
  else
    missedBitsVN+=frameEnd-frameStart+2;                  %niepoprawnie przesłana paczka-powtórzenie pętli
  end
%  breaker
%  if breaker==breakingAt
%    "no nie poszło"
%    break;
%  end
end

correctBitsVB=recivedBitsVB-missedBitsVB;
correctBitsVN=recivedBitsVN-missedBitsVN;

output=[recivedBitsVB,missedBitsVB,correctBitsVB,recivedBitsVN,missedBitsVN,correctBitsVN]

endfunction
