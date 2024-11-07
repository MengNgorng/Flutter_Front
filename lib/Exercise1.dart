import 'dart:io';

void main() {
  print('Enter String: ');
  String? input = stdin.readLineSync();

  if (input != null) {
    Map<String, int> result = countCharacters(input);
    print('-----------------------------------------------');
    print('Char Count: ');
    result.forEach((char, count) {
      print('$char: $count');
    });
  } else {
    print('No input provided.');
  }
}

Map<String, int> countCharacters(String text) {
  Map<String, int> charCount = {};


  for (int i = 0; i < text.length; i++) {
    String char = text[i];
    if (char != ' ') {
      if (charCount.containsKey(char)) {
        charCount[char] = charCount[char]! + 1;
      } else {
        charCount[char] = 1;
      }
    }
  }

  return charCount;
}


void exampleUsage() {
  String exampleText = "hello world";
  Map<String, int> charCountMap = countCharacters(exampleText);
  print(charCountMap);
}
