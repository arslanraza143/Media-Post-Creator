import 'package:flutter/material.dart';
import 'package:frontend/Core/Common/Widgets/base_scaffold.dart';
import 'package:frontend/View/Auth/Login/components/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body(),);
  }
}
  