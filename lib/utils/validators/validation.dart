class PValidator {
  // EMPTY TEXT VALIDATION
  static String? validateEmptyText(String? firstName, String? value) {
    if (value == null || value.isEmpty) {
      return '$firstName is required';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    // regular expression for email valiation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'invalid email address';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'password is required';
    }

    // check for minimum password length
    if (value.length < 6) {
      return 'password must be at least 6 characters long';
    }

    // check for uppercase character
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'password must contain atleast one uppercase letter';
    }

    // check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain atleast one number';
    }

    // check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*()<>?:{}<>]'))) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    // Regular expression for validating phone number (assuming a 10-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{11}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (11 digits required)';
    }

    return null;
  }
}
