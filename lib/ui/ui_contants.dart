const String newGameTitle = 'Nowa gra';
const String newGameQuestion = 'Zakończyć bieżącą grę i rozpocząć nową?';
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
  ''' Witaj w grze Mastermind!''',
  ''' Twoim zadaniem jest odgadnięcie kolorów pól w danej liczbie prób na podstawie zwracanych podpowiedzi.''',
  ''' Dotknij pola w dolnym panelu i wybierz dla niego kolor. Kiedy wszystkie pola będą miały pożądane kolory wciśnij ✓.
Uwaga! Przycisk ✓ jest widoczny tylko, gdy kolory pól tworzą poprawną sekwencję.''',
  ''' Po zatwierdzeniu twoja sekwencja pojawi się na liście wpisów, obok natomiast będą znajdować się kropki z podpowiedziami.''',
  ''' Każda czarna kropka oznacza, że jeden z elementów w zgadywanej sekwencji jest dokładnie taki sam jak w twojej (ten sam kolor na tym samym miejscu.''',
  ''' Każda biała kropka oznacza, że któryś ze zgadniętych kolorów jest w poprawnej sekwencji, ale na innym miejscu.''',
  ''' W momencie w którym zgadniesz poprawną sekwencję lub wyczerpiesz limit prób gra się kończy, u góry ekranu widoczna jest wtedy poprawna odpowiedź. Aby rozpocząć nową grę wciśnij ⟲''',
  ''' Jeśli chcesz usunąć kolor z pola przytrzymaj je, a gdy chcesz zakończyć grę przesuń pasek z polami w prawo lub w lewo.''',
  ''' Aby rozpocząć grę wybierz pożądane opcje, pierwsze trzy to podstawowe parametry liczbowe, kolejne dwa to odpowiednio: czy w sekwencji kolory mogą się powtarzać oraz czy w sekwencji mogą występować puste pola. Następnie wciśnij START''',
  '''Powodzenia!''',
];