function [output] = signalSimulation (n,frameSize,sigma,range,amplify)
%tworzenie losowego ciągu binarnego za pomocą rand()
signal=[];
signal=generateRand(n);
%alternatywnie za pomocą normrnd():
%signal=generateNormrnd(n);

recivedBitsVB=0;
missedBitsVB=0;
correctBitsVB=0;

recivedBitsVN=0;
missedBitsVN=0;
correctBitsVN=0;



tempVec=[];
frameStart=1;
%breaker=0;                 %breaker i jego pochodne nazwy służyły wstępnie do zakończenia pętli w razie błędów w wyjściu z niej
%breakingAt=n*10;
while(true)
%  breaker++;
  tempFrameSize=frameSize;
  frameEnd=frameStart+frameSize-1;
  if frameEnd>n
    frameEnd=n;
    tempFrameSize=frameEnd-frameEnd+1;
  end
%przepuszczanie sygnału przez symulację
  tempVec=codeParityBit(signal(frameStart:frameEnd),tempFrameSize);
  tempVec=canalVB(tempVec,range);
  tempVec=decoder(tempVec);
  
  recivedBitsVB+=tempFrameSize;
  if checkBitParity(tempVec,tempFrameSize)(1)==1
    frameStart+=tempFrameSize;                      %poprawnie przesłana paczka
    if frameEnd==n
      break;
    end
  else
    missedBitsVB+=tempFrameSize;                    %niepoprawnie przesłana paczka-powtórzenie pętli
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
  tempFrameSize=frameSize;
  frameEnd=frameStart+frameSize-1;
  if frameEnd>n
    frameEnd=n;
    tempFrameSize=frameEnd-frameEnd+1;
  end
%przepuszczanie sygnału przez symulację
  tempVec=codeParityBit(signal(frameStart:frameEnd),tempFrameSize);
  tempVec=canalVN(tempVec,sigma,amplify);
  tempVec=decoder(tempVec);
  
  recivedBitsVN+=tempFrameSize;
  if checkBitParity(tempVec,tempFrameSize)(1)==1
    frameStart+=tempFrameSize;                      %poprawnie przesłana paczka
    if frameEnd==n
      break;
    end
  else
    missedBitsVN+=tempFrameSize;                  %niepoprawnie przesłana paczka-powtórzenie pętli
  end
%  breaker
%  if breaker==breakingAt
%    "no nie poszło"
%    break;
%  end
end

correctBitsVB=recivedBitsVB-missedBitsVB;     %właściwie to to jest niepotrzebne, bo przecież ostateczna liczba poprawnych będzie zawsze taka sama, ale whatever...
correctBitsVN=recivedBitsVN-missedBitsVN;

output=[recivedBitsVB,missedBitsVB,correctBitsVB,recivedBitsVN,missedBitsVN,correctBitsVN];

endfunction
