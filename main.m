clc;
close all;
clear all;

%ustawianie zmiennych-poniżej są podane przykładowe wartości, dla których widać już efekty kanałów
n=100;       %długość sygnału
frameSize=10; %długość pojedynczej ramki
range=0.3;    %szansa na przekłamanie bitu(od 0 do 1)
sigma=4;      %wpływa na rozrzut wartości szumu-taka duża wartość, bo test jest przy 5-krotnym wzmocnieniem sygnału
amplify=5;    %wzmocnienie sygnału

%testowanie sygnału względem zasięgu przekłamania bitu i sigmy przy szumie
recivedBitsVB=[];
missedBitsVB=[];
correctBitsVB=[];
recivedBitsVN=[];
missedBitsVN=[];
correctBitsVN=[];

rangeTab=[];
sigmaTab=[];

for i=1:1:10
  range=(i-1)/30;
  rangeTab=[rangeTab,range];
  frameLost=signalSimulation(n,frameSize,sigma,range,amplify);
  recivedBitsVB=[recivedBitsVB,frameLost(1)];
  missedBitsVB=[missedBitsVB,frameLost(2)];
  correctBitsVB=[correctBitsVB,frameLost(3)];
end
for i=1:1:10
  sigma=(i-1)/2;
  sigmaTab=[sigmaTab,sigma];
  frameLost=signalSimulation(n,frameSize,sigma,range,amplify);
  recivedBitsVN=[recivedBitsVN,frameLost(4)];
  missedBitsVN=[missedBitsVN,frameLost(5)];
  correctBitsVN=[correctBitsVN,frameLost(6)];
end


%obliczanie dla obu kanałów BER i E
BERvB=[];
EvB=[];
BERvN=[];
EvN=[];
%for i=1:(length(missedBitsVB))
%  BERvB(i)=missedBitsVB(i)/(recivedBitsVB(i));
%  if missedBitsVB(i)>0                              %możliwie najmniej wpływające na wynik rozwiązanie problemu ewentualnego dzielenia przez zero
%    EvB(i)=correctBitsVB(i)/(missedBitsVB(i));
%  else
%    EvB(i)=correctBitsVB(i)/(missedBitsVB(i)+intmin);
%  end
%  BERvN(i)=missedBitsVN(i)/(recivedBitsVN(i));
%  if missedBitsVB(i)>0
%    EvN(i)=correctBitsVN(i)/(missedBitsVN(i));
%  else
%    EvN(i)=correctBitsVN(i)/(missedBitsVN(i)+intmin);
%  end
%end
for i=1:(length(missedBitsVB))
  BERvB(i)=missedBitsVB(i)/(recivedBitsVB(i));
  EvB(i)=correctBitsVB(i)/(recivedBitsVB(i));
  BERvN(i)=missedBitsVN(i)/(recivedBitsVN(i));
  EvN(i)=correctBitsVN(i)/(recivedBitsVN(i));
end



%wyświetlenie wykresów BER i E ramek względem zmiennych
subplot(221)
plot(rangeTab,BERvB)
title('Kanał przekłamania bitów-BER')
xlabel('Zasięg przekłamania bitów')
ylabel('BER')
subplot(222)
plot(sigmaTab,EvB)
title('Kanał przekłamania bitów-E')
xlabel('Sigma')
ylabel('E')
subplot(223)
plot(rangeTab,BERvN)
title('Kanał dodający szum biały-BER')
xlabel('Zasięg przekłamania bitów')
ylabel('BER')
subplot(224)
plot(sigmaTab,EvN)
title('Kanał dodający szum biały-E')
xlabel('Sigma')
ylabel('E')