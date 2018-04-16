function [] = signalSimulation (n,frameSize,sigma,range,amplify)
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


%wyświetlenie histogramu i wykresu poprawności ramek
%hist(corVN)  
%plot(hist(corVN))
%hist(corVN);
%plot(hist(corVN))
endfunction
