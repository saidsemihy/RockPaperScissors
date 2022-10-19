import "dart:io";
import "dart:math";


enum selection { rock, paper, scissors }

int gamer = 0;
int computer = 0;
bool situation = true;
var vote;

void main(List<String> args) {
  do {
    while (gamer != 3 && computer != 3) {
      characterControl(situation);
      dynamic rndNumber = Random().nextInt(3);

      String choice = rndCheck(rndNumber);

      print("choice: $choice");

      winCheck(vote, choice);
    }
    gameOver(gamer, computer);

    situation = playAgain(situation);
  } while (situation);
}

String rndCheck(var rndNumber) {
  if (rndNumber == 0) {
    return selection.rock.name;
  } else if (rndNumber == 1) {
    return selection.paper.name;
  } else {
    return selection.scissors.name;
  }
}

void winCheck(var vote, String choice) {
  if (vote == selection.rock.name && choice == selection.rock.name) {
    print("Draw | No score|Draw | No score");
  } else if (vote == selection.rock.name && choice == selection.paper.name) {
    computer++;
    print("Computer scored! Gamer: $gamer Computer: $computer");
  } else if (vote == selection.rock.name && choice == selection.scissors.name) {
    gamer++;
    print("Player score! Gamer: $gamer Computer: $computer");
  } else if (vote == selection.paper.name && choice == selection.paper.name) {
    print("Draw | No score-Draw | No score");
  } else if (vote == selection.paper.name && choice == selection.rock.name) {
    gamer++;
    print("Player score! Gamer: $gamer Computer: $computer");
  } else if (vote == selection.paper.name &&
      choice == selection.scissors.name) {
    computer++;
    print("Computer scored! Gamer: $gamer Computer: $computer");
  } else if (vote == selection.scissors.name &&
      choice == selection.scissors.name) {
    print("Draw | No score-Draw | No score");
  } else if (vote == selection.scissors.name && choice == selection.rock.name) {
    computer++;
    print("Computer scored! Gamer: $gamer Computer: $computer");
  } else if (vote == selection.scissors.name &&
      choice == selection.paper.name) {
    gamer++;
    print("Player score! Gamer: $gamer Computer: $computer");
  }
  situation = true;
}

void characterControl(bool situation) {
  while (situation) {
    print("Rock-Paper-Scissors Choose: ");
    vote = stdin.readLineSync()!.toLowerCase();
    if (vote != "rock" && vote != "paper" && vote != "scissors") {
      situation = true;
      print("Please enter the correct word! Do not use Turkish characters!");
    } else {
      situation = false;
      break;
    }
  }
}

void gameOver(int gamer, int computer) {
  print("Game over");
  if (gamer > computer) {
    print("Player won!");
    print("Result, Gamer: $gamer Computer: $computer");
  } else if (computer > gamer) {
    print("Computer Won!");
    print("Result, Gamer: $gamer Computer: $computer");
  } else {
    print("Draw! Result, Gamer: $gamer Computer: $computer");
  }
}

bool playAgain(bool situation) {
  print("Do you want to play again? Yes | No");
  var tercih = stdin.readLineSync()!.toLowerCase();
  if (tercih == "yes") {
    situation = true;
    gamer = 0;
    computer = 0;
    return situation;
  } else {
    situation = false;
    return situation;
  }
}
