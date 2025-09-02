class AppInfo {
  static const String appTitle = 'Post Creater';
  static const String welcomeTitle = 'Welcome to Post Creater';
  static const String signUp = 'SIGNUP';
  static const String signIn = 'SIGNIN';
  static const String enterEmail = 'Enter Your Email';
  static const String createPostTitle = 'CREATE NEW POST';
  static const String postTitle = 'Post Title';
  static const String postDesc = 'Post Description';
  static const String createPost = 'Create Post';
}
class GetStorageKeys {
  static const String authInfo = 'authInfo';
  static const String firstTime = "first_time";
  static const String credentials = "credentials";
  static const String languageCode = 'language_code';
  static const String countryCode = 'country_code';
}

class ImagePath {
  static const String assets = 'assets/';
  static const String welcomeLogo = '${assets}icons/chat.svg';
  static const String loginLogo = '${assets}icons/login.svg';
  static const String postLogo = '${assets}images/home_center.png';

}

class ValidationMessages {
  static const String emptyEmail = "Email cannot be empty";
  static const String username = "Username cannot be empty";
  static const String invalidEmail = "Please enter a valid email address";
  static const String emptyPassword = "Password cannot be empty";
  static const String shortPassword =
      "Password must be at least 6 characters long";
  static const String emptyConfirmPassword = "Confirm Password cannot be empty";
  static const String passwordMismatch = "Passwords do not match";
  static const String allRequired = "All fields are required";
}
class AppStrings {
  static const String username = 'Username';
  // static const String welcomeTitle = 'Welcome to Post Creater';
  // static const String signUp = 'SIGNUP';
  // static const String signIn = 'SIGNIN';
  // static const String enterEmail = 'Enter Your Email';
  // static const String createPostTitle = 'CREATE NEW POST';
  // static const String postTitle = 'Post Title';
  // static const String postDesc = 'Post Description';
  // static const String createPost = 'Create Post';
}
class ActionText {
  static const String signIn = "Sign In";
  static const String singUp = "Sign Up";
  static const String sendCode = "Send Code";
  static const String submit = "Submit";
  static const String submitReport = "Submit Report";
  static const String save = "Save";
  static const String resendCode = "Resend Code";
  static const String getStarted = "Get Started";
  static const String addVehicle = "Add Vehicle";
  static const String deleteVehicle = "Delete Vehicle";
  static const String next = "Next";
  static const String skip = "Skip";
  static const String logout = "Logout";

  static const String yes = "Yes";
  static const String no = "No";
  static const String cancel = "Cancel";
  static const String delete = "Delete";
  static const String edit = "Edit";
  static const String update = "Update";
}

class ToastMsg {
  static const String noInternetConnection = "No Internet Connection";
  static const String required = "* required";
  static const String pleaseWait = "Please Wait...";
  static const String unknownError =
      "The application has encountered an unknown error. Please check that your device is connected to the internet";
  static const String unableToConnect = "Unable to connect to the internet";
  static const String internalServerError = "Internal server error.";
  static const String internetNotAvailable = "Internet not available";
  static const String someThingWentWrong = "Something went wrong.";
  static const String charactersLimit = "Only 500 characters are allowed.";
  static const String checkNadraRecord =
      "Please wait our system validating your fingerprint from Nadra";
  static const String bioFailed =
      'Biometric verification failed. Please try again.';
  static const String validCNICHint = "Enter Valid CNIC Without (-) Dashes";
  static const String validMobileNoHint = "Enter Valid Mobile Number";
  static const String selectRegionHint = "Select Region";
  static const String validUsernameHint = "Enter Valid Username";
  static const String validPassHint = "Enter Valid Password";
  static const String linkError = "Unable to launch url";
}
class ErrorCode {
  static const String connectionAbort = "Software caused connection abort";
  static const String failedHost = "Failed host lookup";
  static const String invalidHtml = "<!DOCTYPE html>";
  static const String unexpectedError = "Unexpected error";
  static const String validationError = "Validation error";
  static const String serverError = "Server error";
  static const String failedToParseResponse = "Failed to parse response";
  static const String invalidHTTPMethod = "Invalid HTTP method";
  static const String unAuthorizedAccess =
      "Unauthorized access. Please login again.";
}
