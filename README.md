# NiDUC Etap III
W projekcie został zasymulowany sygnał, każda ramka kodowana jest z użyciem bitów parzystości i kodu CRC,
przepuszczana przez kanał przekłamujący bity lub dodający szum biały,
potem odkodowywana i sprawdzana jest poprawność jej bitu parzystości;
w razie błędu powtarzany jest dla niej cały proces do skutku


%zmienne:

frameSize-rozmiar ramki

n-długość sygnału

sigma-rozdzielczość zakłóceń(kanał dodający szum)

range-rozdzielczość zakłóceń(kanał przekłamujący bity)

amplify-wzmocnienie sygnału

%metody:

signalSimulation(...)-ogólna metoda symulująca utworzenie sygnału, jego przesył i odbiór, zwraca ilości błędnych pakietów dla wersji z przekłamaniem bitu i z dodaniem szumu

generateRand(n)-tworzy losowy ciąg binarny o długości n(wersja rand())

generateNormrnd(n)-tworzy losowy ciąg binarny o długości n(wersja normrnd())

codeParityBit(signal,frameSize)-zwraca ciąg z pododawanymi bitami parzystości na końcu każdej ramki

canalVB(signal,range)-kanał przekłamujacy bity

canalVN(signal,sigma,amplify)-kanał dodający szum

decoder(signalOutVN)-dekoder zaszumionego sygnału

checkBitParity(signalOutVN,frameSize)-sprawdza czy bity parzystości na końcach ramek są poprawnie policzone
