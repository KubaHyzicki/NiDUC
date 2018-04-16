clc;
close all;
clear all;

%ustawianie zmiennych-poniżej są podane przykładowe wartości, dla których widać już efekty kanałów
n=1000;
frameSize=5;
sigma=4;      %taka duża wartość, bo test jest przy 5-krotnym wzmocnieniem sygnału
range=0.3;
amplify=5;

%testowanie sygnału względem zasięgu przekłamania bitu i sigmy przy szumie
frameLostVB=[];
rangeTab=[];
frameLostVN=[];
sigmaTab=[];
frameLost=[];
for i=1:1:10
  range=i/30;
  rangeTab=[rangeTab,range];
  frameLost=signalSimulation(n,frameSize,sigma,range,amplify);
  [frameLostVB,]=[frameLostVB,frameLost(1)];
end
for i=1:1:10
  sigma=i/2;
  sigmaTab=[sigmaTab,sigma];
  frameLost=signalSimulation(n,frameSize,sigma,range,amplify);
  [frameLostVN,]=[frameLostVN,frameLost(2)];
end

%wyświetlenie wykresu poprawności ramek względem zmiennych
subplot(211)
plot(rangeTab,frameLostVB)
title('Kanał przekłamania bitów')
xlabel('Zasięg przekłamania bitów')
ylabel('Ilość utraconych ramek')
subplot(212)
plot(sigmaTab,frameLostVN)
title('Kanał dodający szum biały')
xlabel('Sigma')
ylabel('Ilość utraconych ramek')