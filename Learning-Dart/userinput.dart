import 'dart:io';

void main(){
  print("Enter your name");

  // only input taken is string
  var name = stdin.readLineSync();

  print("Hello $name");
}