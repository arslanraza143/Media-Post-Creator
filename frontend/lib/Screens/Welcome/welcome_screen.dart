import 'package:flutter/material.dart';
import 'package:frontend/Screens/Welcome/Components/body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body());
  }
}