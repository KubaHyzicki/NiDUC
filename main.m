clc;
close all;
clear all;

%ustawianie zmiennych-poniżej są podane przykładowe wartości, dla których widać już efekty kanałów
n=1280;        %długość sygnału
frameSize=10; %długość pojedynczej ramki
range=0.005;  %szansa na przekłamanie bitu(od 0 do 1)
%sigma=4;      %wpływa na rozrzut wartości szumu-taka duża wartość, bo test jest przy 5-krotnym wzmocnieniem sygnału
%amplify=5;    %wzmocnienie sygnału
m=8;          %długość kodowania crc
%D-dzielniki crc-długość to m+1
if (m == 4)
%  D = generateRand(5);
  D=[1 1 1 1 1];
  D=[1 0 0 1 1];
elseif (m == 8)
%  D = generateRand(9);
  D=[1 1 1 0 1 0 1 0 1];
else
  "ciastko"
end

signal=[];
signal=generateRand(n);
tabBER=[];
tabE=[];
tabFrame=[];
%tabMode=[];
%cellstr(tabMode);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mode=2;     %1-parity bit, 2-crc
m=4;
D=[1 1 1 1 1];
for frameSize=[10,15,20,25,30,35,40]
  temp=signalSimulation(n,frameSize,range,mode,D,m);
  tabBER=[tabBER temp(1)];
  tabE=[tabE temp(2)];
  tabFrame=[tabFrame frameSize];
%  tabMode=[tabMode, 'CRC4'];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mode=2;     %1-parity bit, 2-crc
m=8;
D=[1 1 1 0 1 0 1 0 1];
for frameSize=[10,15,20,25,30,35,40]
  temp=signalSimulation(n,frameSize,range,mode,D,m);
  tabBER=[tabBER temp(1)];
  tabE=[tabE temp(2)];
  tabFrame=[tabFrame frameSize];
%  tabMode=[tabMode "CRC8"];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mode=1;     %1-parity bit, 2-crc
for frameSize=[10,15,20,25,30,35,40] 
  temp=signalSimulation(n,frameSize,range,mode,D,m);
  tabBER=[tabBER temp(1)];
  tabE=[tabE temp(2)];
  tabFrame=[tabFrame frameSize];
%  tabMode=[tabMode "PB"];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%tabBER
%tabE
%tabFrame
%tabMode

%scatter(tabE,tabBER)
%subplot(211)
label1=['CRC4,n=10','CRC4,n=15','CRC4,n=20','CRC4,n=25','CRC4,n=30','CRC4,n=35','CRC4,n=40'];
label2=['CRC8,n=10','CRC8,n=15','CRC8,n=20','CRC8,n=25','CRC8,n=30','CRC8,n=35','CRC8,n=40'];
label3=['PB,n=10','PB,n=15','PB,n=20','PB,n=25','PB,n=30','PB,n=35','PB,n=40'];
plot(tabE(1:7),tabBER(1:7),'*')
text(tabE(1:7),tabBER(1:7),label1)
xlabel('E')
ylabel('BER')
hold on
plot(tabE(8:14),tabBER(8:14),'*')
text(tabE(8:14),tabBER(8:14),label2)
plot(tabE(15:21),tabBER(15:21),'*')
text(tabE(15:21),tabBER(15:21),label3)
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(212)
%label=cellstr(num2str([1:4]'));
plot(tabE(1:7),tabBER(1:7),'*')
%text(tabE,tabBER,label)
xlabel('E')
ylabel('BER')
hold on
plot(tabE(8:14),tabBER(8:14),'*')
plot(tabE(15:21),tabBER(15:21),'*')
%text(tabE,tabBER,label)
hold off