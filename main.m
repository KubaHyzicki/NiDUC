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
for i=1:1:10
  range=i/10;
  rangeTab=[rangeTab,range];
  frameLostVB=[frameLostVB,signalSimulation(n,frameSize,sigma,range,amplify)];
end
for i=1:1:10
  sigma=i/2;
  sigmaTab=[sigmaTab,sigma];
  frameLostVN=[frameLostVN,signalSimulation(n,frameSize,sigma,range,amplify)];
end

%wyświetlenie wykresu poprawności ramek względem zmiennych
frameLostVB
rangeTab
frameLostVN
sigmaTab
%plot(frameLostVB,rangeTab)
%plot(frameLostVN,sigmaTab)