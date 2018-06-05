clc;
close all;
clear all;

%ustawianie zmiennych-poniżej są podane przykładowe wartości, dla których widać już efekty kanałów
n=10000;        %długość sygnału
frameSize=10; %długość pojedynczej ramki
range=0.005;  %szansa na przekłamanie bitu(od 0 do 1)
sigma=4;      %wpływa na rozrzut wartości szumu-taka duża wartość, bo test jest przy 5-krotnym wzmocnieniem sygnału
amplify=5;    %wzmocnienie sygnału
m=8;          %długość kodowania crc
P = ones(1, m+1);     %dzielniki crc-długość to m+1
if (m == 4)
%  D = generateRand(5);
  D=[0 0 1 0 1];
elseif (m == 8)
  D=[1 0 1 0 1 1 0 1 1];
else
  "ciastko"
end

recivedBits=0;
missedBits=0;
correctBits=0;

signal=[];
signal=generateRand(n);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tempVec=[];
frameStart=1;
while(true)
%ustalanie granic ramki
  tempFrameSize=frameSize;
  frameEnd=frameStart+frameSize+m-1;
  if frameEnd>n
    frameEnd=n;
    tempFrameSize=frameEnd-frameEnd+1;
  end
%przepuszczanie sygnału przez symulację

%  tempVec=codeParityBit(signal(frameStart:frameEnd),tempFrameSize);
  tempVec=codeCRC(signal(frameStart:frameEnd),D);
  
  tempVec=canalVB(tempVec,range);
  tempVec=decoder(tempVec);
  
  recivedBits+=tempFrameSize;
%  if checkBitParity(tempVec,tempFrameSize)(1)==1
  if checkCRC(tempVec,D)==1
    frameStart+=tempFrameSize;                      %poprawnie przesłana paczka
    if frameEnd==n
      break;
    end
  else
    missedBits+=tempFrameSize;                    %niepoprawnie przesłana paczka-powtórzenie pętli
  end
end

correctBits=recivedBits-missedBits;
BER=missedBits/(recivedBits);
E=correctBits/(recivedBits);
E
BER
