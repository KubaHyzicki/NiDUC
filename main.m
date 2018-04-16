clc;
close all;
clear all;

%setting variables;
frameSize=10;
n=5;

%creating randomized n binary series
signal={};
for i=1:n
  signal=[signal;generateRand(frameSize)];
end

%adding parity bit
for i=1:n
  signal{i}=codeParityBit(signal{i});
end
signal

%canals                         //tu masz błąd, bo zasięg ma raczej obejmować konkretne ramki, a nie konkretne
%canalS(signal,2,4,frameSize)    %bity w ramkach         //dorobiłeś alternatywy
signal=canalPp(signal,2,4,frameSize);

%tworzenie wektora z zawierającego kolejne wartości, czy zgadza się bit parzystości w danej ramce
framesCorr=[];
for i=1:n
  frameCorr(i)=decoder(signal{i});
end
frameCorr


%wyświetlenie histogramu i wykresu poprawności ramek
%hist(frameCorr);
%plot(hist(frameCorr));