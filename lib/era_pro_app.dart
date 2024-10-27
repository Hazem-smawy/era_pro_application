import 'dart:typed_data';

import 'package:era_pro_application/src/core/routes/app_pages.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/core/theme/theme_data.dart';

class EraProApp extends StatelessWidget {
  const EraProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, ch) => GetMaterialApp(
        theme: AppThemData.lightThemeData,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.routesPage,
        initialRoute: AppPages.INITIAL,
        // home: ItemListPage(),
      ),
    );
  }
}

class ItemController extends GetxController {
  var item = Item(
    id: 1,
    name: 'Sample Item',
    image: null,
    unitDetails: [
      UnitDetails(
          id: 1,
          name: 'Single',
          price: 300,
          unitFactor: 1,
          quantityRemaining: 20),
      UnitDetails(
          id: 2,
          name: 'Cartoon',
          price: 200,
          unitFactor: 12,
          quantityRemaining: 5),
    ],
    selectedQuantities: {1: 0, 2: 0}, // 0 for single, 0 for carton initially.
    selectedPrices: {1: 0.0, 2: 0.0}, // Prices for selected units.
    remainingQuantity: 20,
  ).obs;

  // Increase the quantity for a specific unit
  void increaseQuantity(UnitDetails unit) {
    if (unit.quantityRemaining > 0) {
      item.value.selectedQuantities[unit.id] =
          item.value.selectedQuantities[unit.id]! + 1;
      item.value.selectedPrices[unit.id] =
          item.value.selectedQuantities[unit.id]! * unit.price;
      unit.quantityRemaining -= 1;
      update();
    }
  }

  // Decrease the quantity for a specific unit
  void decreaseQuantity(UnitDetails unit) {
    if (item.value.selectedQuantities[unit.id]! > 0) {
      item.value.selectedQuantities[unit.id] =
          item.value.selectedQuantities[unit.id]! - 1;
      item.value.selectedPrices[unit.id] =
          item.value.selectedQuantities[unit.id]! * unit.price;
      unit.quantityRemaining += 1;
      update();
    }
  }

  // Change the unit
  void changeUnit(UnitDetails newUnit) {
    // No need to adjust quantities here unless you want specific logic for switching units.
    update();
  }
}

class ItemListPage extends StatelessWidget {
  // final ItemController controller = Get.put(() => ItemController());
  ItemController controller = Get.put(ItemController());

  ItemListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Item List")),
      body: Obx(() {
        var item = controller.item.value;
        return ListTile(
          title: Text(item.name),
          subtitle:
              Text('Selected: ${item.getTotalSelectedQuantity()} singles'),
          trailing: Text('Total Price: ${item.getTotalSelectedPrice()}'),
          onTap: () {
            Get.to(ItemPage());
          },
        );
      }),
    );
  }
}

class ItemPage extends StatelessWidget {
  final ItemController controller = Get.put(ItemController());

  ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Item Details")),
      body: Obx(() {
        var item = controller.item.value;
        return Column(
          children: [
            // Image and Name
            GestureDetector(
              onTap: () => showUnitDialog(context),
              child: Column(
                children: [
                  item.image != null
                      ? Image.memory(item.image!)
                      : const Placeholder(fallbackHeight: 200), // Display image
                  Text(item.name, style: const TextStyle(fontSize: 24)),
                ],
              ),
            ),

            // Display the selected quantities and prices for each unit
            ...item.unitDetails.map((unit) {
              return Column(
                children: [
                  Text(
                      '${item.selectedQuantities[unit.id]} ${unit.name} selected'),
                  Text('Price: ${item.selectedPrices[unit.id]}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => controller.decreaseQuantity(unit),
                      ),
                      Text(item.selectedQuantities[unit.id].toString(),
                          style: const TextStyle(fontSize: 20)),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => controller.increaseQuantity(unit),
                      ),
                    ],
                  ),
                ],
              );
            }),

            // Total selected quantity (in singles)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Total selected quantity: ${item.getTotalSelectedQuantity()} singles'),
            ),

            // Total selected price
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Total price: ${item.getTotalSelectedPrice()}'),
            ),

            // Remaining quantity in store
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Text('Remaining in store: ${item.remainingQuantity} singles'),
            ),
          ],
        );
      }),
    );
  }

  void showUnitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Choose Unit"),
          content: SizedBox(
            height: 150,
            child: Column(
              children: controller.item.value.unitDetails.map((unit) {
                return ListTile(
                  title: Text(unit.name),
                  onTap: () {
                    controller.changeUnit(unit);
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class Item {
  int id;
  String name;
  Uint8List? image;
  List<UnitDetails> unitDetails; // List of all units available for this item.
  Map<int, int>
      selectedQuantities; // Key: unitId, Value: selected quantity for that unit.
  Map<int, double>
      selectedPrices; // Key: unitId, Value: total price for that unit.
  int remainingQuantity;

  Item({
    required this.id,
    required this.name,
    required this.image,
    required this.unitDetails,
    required this.selectedQuantities,
    required this.selectedPrices,
    required this.remainingQuantity,
  });

  // Get the total quantity of all selected units
  int getTotalSelectedQuantity() {
    int totalQuantity = 0;
    selectedQuantities.forEach((unitId, quantity) {
      var unit = unitDetails.firstWhere((unit) => unit.id == unitId);
      totalQuantity += quantity * unit.unitFactor;
    });
    return totalQuantity;
  }

  // Get the total price for all selected units
  double getTotalSelectedPrice() {
    double totalPrice = 0;
    selectedPrices.forEach((unitId, price) {
      totalPrice += price;
    });
    return totalPrice;
  }
}

class UnitDetails {
  int id;
  String name;
  double price; // Price for one unit.
  int unitFactor; // Conversion factor to the smallest unit (e.g., 1 carton = 12 singles).
  int quantityRemaining;

  UnitDetails({
    required this.id,
    required this.name,
    required this.price,
    required this.unitFactor,
    required this.quantityRemaining,
  });
}
