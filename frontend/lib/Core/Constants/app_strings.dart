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

class ImagePath {
  static const String assets = 'assets/';
  static const String welcomeLogo = '${assets}icons/chat.svg';
  static const String loginLogo = '${assets}icons/login.svg';
  static const String postLogo = '${assets}images/home_center.png';

}

class ValidationMessages {
  static const String emptyEmail = "Email cannot be empty";
  static const String invalidEmail = "Please enter a valid email address";
  static const String emptyPassword = "Password cannot be empty";
  static const String shortPassword =
      "Password must be at least 6 characters long";
  static const String emptyConfirmPassword = "Confirm Password cannot be empty";
  static const String passwordMismatch = "Passwords do not match";
  static const String allRequired = "All fields are required";
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
