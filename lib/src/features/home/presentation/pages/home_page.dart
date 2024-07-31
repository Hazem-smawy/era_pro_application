import 'package:era_pro_applicationlication/src/core/extensions/context_extensions.dart';
import 'package:era_pro_applicationlication/src/core/extensions/padding_extension.dart';
import 'package:era_pro_applicationlication/src/features/user/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [UserProfileWidget()],
        ).p(20),
      ),
    );
  }
}
