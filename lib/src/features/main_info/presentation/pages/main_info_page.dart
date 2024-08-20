import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../widgets/main_info_widget.dart';

class MainInfoPage extends StatelessWidget {
  const MainInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.only(bottom: 110),
                crossAxisSpacing: 20,
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                childAspectRatio: .8,
                children: <Widget>[
                  InfoItemWidget(
                    title: 'الفواتير',
                    color: const Color(0xff37B6BD),
                    icon: FontAwesomeIcons.fileInvoice,
                    action: () {},
                  ),
                  InfoItemWidget(
                      title: 'العملاء',
                      color: const Color(0xffED3C56),
                      icon: FontAwesomeIcons.user,
                      action: () {}),
                  InfoItemWidget(
                    title: 'المخزون',
                    color: Colors.blue,
                    icon: FontAwesomeIcons.building,
                    action: () {},
                  ),
                  InfoItemWidget(
                    title: 'العملاء',
                    color: const Color(0xffED3C56),
                    icon: FontAwesomeIcons.user,
                    action: () {},
                  ),
                  InfoItemWidget(
                      title: 'العملات',
                      color: Colors.green,
                      icon: FontAwesomeIcons.dollarSign,
                      action: () {}),
                  InfoItemWidget(
                    title: 'معلومات الشركة',
                    color: const Color.fromARGB(255, 231, 153, 20),
                    icon: FontAwesomeIcons.circleInfo,
                    action: () {
                      Get.toNamed(AppRouteName.companyInfo.name);
                    },
                  ),
                  InfoItemWidget(
                    title: 'العملاء',
                    color: const Color(0xffED3C56),
                    icon: FontAwesomeIcons.user,
                    action: () {},
                  ),
                  InfoItemWidget(
                    title: 'المخزون',
                    color: Colors.blue,
                    icon: FontAwesomeIcons.building,
                    action: () {},
                  ),
                ],
              ),
            ),
          ],
        ).p(20),
      ),
    );
  }
}
