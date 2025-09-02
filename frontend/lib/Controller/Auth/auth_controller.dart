import 'package:frontend/Controller/Auth/login_controller.dart';
import 'package:frontend/Controller/Auth/signup_controller.dart';
import 'package:frontend/Core/Common/Widgets/toasts.dart';
import 'package:frontend/Core/Constants/app_strings.dart';
import 'package:frontend/Core/Routes/app_routes.dart';
import 'package:frontend/Core/Utils/log_util.dart';
import 'package:frontend/Model/Login/login_req.dart';
import 'package:frontend/Model/Login/login_res.dart';
import 'package:frontend/Model/Others/all_post_res_model.dart';
import 'package:frontend/Model/SignUp/signup_req_model.dart';
import 'package:frontend/Model/SignUp/signup_res_model.dart';
import 'package:frontend/Repository/auth_repo.dart';
import 'package:frontend/Repository/post_repo.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

class AuthController extends GetxController {
  final RxBool isLoggedIn = false.obs;
  AuthRepo? _authRepo;
  PostRepo? _postRepo;
  GetStorage? _storage;
  // LoginResModel? _resModelInfo;
  LoginResModel? authInfo;
  SignUpResModel? signUpInfo;

  String? get accessToken {
    return (authInfo != null &&
            authInfo!.accessToken != null &&
            authInfo!.accessToken!.isNotEmpty)
        ? authInfo!.accessToken
        : null;
  }

  @override
  void onInit() {
    _storage = GetStorage();
    _authRepo = AuthRepo();
    _postRepo = PostRepo();
    _autoLogin();
    listenAuthLogin();
    super.onInit();
  }

  Future<void> _autoLogin() async {
    try {
      Map<String, dynamic>? userData;
      userData = _storage!.read(GetStorageKeys.authInfo);
      if (userData != null && userData.isNotEmpty) {
        //print("userData: $userData");
        authInfo = LoginResModel.fromJson(userData);
        if (authInfo != null) {
          isLoggedIn.value = true;
          print("AUTH TOKEN: - ${authInfo!.toJson().toString()}");
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void listenAuthLogin() {
    try {
      _storage!.listenKey(GetStorageKeys.authInfo, (userData) {
        if (userData != null) {
          authInfo = LoginResModel.fromJson(userData);
          if (authInfo != null) {
            if (!isLoggedIn.value) {
              isLoggedIn.value = true;
              Get.offAllNamed(AppRoutes.dashboardScreen);
            }
          } else {
            userData = null;
          }
        }
        if (userData == null) {
          Get.offAllNamed(AppRoutes.loginScreen);
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<LoginResModel?> login({
    required String username,
    required String password,
  }) async {
    try {
      ToastAndDialog.progressIndicator();
      LoginReqModel loginReqModel = LoginReqModel();

      loginReqModel.username = username;
      loginReqModel.password = password;
      authInfo = await _authRepo?.login(model: loginReqModel);

      Get.back();
      return authInfo;
    } catch (e) {
      if (Get.isDialogOpen!) {
        Get.back();
      }
      if (e is ClientException) {
        print(e.message);
      } else {
        print(e.toString());
      }
      return null;
    }
  }

  Future<AllPostResModel?> getPosts() async {
    try {
      AllPostResModel? result;
      //print("getPosts - Auth Controller: Fetching posts...");
      result = await _postRepo?.getPosts();
      //print("getPosts - result: $result");
      return result;
    } catch (e) {
      Log.e("getPosts _ Auth Controller", "$e");
    }
    return null;
  }

  Future<SignUpResModel?> singUp({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      ToastAndDialog.progressIndicator();
      SignUpReqModel signUpReqModel = SignUpReqModel();

      signUpReqModel.username = username;
      signUpReqModel.password = password;
      signUpReqModel.email = email;
      signUpInfo = await _authRepo?.signUp(model: signUpReqModel);

      Get.back();
      return signUpInfo;
    } catch (e) {
      if (Get.isDialogOpen!) {
        Get.back();
      }
      if (e is ClientException) {
        print(e.message);
      } else {
        print(e.toString());
      }
      return null;
    }
  }

  Future<void> logout({bool justToClear = true}) async {
    try {
      //ToastAndDialog.showCustomSnackBar("Logging out...");
      var firstTime = _storage?.read(GetStorageKeys.firstTime);
      authInfo = null;
      //print("authInfo: $authInfo");
      isLoggedIn.value = false;
      await _storage?.erase();
      await _storage?.write(GetStorageKeys.firstTime, true);
      await Get.delete<LoginController>();
      await Get.delete<SignupController>();
      if (justToClear) {
        await _storage!.write(GetStorageKeys.authInfo, null);
      }

      // Get.back();
    } catch (e) {
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
      Log.d("Logout: -", e.toString());
      ToastAndDialog.errorDialog(e);
    }
    // finally {
    //   Get.back();
    // }
  }
}
