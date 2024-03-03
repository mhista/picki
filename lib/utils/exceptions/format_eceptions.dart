// CUSTOM EXCEPTION CLASS TO HANLDE VARIOUS FORMAT-RELATED  ERRORS
class KFormatExceptions implements Exception {
  // the errror code associated with the exception
  final String message;

  // Default constructot with a generic message
  const KFormatExceptions(
      [this.message =
          'An unexpected format error occurred. Please check your input.']);

  factory KFormatExceptions.fromMessage(String message) {
    return KFormatExceptions(message);
  }
  // get the corresponding error message
  String get formattedMessage => message;
  factory KFormatExceptions.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const KFormatExceptions(
            'The email address format is invalid. Please enter a valid email');

      case 'invalid-phone-number-format':
        return const KFormatExceptions(
            'The provided phone nunmber format is invalid. Please enter a valid number');
      case 'invalid-date-format':
        return const KFormatExceptions(
            'The date format is invalid. Please enter a valid date');
      case 'invalid-url-format':
        return const KFormatExceptions(
            'The URL format is invalid. Please enter a valid URL');
      case 'invalid-credit-card-format':
        return const KFormatExceptions(
            'The credit card format is invalid. PLease enter a valid credit card number');
      case 'invalid numeric-format':
        return const KFormatExceptions(
            'The input should be a valid numeric format');

      default:
        return const KFormatExceptions(
            'Invalid format. please use corrrect formatting');
    }
  }
}
