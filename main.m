clc;
close all;
clear all;

%setting variables;
frameSize=5;
n=1000;
sigma=4;      %taka duża wartość, bo to test przy wzmocnieniu sygnału
range=0.3;
amplify=5;

%tworzenie losowego ciągu binarnego za pomocą rand()
signal=[];
signal=generateRand(n);
%alternatywnie za pomocą normrnd():
%signal=generateNormrnd(n);

%dodawanie bitu parzystości
signal=codeParityBit(signal,frameSize);
%przepuszczenie przez kanał dodający szum biały
signalOutVN=canal(signal,sigma,amplify);
%przepuszczanie przez kanał przekłamujący bity
signalOutVB=canalV2(signal,range);
%dekodowanie kanału z szumem białym
signalOutVN=decoder(signalOutVN);

%tworzenie wektorów z zawierającego kolejne wartości, czy zgadza się bit parzystości w kolejnych ramkach
corVN=checkBitParity(signalOutVN,frameSize);
corVB=checkBitParity(signalOutVB,frameSize);


%wyświetlenie histogramu i wykresu poprawności ramek
%hist(corVN)
%plot(hist(corVN))
%hist(corVN);
%plot(hist(corVN))