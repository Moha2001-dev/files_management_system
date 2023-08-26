///A method used to convert between arabic and english numbers
String? engNumberToFarsi(String? searchText) {
  String? number = searchText;
  Map numbers = {
    '٠' : '0',
    '١' : '1',
    '٢' : '2',
    '٣' : '3',
    '٤' : '4',
    '٥' : '5',
    '٦' : '6',
    '٧' : '7',
    '٨' : '8',
    '٩' : '9',
  };

  numbers.forEach((key, value) => number = number?.replaceAll(key, value));

  return number;
}