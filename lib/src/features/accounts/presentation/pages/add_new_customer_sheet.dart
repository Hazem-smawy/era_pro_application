// import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
// import 'package:era_pro_application/src/core/extensions/elvated_btn_extension.dart';
// import 'package:era_pro_application/src/core/utils/pick_image_helper.dart';
// import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';
// import 'package:era_pro_application/src/features/accounts/presentation/getX/accounts_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// import '../../../../core/extensions/image_with_error_extension.dart';
// import '../../../../core/widgets/custom_text_filed_widget.dart';

// class AddNewAccountSheet extends StatelessWidget {
//   AddNewAccountSheet({super.key, this.account});
//   final AccountEntity? account;
//   final AccountsController accountsController = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     accountsController.isEditFunc(account);

//     return SafeArea(
//       bottom: false,
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
//         decoration: BoxDecoration(
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//           color: context.backgroundColor,
//         ),
//         child: Obx(
//           (){Form(
//             key: accountsController.formKey,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(50),
//                   //backgroundColor: const Color(0xffF7BC56),
//                   child: accountsController.image.value == null ? Image.asset(
//                     'assets/images/avatar2.jpg',
//                     width: 70,
//                     height: 70,
//                     fit: BoxFit.cover,
//                   ):  ClipRRect(
//             borderRadius: BorderRadius.circular(50),
//             child: CustomImage.memoryWithError(
//              await accountsController.fileToUint8List(),
//               w: 50,
//               h: 50,
//             ),
//           ),,
//                 ),
//                 context.g12,
//                 GestureDetector(
//                   onTap: () async {
//                     XFile? image = await pickImage();
//                     if (image != null) {
//                       File? imageFile = File(image.path);
//                       accountsController.image.value = imageFile;
//                     }
//                   },
//                   child: Container(
//                     width: Get.width / 3,
//                     padding: const EdgeInsets.symmetric(vertical: 10),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25),
//                       border: Border.all(
//                         color: context.secondaryTextColor.withOpacity(0.4),
//                       ),
//                     ),
//                     child: const Center(child: Text('تعديل')),
//                   ),
//                 ),
//                 context.g20,
//                 CustomTextFieldWidget(
//                   controller: accountsController.name.value,
//                   hint: 'الإسم',
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return '  الاسم مطلوب';
//                     }
//                     return null;
//                   },
//                 ),
//                 context.g8,
//                 CustomTextFieldWidget(
//                   controller: accountsController.phone,
//                   hint: 'رقم الهاتف',
//                   isNumber: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return '  رقم الهاتف مطلوب';
//                     }
//                     return null;
//                   },
//                 ),
//                 context.g8,
//                 CustomTextFieldWidget(
//                   controller: accountsController.address,
//                   hint: 'العنوان',
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return '  العنوان مطلوب';
//                     }
//                     return null;
//                   },
//                 ),
//                 context.g8,
//                 CustomTextFieldWidget(
//                   controller: accountsController.email,
//                   hint: 'البريد الالكتروني',
//                 ),
//                 context.g8,
//                 CustomTextFieldWidget(
//                   controller: accountsController.limit,
//                   hint: 'حد الدين',
//                   isNumber: true,
//                 ),
//                 context.g20,
//                 ElevatedButtonExtension.primary(
//                   label: 'حفظ',
//                   onPressed: () {
//                     accountsController.addAccount(account);
//                   },
//                 ),
//                 context.g36,
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/elvated_btn_extension.dart';
import 'package:era_pro_application/src/core/utils/pick_image_helper.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';
import 'package:era_pro_application/src/features/accounts/presentation/getX/accounts_controller.dart';
import '../../../../core/widgets/custom_text_filed_widget.dart';

class AddNewAccountSheet extends StatelessWidget {
  AddNewAccountSheet({super.key, this.account});
  final AccountEntity? account;
  final AccountsController accountsController = Get.find();

  @override
  Widget build(BuildContext context) {
    accountsController.isEditFunc(account);

    return SafeArea(
      bottom: false,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: context.backgroundColor,
        ),
        child: Obx(
          () => Form(
            key: accountsController.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Picture with Edit Option

                GestureDetector(
                  onTap: () async {
                    try {
                      // Log the action
                      print('Image picker activated');

                      // Pick image using the helper function
                      XFile? image = await pickImage();

                      if (image != null) {
                        File imageFile = File(image.path);

                        // Update the controller's observable image
                        accountsController.image.value =
                            await accountsController.fileToUint8List(imageFile);

                        // Optionally log success
                        print('Image picked successfully: ${image.path}');
                      } else {
                        // No image selected
                        print('No image selected');
                      }
                    } catch (e) {
                      // Handle any exceptions
                      print('Error picking image: $e');
                    }
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Profile picture or default avatar
                      Obx(() {
                        return CircleAvatar(
                          radius: 35,
                          backgroundImage: accountsController.image.value !=
                                  null
                              ? MemoryImage(accountsController.image.value!)
                              : const AssetImage('assets/images/avatar2.jpg')
                                  as ImageProvider,
                        );
                      }),

                      // Edit icon overlay
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.whiteColor,
                              border: Border.all(
                                color: context.primary,
                              )),
                          child: Icon(
                            Icons.edit,
                            size: 16,
                            color: context.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                context.g12,
                CustomTextFieldWidget(
                  controller: accountsController.name.value,
                  hint: 'الإسم',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '  الاسم مطلوب';
                    }
                    return null;
                  },
                ),
                context.g8,
                CustomTextFieldWidget(
                  controller: accountsController.phone,
                  hint: 'رقم الهاتف',
                  isNumber: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '  رقم الهاتف مطلوب';
                    }
                    return null;
                  },
                ),
                context.g8,
                CustomTextFieldWidget(
                  controller: accountsController.address,
                  hint: 'العنوان',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '  العنوان مطلوب';
                    }
                    return null;
                  },
                ),
                context.g8,
                CustomTextFieldWidget(
                  controller: accountsController.email,
                  hint: 'البريد الالكتروني',
                ),
                context.g8,
                CustomTextFieldWidget(
                  controller: accountsController.limit,
                  hint: 'حد الدين',
                  isNumber: true,
                ),
                context.g20,
                ElevatedButtonExtension.primary(
                  label: 'حفظ',
                  onPressed: () {
                    accountsController.addAccount(account);
                  },
                ),
                context.g36,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomerAddSheetItemWidget extends StatelessWidget {
  const CustomerAddSheetItemWidget({
    required this.icon,
    required this.label,
    required this.color,
    super.key,
  });
  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          FaIcon(
            icon,
            color: color,
            size: 20,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            label,
            style: context.bodyLarge,
          )
        ],
      ),
    );
  }
}
