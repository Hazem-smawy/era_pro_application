import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/elvated_btn_extension.dart';
import 'package:era_pro_application/src/features/accounts/presentation/getX/accounts_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/custom_text_filed_widget.dart';

class AddNewAccountSheet extends StatelessWidget {
  AddNewAccountSheet({super.key});

  final AccountsController accountsController = Get.find();
  @override
  Widget build(BuildContext context) {
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
          color: context.bg,
        ),
        child: Form(
          key: accountsController.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                //backgroundColor: const Color(0xffF7BC56),
                child: Image.asset(
                  'assets/images/avatar2.jpg',
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              context.g12,
              Container(
                width: Get.width / 3,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: context.secondaryTextColor.withOpacity(0.4),
                  ),
                ),
                child: const Center(child: Text('تعديل')),
              ),
              context.g20,
              CustomTextFieldWidget(
                controller: accountsController.name,
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
                  accountsController.addAccount();
                },
              ),
              context.g36,
            ],
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
