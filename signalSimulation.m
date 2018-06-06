function [output] = signalSimulation (n,frameSize,range,codeMode,D,m)
  signal=[];
  signal=generateRand(n);
  BER=0;
  E=0;
  recivedBits=0;
  missedBits=0;
  correctBits=0;
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  if codeMode==2
    tempVec=[];
    frameStart=1;
    while(true)
%ustalanie granic ramki
      tempFrameSize=frameSize;
      frameEnd=frameStart+frameSize-1;
      if frameEnd>n
        frameEnd=n;
        tempFrameSize=frameEnd-frameEnd+1;
      end
%przepuszczanie sygnału przez symulację
%      tempVec=codeParityBit(signal(frameStart:frameEnd),tempFrameSize);
      tempVec=codeCRC(signal(frameStart:frameEnd),D);
      
      tempVec=canalVB(tempVec,range);
      tempVec=decoder(tempVec);
      
      recivedBits+=tempFrameSize;
%      if checkBitParity(tempVec,tempFrameSize)(1)==1
      if checkCRC(tempVec,D)==1
        frameStart+=tempFrameSize;                      %poprawnie przesłana paczka
        if frameEnd>=n
          break;
        end
      else
        missedBits+=tempFrameSize;                    %niepoprawnie przesłana paczka-powtórzenie pętli
      end
    end
    correctBits=recivedBits-missedBits;
    BER=missedBits/(recivedBits);
    E=correctBits/(recivedBits);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  end
  if codeMode==1
    tempVec=[];
    frameStart=1;
    while(true)
%ustalanie granic ramki
      tempFrameSize=frameSize;
      frameEnd=frameStart+frameSize-1;
      if frameEnd>n
        frameEnd=n;
        tempFrameSize=frameEnd-frameEnd+1;
      end
%przepuszczanie sygnału przez symulację
    
      tempVec=codeParityBit(signal(frameStart:frameEnd),tempFrameSize);
%      tempVec=codeCRC(signal(frameStart:frameEnd),D);
      
      tempVec=canalVB(tempVec,range);
      tempVec=decoder(tempVec);
      
      recivedBits+=tempFrameSize;
      if checkBitParity(tempVec,tempFrameSize)(1)==1
%      if checkCRC(tempVec,D)==1
        frameStart+=tempFrameSize;                      %poprawnie przesłana paczka
        if frameEnd>=n
          break;
        end
      else
        missedBits+=tempFrameSize;                    %niepoprawnie przesłana paczka-powtórzenie pętli
      end
    end
    correctBits=recivedBits-missedBits;
    BER=missedBits/(recivedBits);
    E=correctBits/(recivedBits);
  end
  
  
  output=[BER,E];
endfunction
