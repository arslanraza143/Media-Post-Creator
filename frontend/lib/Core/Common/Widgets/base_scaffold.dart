import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/Controller/Other/connection_manager_controller.dart';
import 'package:frontend/Core/Common/Widgets/no_internet_widget.dart';
import 'package:get/get.dart';

class BaseScaffold extends StatelessWidget {
  final String appBarTitle;
  final bool centerTitle;
  final Widget body;
  final EdgeInsets padding;

  BaseScaffold({
    super.key,
    this.appBarTitle = '',
    this.centerTitle = true,
    required this.body,
    this.padding = const EdgeInsets.all(16),
  });
  final ConnectionManagerController connectionManagerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar:
          appBarTitle.isNotEmpty
              ? AppBar(title: Text(appBarTitle), centerTitle: centerTitle)
              : null,
      body: SafeArea(
        child: Obx(() {
          return Column(
            children: [
              Expanded(
                child: Padding(padding: padding.w, child: body),
              ),
              if (!connectionManagerController.isConnected.value)
                NoInternetWidget(),
            ],
          );
        }),
      ),
    );
  }
}
