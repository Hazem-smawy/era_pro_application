// import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
// import 'package:era_pro_application/src/features/async/presentation/getX/async_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// // class LoadingPage extends StatelessWidget {
// //   final AsyncController controller = Get.find();

// //   LoadingPage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     controller.asyncAll(); // Start async tasks

// //     return Scaffold(
// //       body: Center(
// //         child: AnimatedBuilder(
// //           animation: controller.currentStep,
// //           builder: (context, _) {
// //             final progress =
// //                 controller.currentStep.value / controller.totalSteps;

// //             return Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Stack(
// //                   children: [
// //                     CircularProgressIndicator(
// //                       color: context.primary.withOpacity(0.1),
// //                     ),
// //                     CircularProgressIndicator(
// //                       value: progress,
// //                       color: context.secondary,
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 20),
// //                 // Progress Bar
// //                 AnimatedContainer(
// //                   duration: const Duration(milliseconds: 300),
// //                   width: 200,
// //                   height: 10,
// //                   decoration: BoxDecoration(
// //                     color: Colors.grey[300],
// //                     borderRadius: BorderRadius.circular(5),
// //                   ),
// //                   child: Align(
// //                     alignment: Alignment.centerLeft,
// //                     child: Container(
// //                       width: 200 * progress,
// //                       height: 10,
// //                       decoration: BoxDecoration(
// //                         color: context.primary,
// //                         borderRadius: BorderRadius.circular(5),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 20),
// //                 // Step Text
// //                 Text(
// //                   'الخطوة ${controller.currentStep.value + 1} من ${controller.totalSteps}',
// //                   style: const TextStyle(
// //                       fontSize: 18, fontWeight: FontWeight.bold),
// //                 ),
// //                 const SizedBox(height: 10),
// //                 // Loading Message
// //                 Text(
// //                   getLoadingMessage(controller.currentStep.value),
// //                   textDirection: TextDirection.rtl,
// //                   style: TextStyle(fontSize: 16, color: Colors.grey[600]),
// //                 ),
// //               ],
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }

// //   String getLoadingMessage(int step) {
// //     switch (step) {
// //       case 0:
// //         return "جارٍ تحميل معلومات المستخدم...";
// //       case 1:
// //         return "جارٍ تحميل المعلومات الرئيسية...";
// //       case 2:
// //         return "جارٍ استرداد بيانات الحسابات...";
// //       case 3:
// //         return "جارٍ تحميل معلومات المتاجر...";
// //       default:
// //         return "جارٍ التهيئة...";
// //     }
// //   }
// // }
// class LoadingPage extends StatefulWidget {
//   const LoadingPage({super.key});

//   @override
//   _LoadingPageState createState() => _LoadingPageState();
// }

// class _LoadingPageState extends State<LoadingPage> {
//   final AsyncController controller = Get.find();

//   @override
//   void initState() {
//     super.initState();
//     controller.asyncAll(); // Start async tasks
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedBuilder(
//           animation: controller.currentStep,
//           builder: (context, _) {
//             final progress =
//                 controller.currentStep.value / controller.totalSteps;

//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Stack(
//                   children: [
//                     CircularProgressIndicator(
//                       color: context.primary.withOpacity(0.1),
//                     ),
//                     CircularProgressIndicator(
//                       value: progress,
//                       color: context.secondary,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 // Progress Bar
//                 AnimatedContainer(
//                   duration: const Duration(milliseconds: 300),
//                   width: 200,
//                   height: 10,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[300],
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Container(
//                       width: 200 * progress,
//                       height: 10,
//                       decoration: BoxDecoration(
//                         color: context.primary,
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 // Step Text
//                 Text(
//                   'الخطوة ${controller.currentStep.value + 1} من ${controller.totalSteps}',
//                   style: const TextStyle(
//                       fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 // Loading Message
//                 Text(
//                   getLoadingMessage(controller.currentStep.value),
//                   textDirection: TextDirection.rtl,
//                   style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }

//   String getLoadingMessage(int step) {
//     switch (step) {
//       case 0:
//         return "جارٍ تحميل معلومات المستخدم...";
//       case 1:
//         return "جارٍ تحميل المعلومات الرئيسية...";
//       case 2:
//         return "جارٍ استرداد بيانات الحسابات...";
//       case 3:
//         return "جارٍ تحميل معلومات المتاجر...";
//       default:
//         return "جارٍ التهيئة...";
//     }
//   }
// }
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
    //   if (controller.errorMessage.value == '') {
    //     // Show the error message if there's an error
    //     return Scaffold(
    //       body: Center(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             const Icon(Icons.refresh, color: Colors.red, size: 100),
    //             const SizedBox(height: 20),
    //             Text('حدث خطأ أثناء التهيئة',
    //                 style: context.displayLarge.copyWith(
    //                   color: Colors.red,
    //                 )),
    //             context.g8,
    //             Text(
    //               controller.errorMessage.value,
    //               textAlign: TextAlign.center,
    //               style: const TextStyle(fontSize: 16, color: Colors.grey),
    //             ),
    //             context.g20,
    //             Padding(
    //               padding: const EdgeInsets.symmetric(
    //                 horizontal: 50,
    //               ),
    //               child: ElevatedButtonExtension.secondary(
    //                   label: 'إعادة المحاولة',
    //                   onPressed: () {
    //                     setState(() {
    //                       controller.errorMessage.value =
    //                           ''; // Reset the error message
    //                     });
    //                     controller.asyncAll(); // Retry the tasks
    //                   }),
    //             )
    //           ],
    //         ),
    //       ),
    //     );
    //   }

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
