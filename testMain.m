clc;
close all;
clear all;

%ustawianie zmiennych-poniżej są podane przykładowe wartości, dla których widać już efekty kanałów
n=100;       %długość sygnału
frameSize=10; %długość pojedynczej ramki
range=0.005;    %szansa na przekłamanie bitu(od 0 do 1)
sigma=4;      %wpływa na rozrzut wartości szumu-taka duża wartość, bo test jest przy 5-krotnym wzmocnieniem sygnału
amplify=5;    %wzmocnienie sygnału
clc;
close all;
clear all;

%ustawianie zmiennych-poniżej są podane przykładowe wartości, dla których widać już efekty kanałów
n=10;        %długość sygnału
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
D


signal=[];
signal=generateRand(n);
signal
coded=codeCRC(signal,D);
coded
corr=checkCRC(coded,D)
coded(4)=~coded(4);
coded
corr=checkCRC(coded,D)
%tempVec=canalVB(tempVec,range);
%tempVec=decoder(tempVec);
%uncoded=checkCRC(signal,frameSize,16);
%uncoded

#signalSimulation(n,frameSize,sigma,range,amplify)
