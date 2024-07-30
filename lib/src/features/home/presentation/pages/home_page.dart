import 'package:era_pro_applicationlication/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: context.displayLarge,
        ),
      ),
    );
  }
}
