clc;
close all;
clear all;

%ustawianie zmiennych-poniżej są podane przykładowe wartości, dla których widać już efekty kanałów
n=100;        %długość sygnału
frameSize=10; %długość pojedynczej ramki
range=0.005;  %szansa na przekłamanie bitu(od 0 do 1)
sigma=4;      %wpływa na rozrzut wartości szumu-taka duża wartość, bo test jest przy 5-krotnym wzmocnieniem sygnału
amplify=5;    %wzmocnienie sygnału
m=8;          %długość kodowania crc
P = ones(1, m+1);     %dzielniki crc-długość to m+1
if (m == 4)
  D = generateRand(5);
elseif (m == 8)
  D = generateRand(9);
else
  "ciastko"
end


signal=[];
signal=generateRand(n);
tabBER=[];
tab4E=[];
tabFrame=[];
%tabMode=[];
%cellstr(tabMode);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mode=2;     %1-parity bit, 2-crc
for frameSize=[10,15,20,25,30,35,40]
  temp=signalSimulation(n,frameSize,range,mode,D,m);
  tabBER=[tabBER temp(1)];
  tab4E=[tab4E temp(2)];
  tabFrame=[tabFrame frameSize];
%  tabMode=[tabMode, "CRC4"];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mode=2;     %1-parity bit, 2-crc
m=8;
D=generateRand(9);
for frameSize=[10,15,20,25,30,35,40]
  temp=signalSimulation(n,frameSize,range,mode,D,m);
  tabBER=[tabBER temp(1)];
  tab4E=[tab4E temp(2)];
  tabFrame=[tabFrame frameSize];
%  tabMode=[tabMode "CRC8"];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mode=1;     %1-parity bit, 2-crc
for frameSize=[10,15,20,25,30,35,40] 
  temp=signalSimulation(n,frameSize,range,mode,D,m);
  tabBER=[tabBER temp(1)];
  tab4E=[tab4E temp(2)];
  tabFrame=[tabFrame frameSize];
%  tabMode=[tabMode "PB"];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tabBER
tab4E
tabFrame
%tabMode

%scatter(...)

%z jakiegoś powodu niektóre wywołania się zawieszają, niektóre działają dobrze... -.-