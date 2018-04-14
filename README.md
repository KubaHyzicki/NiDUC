# NiDUC
W projekcie został zasymulowany sygnał zakodowany z użyciem bitów parzystości,
jest on przepuszczany przez kanał przekłamujący bity lub dodający szum biały,
potem odkodowywany i sprawdzana jest poprawność jego bitów parzystości


%zmienne:
frameSize-rozmiar ramki
n-długość sygnału
sigma-rozdzielczość zakłóceń(kanał dodający szum)
range-rozdzielczość zakłóceń(kanał przekłamujący bity)
amplify-wzmocnienie sygnału

%metody
generateRand(n)-tworzy losowy ciąg binarny o długości n(wersja rand())
generateNormrnd(n)-tworzy losowy ciąg binarny o długości n(wersja normrnd())
codeParityBit(signal,frameSize)-zwraca ciąg z pododawanymi bitami parzystości na końcu każdej ramki
canal(signal,sigma,amplify)-kanał dodający szum
canalV2(signal,range)-kanał przekłamujacy bity
decoder(signalOutVN)-dekoder zaszumionego sygnału
checkBitParity(signalOutVN,frameSize)-sprawdza czy bity parzystości na końcach ramek są poprawnie policzone
