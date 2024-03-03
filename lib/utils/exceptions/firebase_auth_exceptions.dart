// CUSTOM EXCEPTION CLASS TO HANLDE ALL FIREBASE AUTHENTICATION ERRORS
class KFirebaseAuthException implements Exception {
  // the errror code associated with the exception
  final String code;

  // Constructor that takes an error code
  KFirebaseAuthException(this.code);

  // get the error message that corresponds to the errror code
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email is already registered. Please use a different email';
      case 'invalid-email':
        return 'The email address provide is invalid. Please enter a valid email';
      case 'weak-passsword':
        return 'The passwoord is too weak. Please choose a stronger password';
      case 'user-disabled':
        return 'This account has been disabled. Please contact support for assistance';
      case 'user-not-found':
        return 'Invalid login details';
      case 'wrong-password':
        return 'Incorrect password. Please check your passsword and try again';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code';
      case 'invalid-verification-id':
        return 'invalid verification ID. Please request a new verification code';
      case 'quota exceeded':
        return 'Quota exceeded. please try again later';
      case 'email-already-exists':
        return 'The email is already in use. Please use a different email';
      case 'provider-already-linked':
        return 'The account is already linked with another provider';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Please log in again';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account';
      case 'user-mismatch':
        return 'The supplied credentials doo not correspond to the previously signed in user';
      case 'acccount-exists-with-different-credential':
        return 'An account already exists with the same email but different sign-in credentials';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Contact support for assistance';
      case 'expired-action-code':
        return 'The action code has expired. Please request a new action code';
      case 'invalid-action-code':
        return 'The action code is invalid. Please check the code and try again';
      case 'missing-action-code':
        return 'The action code is missing. Please provide a valid action code';
      case 'user-token-expired':
        return 'The user\'s token has expired, and authentication is required. please sign in again';
      case 'invalid-credential':
        return 'The supplied credential is invalid or expired';
      case 'user-token-revoked':
        return 'The User\'s token has been revoked. Please sign in again';
      case 'invalid-message-payload':
        return 'The email template verification message payload is invalid';
      case 'invalid-sender':
        return 'The email template sender is invalid. Please verify the sender\'s email';
      case 'invalid-recipient-email':
        return 'The recipient email address is invalid. Please provide a valid recipient email';
      case 'missing-iframe-start':
        return 'The email template is missing the iframe start tag';
      case 'missing-iframe-end':
        return 'The email template is missing the iframe end tag';
      case 'missing-iframe-src':
        return 'The email template is missing the iframe src tag';
      case 'auth-domain-config-required':
        return 'The authDomain configuration is required for the action code verification lin';
      case 'missing-app-credential  ':
        return 'The app credential is missing. PLease provide valid app credential';
      case 'session-cookie-expired':
        return 'The firebase session cookie has expired. Please sign in again';
      case 'ui-already-exists':
        return 'The provided user ID is already in use by another user';
      case 'web-storage-unsupported':
        return 'Web storage is not supported or is disabled';
      case 'app-deleted':
        return 'This instance of FirebaseApp has been deleted';
      case 'user-token-mismatch':
        return 'The provided user\'s token has a mismatch with the authenticated user\'s user ID';
      case 'INIVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials';

      default:
        return ' An unexpected Authentication error occurred. Please try again';
    }
  }
}
