# NiDUC
W projekcie został zasymulowany sygnał zakodowany z użyciem bitów parzystości,
jest on przepuszczany przez kanał przekłamujący bity lub dodający szum biały,
potem odkodowywany i sprawdzana jest poprawność jego bitów parzystości

Kod jest mało optymalny do testów, bo funkcja symulująca symuluje obie wersje kanału i zwraca oba wektory ich wyniku; program przez to będzie się wykonywał pewnie dwa razy dłużej niż jest to konieczne(teoretycznie łatwo to poprawić, dodając coś w rodzaju zmiennej trybu)



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
