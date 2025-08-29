class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }
    
    var delimiterInfo = _extractDelimiterAndNumbers(numbers);
    String delimiter = delimiterInfo['delimiter']!;
    String numbersPart = delimiterInfo['numbers']!;
    
    List<int> parsedNumbers = _parseNumbers(numbersPart, delimiter);
    _validateNoNegativeNumbers(parsedNumbers);
    
    return parsedNumbers.fold(0, (sum, number) => sum + number);
  }
  
  Map<String, String> _extractDelimiterAndNumbers(String numbers) {
    String delimiter = ',';
    String numbersPart = numbers;
    
    // Check for custom delimiter
    if (numbers.startsWith('//')) {
      int newlineIndex = numbers.indexOf('\n');
      if (newlineIndex != -1) {
        delimiter = numbers.substring(2, newlineIndex);
        numbersPart = numbers.substring(newlineIndex + 1);
      }
    }
    
    return {'delimiter': delimiter, 'numbers': numbersPart};
  }
  
  List<int> _parseNumbers(String numbersPart, String delimiter) {
    // Replace newlines and custom delimiters with commas
    String normalizedNumbers = numbersPart.replaceAll('\n', ',');
    if (delimiter != ',') {
      normalizedNumbers = normalizedNumbers.replaceAll(delimiter, ',');
    }
    
    List<String> numberList = normalizedNumbers.split(',');
    List<int> parsedNumbers = [];
    
    for (String number in numberList) {
      if (number.trim().isNotEmpty) {
        parsedNumbers.add(int.parse(number.trim()));
      }
    }
    
    return parsedNumbers;
  }
  
  void _validateNoNegativeNumbers(List<int> numbers) {
    List<int> negativeNumbers = numbers.where((number) => number < 0).toList();
    
    if (negativeNumbers.isNotEmpty) {
      String negativeNumbersStr = negativeNumbers.join(', ');
      throw ArgumentError('negative numbers not allowed $negativeNumbersStr');
    }
  }
}
