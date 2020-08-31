const String newGameTitle = 'Koniec gry';
const String newGameQuestion = 'Zakończyć trwającą grę?';
const String accept = 'TAK';
const String decline = 'NIE';
const List<int> colorNumbers = [6, 8, 10, 12];
const String colorsTitle = 'Liczba kolorów';
const List<int> fieldNumbers = [4, 5, 6];
const String fieldTitle = 'Liczba pól';
const String emptyTitle = 'Puste pola';
const String repeatTitle = 'Powtarzanie kolorów';
const String trialTitle = 'Liczba prób';
const String defaultTrials = '10';
const bool emptyDefault = false;
const bool repeatDefault = true;
const String helpTitle = 'Pomoc';
const List<String> helpText = [
  '''\t\tWitaj w grze Mastermind!''',
  '''\t\tTwoim zadaniem jest odgadnięcie kolorów pól w danej liczbie prób na podstawie zwracanych podpowiedzi.''',
  '''\t\tDotknij pola w dolnym panelu i wybierz dla niego kolor. Kiedy wszystkie pola będą miały pożądane kolory wciśnij ✓.
Uwaga! Przycisk ✓ jest widoczny tylko, gdy kolory pól tworzą poprawną sekwencję.''',
  '''\t\tPo zatwierdzeniu twoje ułożenie pojawi się na liście wpisów, obok natomiast będą znajdować się kropki z podpowiedziami.''',
  '''\t\tKażda czarna kropka oznacza, że jeden z elementów w zgadywanym ułożeniu kolorów jest dokładnie taki sam jak w twoim (ten sam kolor na tym samym miejscu).''',
  '''\t\tKażda biała kropka oznacza, że któryś ze zgadniętych kolorów jest w poprawnym ułożeniu, ale na innym miejscu.''',
  '''\t\tW momencie w którym zgadniesz poprawne ułożenie kolorów lub wyczerpiesz limit prób gra się kończy, u góry ekranu widoczna jest wtedy poprawna odpowiedź. Aby rozpocząć nową grę wciśnij ⟲''',
  '''\t\tJeśli chcesz usunąć kolor z pola przytrzymaj je, a gdy chcesz zakończyć grę przesuń pasek z polami w prawo lub w lewo albo wciśnij przycisk WSTECZ. Gdy chcesz ponownie użyć podobnego ułożenia przytrzymaj odpowiedź na liście, a wtedy pojawi się ona w panelu u dołu ekranu.''',
  '''\t\tAby rozpocząć grę wybierz pożądane opcje, pierwsze trzy to podstawowe parametry liczbowe, kolejne dwa to odpowiednio: czy w odpowiedzi kolory mogą się powtarzać oraz czy mogą w niej występować puste pola. Następnie wciśnij START''',
  '''Powodzenia!''',
];