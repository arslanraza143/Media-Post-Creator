import 'package:frontend/Core/Network/api_client.dart';
import 'package:frontend/Core/Utils/log_util.dart' show Log;
import 'package:frontend/Model/Login/login_req.dart';
import 'package:frontend/Model/Login/login_res.dart';
import 'package:frontend/Model/SignUp/signup_req_model.dart';
import 'package:frontend/Model/SignUp/signup_res_model.dart';
import 'package:http/http.dart' as http;

class AuthRepo extends ApiClient {
  Future<LoginResModel> login({LoginReqModel? model}) async {
    try {
      var response = await post("auth/login", body: model?.toJson());
      LoginResModel loginResModel;

      if (response.data != null) {
        loginResModel = LoginResModel.fromJson(response.data);
      } else {
        throw http.ClientException(response.message!);
      }
      return loginResModel;
    } catch (e) {
      Log.e('login: Auth Repo- ', e.toString());
      rethrow;
    }
  }

  Future<SignUpResModel> signUp({SignUpReqModel? model}) async {
    try {
      var response = await post("users/add", body: model?.toJson());
      SignUpResModel signUpResModel;

      if (response.data != null) {
        signUpResModel = SignUpResModel.fromJson(response.data);
      } else {
        throw http.ClientException(response.message!);
      }
      return signUpResModel;
    } catch (e) {
      Log.e('signUp: signUpResModel- ', e.toString());
      rethrow;
    }
  }

}
