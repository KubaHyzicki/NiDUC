clc;
close all;
clear all;

%ustawianie zmiennych-poniżej są podane przykładowe wartości, dla których widać już efekty kanałów
n=100;       %długość sygnału
frameSize=10; %długość pojedynczej ramki
range=0.005;    %szansa na przekłamanie bitu(od 0 do 1)
sigma=4;      %wpływa na rozrzut wartości szumu-taka duża wartość, bo test jest przy 5-krotnym wzmocnieniem sygnału
amplify=5;    %wzmocnienie sygnału




signal=[];
signal=generateRand(n);
coded=codeCRC(signal,frameSize);
%tempVec=canalVB(tempVec,range);
%tempVec=decoder(tempVec);
uncoded=checkCRC(signal,frameSize,16);
uncoded

#signalSimulation(n,frameSize,sigma,range,amplify)
