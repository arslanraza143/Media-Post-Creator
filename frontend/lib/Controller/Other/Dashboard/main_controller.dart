import 'package:flutter/material.dart';
import 'package:frontend/Controller/Auth/auth_controller.dart';
import 'package:frontend/Core/Utils/log_util.dart';
import 'package:frontend/Model/Others/all_post_res_model.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  //var isPasswordVisible = false.obs;
  //var isRememberMe = true.obs;
  var showError = false.obs;
  RxBool isLiked = false.obs;
    RxBool isPostLoading = false.obs;

  final postTitleController = TextEditingController();
  final postDescController = TextEditingController();
  AuthController? authController;

  RxList<Posts> allPostList = <Posts>[].obs;

  // final List<Posts> dummyPosts = List.generate(
  //   3,
  //   (index) => Posts(
  //     id: index,
  //     title: 'Post Title $index',
  //     name: 'User ${index + 1}',
  //     body: 'This is the body of post $index.',
  //     tags: ['tag1', 'tag2'],
  //     reactions: Reactions(likes: 100 + index, dislikes: 5),
  //     views: 300 + index * 5,
  //     userId: index + 1,
  //   ),
  // );

  @override
  void onInit() {
    authController = Get.find<AuthController>();
    getAllPosts();
    super.onInit();
  }

  void createPost() {
    if (postTitleController.text.isEmpty || postDescController.text.isEmpty) {
      showError.value = true;
    } else {
      print('Post created');
    }
  }

  Future<void> getAllPosts() async {
    try {
      isPostLoading.value = true;
      if (authController == null) {
      Log.e("MainController", "authController is null");
      print("MainController Auth Controller is null");
      return;
    }
      final getPostResponse = await authController!.getPosts();
      if (getPostResponse != null && getPostResponse.posts != null) {
        allPostList.value = getPostResponse.posts!;
        // isPostLoading.value = false;
        print(allPostList[1].body);
        print("Posts data: ${allPostList.map((e) => e.tags)}");
      }
    } catch (e) {
      Log.d("getAllPosts - getPostResponse", e.toString());
    } finally {
      isPostLoading.value = false;
    }
  }

//   Future<void> getAllPosts() async {
//   try {
//     isPostLoading.value = true;

//     if (authController == null) {
//       Log.e("MainController", "authController is null");
//       print("MainController Auth Controller is null");
//       return;
//     }

//     print("MainController Auth Controller is NOT null");

//     final getPostResponse = await authController!.getPosts();
//     print("getPostResponse: $getPostResponse");

//     if (getPostResponse != null && getPostResponse.posts != null) {
//       allPostList.value = getPostResponse.posts!;
//       print("Posts loaded: ${allPostList.length}");
//     } else {
//       print("No posts found");
//     }

//   } catch (e) {
//     print("Exception in getAllPosts: $e");
//   } finally {
//     isPostLoading.value = false;
//     print("Finished getAllPosts");
//   }
// }

  // void likePost() {
  //   //isLiked.value = !isLiked.value;
  //   allPostList = !post.isLiked.value;
  // }
}
