import 'dart:io';
void main() {
  double num_1 , num_2;
  String operation;
  
  while(true){
    try{
      print("Введите выражение");
      num_1 = double.parse(stdin.readLineSync()!);
      break;
    } on FormatException{
      print("Вы не ввели номер");

    }
  }
  while(true){
    try{
      print("Введите другое выражение");
      num_2 = double.parse(stdin.readLineSync()!);
      break;
    } on FormatException{
      print("Вы не ввели номер");

    }
  }

  while(true){
    print("Выберите операцию : + , - , * , /");
    operation = stdin.readLineSync()!;
  
    if (operation == "+" || operation == "-" ||  operation == "*" ||  operation == "/"){
      break;
    }else{
      print("Такого символа нет ");
    }
}
// результат 
switch(operation){
  case "+":{
    print("$num_1 + $num_2 = ${num_1 + num_2}.");

  }
  break;

  case "-":{
    print("$num_1 - $num_2 = ${num_1 - num_2}.");

  }
  break;

  case "*":{
    print("$num_1 * $num_2 = ${num_1 * num_2}.");

  }
  break;

  case "/":{
    print("$num_1 / $num_2 = ${num_1 / num_2}.");

  }
  break;
  default:{
    print("Ошибка");

  }
  break;
}
}

