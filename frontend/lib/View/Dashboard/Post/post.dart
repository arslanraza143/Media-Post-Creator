import 'package:flutter/material.dart';
import 'package:frontend/Controller/Other/Dashboard/main_controller.dart';
import 'package:frontend/Core/Common/Widgets/base_scaffold.dart';
import 'package:frontend/Core/Common/Widgets/post_cart.dart';
import 'package:frontend/Core/Common/Widgets/toasts.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class Post extends GetView<MainController> {
  const Post({super.key});
  @override
  Widget build(BuildContext context) {
    return
    //Scaffold(body: Body(),);
    BaseScaffold(
      appBarTitle: "Post Screen",
      body: Column(
        children: [
          // ElevatedButton(
          //   onPressed: controller.getAllPosts,
          //   child: Text("Get Posts"),
          // ),
          Expanded(
            child: Obx(() {
              print("Post count: ${controller.allPostList.length}");
              print("Post data: ${controller.allPostList.map((e) => e.name)}");

              if(controller.isPostLoading.value){
                return Center(child: CircularProgressIndicator());
              }if(controller.allPostList.isEmpty){
                return Center(child: Text("No Post Available", style: TextStyle(color: Colors.white),));
              }
              return ListView.builder(
                itemCount: controller.allPostList.length,
                itemBuilder: (context, index) {
                  //final post = controller.allPostList[index];
                  final post = controller.allPostList[index];
                  return PostCard(
                    name: post.name,
                    //profileImageUrl: controller.allPostList[index].user?.profileImage,
                    //postImageUrl: controller.allPostList[index].image,
                    likesCount: post.reactions?.likes,
                    disLikesCount: post.reactions?.dislikes,
                    viewsCount: post.views,
                    description: post.body,
                    commentsCount: (post.views ?? 0) + 1,
                    isLiked: post.isLiked,
                    onLikedPress: () {
                      post.isLiked.toggle();
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
