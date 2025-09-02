import 'package:frontend/Core/Common/Widgets/toasts.dart';
import 'package:frontend/Core/Network/api_client.dart';
import 'package:frontend/Core/Utils/app_colors.dart';
import 'package:frontend/Core/Utils/log_util.dart' show Log;
import 'package:frontend/Model/Others/all_post_res_model.dart';
import 'package:http/http.dart' as http;

class PostRepo extends ApiClient {
  Future<AllPostResModel?> getPosts() async {
    try {
      var response = await get("posts");
      
      AllPostResModel? allPostResModel;
      //print("Post Repo: ${response.statusCode}");
      if (response.data != null) {
        allPostResModel = AllPostResModel.fromJson(response.data);
        ToastAndDialog.showCustomSnackBar(
          response.message ?? "Posts fetched successfully",
          textColor: AppColors.primary
        );
      } else if (response.data == null) {
        ToastAndDialog.showCustomSnackBar(
          response.message ?? "Something went wrong",
        );
      } else {
        throw http.ClientException(response.message!);
      }
      return allPostResModel;
    } catch (e) {
      Log.e('getPosts: allPostResModel- ', e.toString());
      rethrow;
    }
  }
}
