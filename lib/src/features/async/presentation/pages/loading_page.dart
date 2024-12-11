import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:era_pro_application/src/features/async/presentation/getX/async_controller.dart';
import 'package:era_pro_application/src/core/extensions/context_extensions.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final AsyncController controller = Get.find();

  @override
  void initState() {
    super.initState();
    controller.asyncAll(true);
  }

  @override
  Widget build(BuildContext context) {
    // Show the loading UI if there's no error
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: controller.currentStep,
          builder: (context, _) {
            final progress =
                controller.currentStep.value / controller.totalSteps;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircularProgressIndicator(
                      color: context.primary.withOpacity(0.1),
                    ),
                    CircularProgressIndicator(
                      value: progress,
                      color: context.primary,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 200,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 200 * progress,
                      height: 10,
                      decoration: BoxDecoration(
                        color: context.primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'الخطوة ${controller.currentStep.value + 1} من ${controller.totalSteps}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  getLoadingMessage(controller.currentStep.value),
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  String getLoadingMessage(int step) {
    switch (step) {
      case 0:
        return "جارٍ تحميل معلومات المستخدم...";
      case 1:
        return "جارٍ تحميل المعلومات الرئيسية...";
      case 2:
        return "جارٍ استرداد بيانات الحسابات...";
      case 3:
        return "جارٍ تحميل معلومات المتاجر...";
      default:
        return "جارٍ التهيئة...";
    }
  }
}
