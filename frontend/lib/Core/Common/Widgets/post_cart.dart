import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/Controller/Other/Dashboard/main_controller.dart';
import 'package:frontend/Core/Constants/app_strings.dart';
import 'package:get/get.dart';

class PostCard extends GetView<MainController> {
  //final Posts post;
  final String? name;
  final String? profileImageUrl;
  final String? postImageUrl;
  final int? likesCount;
  final int? disLikesCount;
  final String? description;
  final int? commentsCount;
  final int? viewsCount;
  final RxBool? isLiked;
  final VoidCallback? onLikedPress;
  const PostCard({
    super.key,
    this.name = "Arslan Raza",
    this.profileImageUrl = ImagePath.postLogo,
    this.postImageUrl = ImagePath.postLogo,
    this.likesCount = 12542,
    this.disLikesCount = 12542,
    this.viewsCount,
    this.description = "This is post for testing purpose only",
    this.commentsCount = 123,
    this.isLiked,
    this.onLikedPress
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //border: Border.all(color: Colors.grey.shade800),
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.r),
      ),
      margin: EdgeInsets.symmetric(vertical: 10.h),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top: Profile Row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18.r,
                  backgroundImage: AssetImage(
                    profileImageUrl != null
                        ? profileImageUrl!
                        : ImagePath.postLogo,
                  ), // or NetworkImage
                ),
                SizedBox(width: 10.w),
                Text(
                  name != null ? name! : "Arslan Raza",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Icon(Icons.more_vert, color: Colors.white, size: 20.r),
              ],
            ),
          ),

          // Post Image
          Container(
            width: double.infinity,
            height: 300.h,
            color: Colors.grey[800],
            child: Image.asset(
              postImageUrl != null
                  ? postImageUrl!
                  : ImagePath.postLogo, // Replace with your image
              fit: BoxFit.cover,
            ),
          ),

          // Action Icons
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            child: Row(
              children: [
                Obx(()=> IconButton(
                    icon: Icon(
                      isLiked!.value ? Icons.favorite : Icons.favorite_border,
                      color: isLiked!.value ? Colors.red : Colors.white,
                      size: 24.r,
                    ),
                    //Icons.favorite_border, color: Colors.white, size: 24.r),
                    onPressed: onLikedPress,
                  ),),
                // SizedBox(width: 15.w),
                IconButton(
                  icon: Icon(
                    Icons.mode_comment_outlined,
                    color: Colors.white,
                    size: 24.r,
                  ),
                  onPressed: () {
                    // Handle like action
                  },
                ),

                IconButton(
                  icon: Icon(
                    Icons.send_outlined,
                    color: Colors.white,
                    size: 24.r,
                  ),
                  onPressed: () {
                    // Handle like action
                  },
                ),
                const Spacer(),
                Icon(Icons.bookmark_border, color: Colors.white, size: 24.r),
              ],
            ),
          ),

          // Likes count
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              likesCount != null ? "$likesCount likes" : "12542 likes",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(height: 6.h),

          // Description
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              description != null
                  ? ("$description")
                  : "This is post for testing purpose only",
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
            ),
          ),
          SizedBox(height: 6.h),

          // View Comments
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              commentsCount != null
                  ? "View all $commentsCount comments"
                  : "View all 123 comments",
              style: TextStyle(color: Colors.grey[400], fontSize: 13.sp),
            ),
          ),
          SizedBox(height: 6.h),

          // Comment Input
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 14.r,
                  backgroundImage: const AssetImage(ImagePath.postLogo),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.grey[400], fontSize: 13.sp),
                    decoration: InputDecoration(
                      hintText: "Add a comment...",
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey[400]),

                      //"Add a comment...",
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.send_outlined,
                    color: Colors.white,
                    size: 24.r,
                  ),
                  onPressed: () {
                    // Handle like action
                  },
                ),
                Text("❤️ 🙌", style: TextStyle(fontSize: 14.sp)),
              ],
            ),
          ),
          SizedBox(height: 10.h),

          // Time stamp
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              disLikesCount != null
                  ? ("$disLikesCount days ago")
                  : "6 days ago",
              style: TextStyle(color: Colors.grey[600], fontSize: 11.sp),
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
