# String Calculator TDD Kata

## Overview
This project implements the String Calculator TDD Kata using Dart and Flutter. The implementation follows Test-Driven Development (TDD) principles, where tests are written first, followed by the minimal implementation to make them pass, and then refactoring.

## Features Implemented

### 1. Basic Addition
- **Empty String**: Returns 0 for empty input
- **Single Number**: Returns the number itself
- **Two Numbers**: Returns the sum of comma-separated numbers

### 2. Multiple Numbers
- Handles any amount of comma-separated numbers
- Example: `"1,2,3,4,5"` returns `15`

### 3. Newline Support
- Supports newlines as delimiters alongside commas
- Example: `"1\n2,3"` returns `6`

### 4. Custom Delimiters
- Supports custom delimiters specified in the format `//[delimiter]\n[numbers]`
- Example: `"//;\n1;2"` returns `3`
- Example: `"//*\n1*2*3"` returns `6`

### 5. Negative Number Validation
- Throws an exception for negative numbers
- Shows all negative numbers in the exception message
- Example: `"1,-2,-3,4"` throws `"negative numbers not allowed -2, -3"`

## Implementation Details

### StringCalculator Class
The main class contains:
- `add(String numbers)`: Main method that processes the input and returns the sum
- `_extractDelimiterAndNumbers()`: Extracts custom delimiter and numbers part
- `_parseNumbers()`: Parses and normalizes numbers with different delimiters
- `_validateNoNegativeNumbers()`: Validates that no negative numbers are present

### Code Structure
The implementation is well-structured with:
- Clear separation of concerns
- Private helper methods for specific responsibilities
- Proper error handling for negative numbers
- Clean and readable code

## TDD Process Followed

1. **Red**: Write a failing test
2. **Green**: Write minimal code to make the test pass
3. **Refactor**: Improve the code while keeping tests green
4. **Commit**: Commit changes after each successful iteration

## Test Cases

1. Empty string returns 0
2. Single number returns itself
3. Two comma-separated numbers return their sum
4. Any amount of numbers are handled
5. Newlines between numbers are supported
6. Custom delimiters are supported
7. Multiple numbers with custom delimiters work
8. Single negative number throws exception
9. Multiple negative numbers show all in exception

## Running the Tests

```bash
flutter test test/string_calculator_test.dart
```

## Key Learnings

- **TDD Discipline**: Each feature was implemented incrementally with tests first
- **Simple Solutions**: Always implemented the simplest solution that made tests pass
- **Refactoring**: Code was continuously improved while maintaining test coverage
- **Error Handling**: Proper exception handling for edge cases like negative numbers

## Repository Structure

```
lib/
  calculator/
    string_calculator.dart    # Main implementation
test/
  string_calculator_test.dart # All test cases
```

This implementation demonstrates clean code principles, proper TDD methodology, and comprehensive test coverage for all requirements of the String Calculator kata.
