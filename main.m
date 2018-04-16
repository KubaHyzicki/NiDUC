clc;
close all;
clear all;

%setting variables;
n=1000;
frameSize=5;
%sigma=4;      %taka duża wartość, bo test jest przy 5-krotnym wzmocnieniem sygnału
range=0.3;
amplify=5;

%corVB={};
%corVN={};
%for i=1:10
%  sigma=i/2;
%  [corVB(i),corVN(i)]=signalSimulation(n,frameSize,sigma,range,amplify);
%end

corVB=[];
corVN=[];
for i=1:1:10
  sigma=i/2;
  [corVB,corVN]=signalSimulation(n,frameSize,sigma,range,amplify);
end


%wyświetlenie histogramu i wykresu poprawności ramek
hist(corVN);
plot(hist(corVN))
hist(corVN);
%plot(hist(corVN))