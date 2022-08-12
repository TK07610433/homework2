import 'dart:io';
import 'game.dart';

void main() {
  while (true) {
    playGame();
    String? input;
    var len = Game.myList.length;

    do {
      stdout.write('Play again? (Y/N): ');
      input = stdin.readLineSync();
    } while (input!.toLowerCase() != 'y' && input.toLowerCase() != 'n');

    if (input.toLowerCase() == 'n') {

      print("You've played $len games");
      print(" ");
      for (int i = 0; i < len; i++) {
        print('🚀 Game # ${i + 1} : ${Game.myList[i]} guesses');
      }
      break;
    }
  }

  // end of program
}

void playGame() {
  stdout.write('Enter a maximum number to random : ');
  var input = stdin.readLineSync();
  var max = int.tryParse(input!);
  var game = Game(a: max!);
  var isCorrect = false;

  print('╔════════════════════════════════════════');
  print('║            GUESS THE NUMBER            ');
  print('╟────────────────────────────────────────');

  do {
    stdout.write('║ Guess the number between 1 and ${game.maxRandom}: ');
    var input = stdin.readLineSync();
    var guess = int.tryParse(input!);
    if (guess == null) {
      continue;
    }

    var result = game.doGuess(guess);

    if (result == 1) {
      print('║ ➜ $guess is TOO HIGH! ▲');
      print('╟────────────────────────────────────────');
    } else if (result == -1) {
      print('║ ➜ $guess is TOO LOW! ▼');
      print('╟────────────────────────────────────────');
    } else if (result == 0) {
      print('║ ➜ $guess is CORRECT ❤️, total guesses: ${game.guessCount}');
      print('╟────────────────────────────────────────');

      isCorrect = true;
    }
  } while (!isCorrect);

  print('║                 THE END                ');
  print('╚════════════════════════════════════════');
}