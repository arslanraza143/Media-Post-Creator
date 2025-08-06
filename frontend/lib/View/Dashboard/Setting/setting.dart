import 'package:flutter/material.dart';
import 'package:frontend/View/Dashboard/Main/Components/background.dart';
import 'package:frontend/Core/Common/Widgets/custom_headin_text.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CustomHeadingText(title: 'Setting'),
        
        ]),
    );
  }
}