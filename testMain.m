clc;
close all;
clear all;

%ustawianie zmiennych-poniżej są podane przykładowe wartości, dla których widać już efekty kanałów
n=100;
frameSize=10;
sigma=4;      %taka duża wartość, bo test jest przy 5-krotnym wzmocnieniem sygnału
range=0.3;
amplify=5;

recivedBitsVB=[];        %BER=błędne/wszystkie
missedBitsVB=[];         %E=poprawnie/błędnie
correctBitsVB=[];
recivedBitsVN=[];        %BER=błędne/wszystkie
missedBitsVN=[];         %E=poprawnie/błędnie
correctBitsVN=[];

%for i=1:1:10
i=20;
rangeTab=[];
  range=(i-1)/30;
  rangeTab=[rangeTab,range];
  frameLost=signalSimulation(n,frameSize,sigma,range,amplify);
  recivedBitsVB=[recivedBitsVB,frameLost(1)];
  missedBitsVB=[missedBitsVB,frameLost(2)];
  correctBitsVB=[correctBitsVB,frameLost(3)];
%end
%for i=1:1:10
%  sigma=(i-1)/2;
%  sigmaTab=[sigmaTab,sigma];
%  frameLost=signalSimulation(n,frameSize,sigma,range,amplify);
%  recivedBitsVN=[recivedBitsVN,frameLost(2,1)]
%  missedBitsVN=[missedBitsVN,frameLost(2,2)]
%  correctBitsVN=[correctBitsVN,frameLost(2,3)]
%end

recivedBitsVB
missedBitsVB
correctBitsVB
