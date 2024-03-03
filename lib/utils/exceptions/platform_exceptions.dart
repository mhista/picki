// CUSTOM EXCEPTION CLASS TO HANLDE ALL FIREBASE AUTHENTICATION ERRORS
class KPlatformException implements Exception {
  // the errror code associated with the exception
  final String code;

  // Constructor that takes an error code
  KPlatformException(this.code);

  // get the error message that corresponds to the errror code
  String get message {
    switch (code) {
      case 'INVALID-LOGIN-CREDENTIALS':
        return 'Invalid login credentials. Please double-check your information';
      case 'too-many-requests':
        return 'Too many requests. Please try again later';
      case 'invlid-argument':
        return 'Invalid argument provided to the authentication method';
      case 'invalid-password':
        return 'Incorrect password. Please try again';
      case 'invalid-phone-number':
        return 'The provided phone number is invalid';
      case 'operation-not -allowed':
        return 'The sign-in provider is disabled for your firebase project';
      case 'session-cookie-expired':
        return 'The firebase session cookie has expired. Pleae';
      case 'uid-already-exists':
        return 'The provided User ID is already in use by another user';
      case 'sign_in_failed':
        return 'Sign in failed. Please try again';
      case 'network-request-failed':
        return 'Network request failed. Please check your internet connection';
      case 'internal-error':
        return 'Internal error. Please try again later';
      case 'invalid-verification-code':
        return 'Invalid verification code. PLease enter a valid code';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Please log in again';
      case 'app-not-authorized':
        return 'The app is not authorized to use Firebase Authentication with the provided API key';
      case 'missing-multi-factor-session':
        return 'The request is missing proof of first factor successful sign-in';
      case 'missing-multi-factor-info':
        return 'The request is missing proof of first factor successful sign-in';
      case 'invalid-multi-factor-session':
        return 'The request does not contain valid proof of successful first factor sign-in';
      case 'multi-factor-info-not-found':
        return 'No second factor matching the identifier provided';
      case 'second-factor-required':
        return 'proof of owneership required to complete sign-in';
      case 'email-change-needs-verification':
        return 'please provide a verified email';
      case 'missing-phone-number':
        return 'please provide a phone number';

      case 'invalid-verification-id':
        return 'invalid verification ID. Please request a new verification code';
      case 'quota exceeded':
        return 'Quota exceeded. please try again later';
      case 'missing-verification-code':
        return 'Please provide a valid verification code';
      case 'missing-verification-id':
        return 'Please provide a valid verification ID';

      case 'keychain-error':
        return 'A keychain error occurred. Please check the keychain and try again';

      default:
        return 'error occurred, please retry';
    }
  }
}
