function [frameLost] = signalSimulation (n,frameSize,sigma,range,amplify)
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

%dekodowanie kanałów
signalOutVN=decoder(signalOutVN);
signalOutVB=decoder(signalOutVB);

%tworzenie wektorów z zawierającego kolejne wartości, czy zgadza się bit parzystości w kolejnych ramkach
corVN=checkBitParity(signalOutVN,frameSize);
corVB=checkBitParity(signalOutVB,frameSize);

%zczytywanie ilości błędnych ramek
frameLostVB=0;
for i=corVB
  if i==0
    frameLostVB++;
  end
end

frameLostVN=0;
for i=corVN
  if i==0
    frameLostVN++;
  end
end

frameLost=[frameLostVB,frameLostVN];

endfunction
