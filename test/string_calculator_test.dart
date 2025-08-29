import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator/calculator/string_calculator.dart';

void main() {
  late StringCalculator calculator;

  setUp(() {
    calculator = StringCalculator();
  });

  group('String Calculator', () {
    test('should return 0 for an empty string', () {
      expect(calculator.add(""), equals(0));
    });

    test('should return the number for a single number', () {
      expect(calculator.add("1"), equals(1));
    });

    test('should return sum for two comma-separated numbers', () {
      expect(calculator.add("1,5"), equals(6));
    });

    test('should handle any amount of numbers', () {
      expect(calculator.add("1,2,3,4,5"), equals(15));
    });

    test('should handle new lines between numbers', () {
      expect(calculator.add("1\n2,3"), equals(6));
    });

    test('should support different delimiters', () {
      expect(calculator.add("//;\n1;2"), equals(3));
    });

    test('should support different delimiters with multiple numbers', () {
      expect(calculator.add("//*\n1*2*3"), equals(6));
    });

    test('should throw exception for negative numbers', () {
      expect(
        () => calculator.add("1,-2,3"),
        throwsA(
          predicate(
            (e) => e.toString().contains('negative numbers not allowed -2'),
          ),
        ),
      );
    });

    test('should show all negative numbers in exception message', () {
      expect(
        () => calculator.add("1,-2,-3,4"),
        throwsA(
          predicate(
            (e) => e.toString().contains('negative numbers not allowed -2, -3'),
          ),
        ),
      );
    });
  });
}
