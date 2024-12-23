// import 'package:era_pro_application/src/core/constants/assets.dart';
// import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
// import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
// import 'package:era_pro_application/src/features/home/presentation/getX/home_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:get/get.dart';
// import 'package:era_pro_application/src/features/exchange_receipt/domain/entities/exchange_entity.dart';

// import '../../../bills/domain/repositories/bill_repository.dart';

// class DailyChartWidget extends StatelessWidget {
//   final List<BillWithDetailsUI> bills;
//   final List<ExchangeEntity> exchanges;

//   const DailyChartWidget({
//     required this.bills,
//     required this.exchanges,
//     super.key,
//   });

//   // Helper function to get day label
//   String getDayLabel(DateTime date) {
//     return "${date.day}/${date.month}/${date.year}";
//   }

//   // Function to calculate daily totals
//   Map<String, double> _calculateDailyTotals() {
//     Map<String, double> dailyData = {};

//     // Process bills
//     for (var bill in bills) {
//       String day = getDayLabel(bill.bill.billDate);
//       double amount = bill.bill.billFinalCost;
//       if (bill.bill.billType == 8) {
//         // Input
//         dailyData[day] = (dailyData[day] ?? 0) + amount;
//       } else {
//         // Output
//         dailyData[day] = (dailyData[day] ?? 0) - amount;
//       }
//     }

//     // Process exchanges
//     for (var exchange in exchanges) {
//       String day = getDayLabel(exchange.sandDate);
//       double amount = exchange.totalAmount;
//       if (exchange.sandType == 1) {
//         // Input
//         dailyData[day] = (dailyData[day] ?? 0) + amount;
//       } else if (exchange.sandType == 2) {
//         // Output
//         dailyData[day] = (dailyData[day] ?? 0) - amount;
//       }
//     }

//     return dailyData;
//   }

//   @override
//   Widget build(BuildContext context) {
//     Map<String, double> dailyData = _calculateDailyTotals();
//     List<String> days = dailyData.keys.toList();
//     List<BarChartGroupData> barGroups = days.asMap().entries.map((entry) {
//       int index = entry.key;
//       String day = entry.value;
//       double value = dailyData[day] ?? 0;

//       return BarChartGroupData(
//         x: index,
//         barRods: [
//           BarChartRodData(
//             toY: value.abs(), // Use absolute value for bar height
//             width: 16,
//             borderRadius: BorderRadius.circular(4),
//             color: value >= 0 ? Colors.green : Colors.red,
//           ),
//         ],
//       );
//     }).toList();

//     return BarChart(
//       BarChartData(
//         gridData: const FlGridData(
//           show: true,
//           drawHorizontalLine: true,
//           drawVerticalLine: false,
//         ),
//         titlesData: FlTitlesData(
//           leftTitles: AxisTitles(
//             sideTitles: SideTitles(
//               showTitles: true,
//               getTitlesWidget: (value, meta) {
//                 return Text(
//                   value.toStringAsFixed(0),
//                   style: const TextStyle(
//                     fontFamily: 'Cairo',
//                     fontSize: 10,
//                     color: Colors.grey,
//                   ),
//                 );
//               },
//             ),
//           ),
//           bottomTitles: AxisTitles(
//             sideTitles: SideTitles(
//               showTitles: true,
//               getTitlesWidget: (value, meta) {
//                 int index = value.toInt();
//                 return index >= 0 && index < days.length
//                     ? Text(
//                         days[index],
//                         style: const TextStyle(
//                           fontFamily: 'Cairo',
//                           fontSize: 10,
//                           color: Colors.grey,
//                         ),
//                       )
//                     : const SizedBox.shrink();
//               },
//             ),
//           ),
//         ),
//         barGroups: barGroups,
//         borderData: FlBorderData(
//           show: false,
//           border: Border.all(color: Colors.grey, width: 1),
//         ),
//         barTouchData: BarTouchData(
//           enabled: true,
//           touchTooltipData: BarTouchTooltipData(
//             getTooltipItem: (group, groupIndex, rod, rodIndex) {
//               String day = days[group.x.toInt()];
//               return BarTooltipItem(
//                 '$day\n',
//                 const TextStyle(
//                   fontFamily: 'Cairo',
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 children: [
//                   TextSpan(
//                     text: rod.toY.toStringAsFixed(2),
//                     style: const TextStyle(
//                       fontFamily: 'Cairo',
//                       color: Colors.yellow,
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/features/bills/domain/repositories/bill_repository.dart';
import 'package:era_pro_application/src/features/exchange_receipt/domain/entities/exchange_entity.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Ensure you have this package for charts
import 'package:get/get.dart';

import '../../../../core/constants/assets.dart';
import '../getX/home_controller.dart'; // Adjust the import as needed

class DailyChartWidget extends StatelessWidget {
  final List<BillWithDetailsUI> bills;
  final List<ExchangeEntity> exchanges;

  const DailyChartWidget({
    required this.bills,
    required this.exchanges,
    super.key,
  });

  // Helper function to get day label
  String getDayLabel(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  // Function to calculate daily totals
  Map<String, double> _calculateDailyTotals() {
    Map<String, double> dailyData = {};

    // Process bills
    for (var bill in bills) {
      String day = getDayLabel(bill.bill.billDate);
      double amount = bill.bill.billFinalCost;
      if (bill.bill.billType == 8) {
        // Input
        dailyData[day] = (dailyData[day] ?? 0) + amount;
      } else {
        // Output
        dailyData[day] = (dailyData[day] ?? 0) - amount;
      }
    }

    // Process exchanges
    for (var exchange in exchanges) {
      String day = getDayLabel(exchange.sandDate);
      double amount = exchange.totalAmount;
      if (exchange.sandType == 1) {
        // Input
        dailyData[day] = (dailyData[day] ?? 0) + amount;
      } else if (exchange.sandType == 2) {
        // Output
        dailyData[day] = (dailyData[day] ?? 0) - amount;
      }
    }

    return dailyData;
  }

  @override
  Widget build(BuildContext context) {
    Map<String, double> dailyData = _calculateDailyTotals();
    List<String> days = dailyData.keys.toList();
    List<BarChartGroupData> barGroups = days.asMap().entries.map((entry) {
      int index = entry.key;
      String day = entry.value;
      double value = dailyData[day] ?? 0;

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: value.abs(), // Use absolute value for bar height
            width: 16,
            borderRadius: BorderRadius.circular(4),
            color: value >= 0 ? Colors.green : Colors.red,
          ),
        ],
      );
    }).toList();

    return SizedBox(
      height: context.height / 5,
      child: BarChart(
        BarChartData(
          gridData: const FlGridData(
            show: false,
            drawHorizontalLine: true,
            drawVerticalLine: false,
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toStringAsFixed(0),
                    style: const TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  int index = value.toInt();
                  return index >= 0 && index < days.length
                      ? Text(
                          days[index],
                          style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        )
                      : const SizedBox.shrink();
                },
              ),
            ),
          ),
          barGroups: barGroups,
          borderData: FlBorderData(
            show: false,
            border: Border.all(color: Colors.grey, width: 1),
          ),
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                String day = days[group.x.toInt()];
                return BarTooltipItem(
                  '$day\n',
                  const TextStyle(
                    fontFamily: 'Cairo',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: rod.toY.toStringAsFixed(2),
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class DailyWeeklyChart extends StatefulWidget {
  const DailyWeeklyChart({super.key});

  @override
  State<DailyWeeklyChart> createState() => _DailyWeeklyChartState();
}

class _DailyWeeklyChartState extends State<DailyWeeklyChart> {
  final HomeController homeController = Get.find();

  @override
  void initState() {
    super.initState();
    homeController.fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Text(
              'ملخص مالي يومي',
              style: context.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                final status = homeController.recentBillStatus.value;
                if (status.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (status.isSuccess) {
                  return Column(
                    children: [
                      DailyChartWidget(
                        bills: homeController.allBills,
                        exchanges: homeController.allExchange,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'ملاحظة:  القيم السالبة تشير إلى المصروفات.',
                        style: context.bodySmall,
                        textAlign: TextAlign.center,
                      ).ph(20),
                    ],
                  );
                } else if (status.isEmpty) {
                  return Container(
                    padding: const EdgeInsets.all(12),
                    // decoration: BoxDecoration(
                    //   border: Border.all(
                    //     color: context.secondaryTextColor.withOpacity(0.2),
                    //   ),
                    //   borderRadius: BorderRadius.circular(12),
                    // ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.assetsImagesEmpyt,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        context.g12,
                        Text(
                          'ليس هناك اي بيانات بعد',
                          style: context.bodyLarge,
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: Text('No data available'));
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

// class DailyWeeklyChart extends StatefulWidget {
//   const DailyWeeklyChart({super.key});

//   @override
//   State<DailyWeeklyChart> createState() => _DailyWeeklyChartState();
// }

// class _DailyWeeklyChartState extends State<DailyWeeklyChart> {
//   final HomeController homeController = Get.find();
//   @override
//   void initState() {
//     super.initState();
//     homeController.fetchAll();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       width: context.width,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // const ThinDividerWidget(),
//             const SizedBox(height: 16),
//             Text(
//               'ملخص مالي يومي',
//               style: context.titleLarge,
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 16),
//             Expanded(
//               child: Obx(() {
//                 if (homeController.recentBillStatus.value.isLoading) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (homeController.recentBillStatus.value.isSuccess) {
//                   return Column(
//                     children: [
//                       DailyChartWidget(
//                         bills: homeController.allBills,
//                         exchanges: homeController.allExchange,
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         'ملاحظة: القيم الموجبة تشير إلى الدخل، والقيم السالبة تشير إلى المصروفات.',
//                         style: context.bodySmall,
//                         textAlign: TextAlign.center,
//                       ).ph(20),
//                     ],
//                   );
//                 } else if (homeController.recentBillStatus.value.isEmpty) {
//                   return Container(
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: context.secondaryTextColor.withOpacity(0.2),
//                         ),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             Assets.assetsImagesEmpyt,
//                             width: 150,
//                             height: 150,
//                             fit: BoxFit.cover,
//                           ),
//                           context.g12,
//                           Text(
//                             'ليس هناك اي بيانات بعد',
//                             style: context.bodyLarge,
//                           )
//                         ],
//                       ));
//                 } else {
//                   return const Center(child: Text('No data available'));
//                 }
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class WeeklyChartWidget extends StatelessWidget {
  final List<BillWithDetailsUI> bills;
  final List<ExchangeEntity> exchanges;

  const WeeklyChartWidget({
    required this.bills,
    required this.exchanges,
    super.key,
  });

  // Helper function to calculate week of year
  String getWeekLabel(DateTime date) {
    int weekOfYear = ((date.day - date.weekday + 10) / 7).floor();
    return "أسبوع $weekOfYear - ${date.year}";
  }

  // Function to calculate weekly totals
  Map<String, double> _calculateWeeklyTotals() {
    Map<String, double> weeklyData = {};

    // Process bills
    for (var bill in bills) {
      String week = getWeekLabel(bill.bill.billDate);
      double amount = bill.bill.billFinalCost;
      if (bill.bill.billType == 8) {
        // Input
        weeklyData[week] = (weeklyData[week] ?? 0) + amount;
      } else {
        // Output
        weeklyData[week] = (weeklyData[week] ?? 0) - amount;
      }
    }

    // Process exchanges
    for (var exchange in exchanges) {
      String week = getWeekLabel(exchange.sandDate);
      double amount = exchange.totalAmount;
      if (exchange.sandType == 1) {
        // Input
        weeklyData[week] = (weeklyData[week] ?? 0) + amount;
      } else if (exchange.sandType == 2) {
        // Output
        weeklyData[week] = (weeklyData[week] ?? 0) - amount;
      }
    }

    return weeklyData;
  }

  @override
  Widget build(BuildContext context) {
    Map<String, double> weeklyData = _calculateWeeklyTotals();
    List<String> weeks = weeklyData.keys.toList();
    List<BarChartGroupData> barGroups = weeks.asMap().entries.map((entry) {
      int index = entry.key;
      String week = entry.value;
      double value = weeklyData[week] ?? 0;

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: value.abs(), // Use absolute value for bar height
            width: 16,
            borderRadius: BorderRadius.circular(4),
            color: value >= 0 ? Colors.green : Colors.red,
          ),
        ],
      );
    }).toList();

    return BarChart(
      BarChartData(
        gridData: const FlGridData(
          show: true,
          drawHorizontalLine: true,
          drawVerticalLine: false,
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toStringAsFixed(0),
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                int index = value.toInt();
                return index >= 0 && index < weeks.length
                    ? Text(
                        weeks[index],
                        style: const TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      )
                    : const SizedBox.shrink();
              },
            ),
          ),
        ),
        barGroups: barGroups,
        borderData: FlBorderData(
          show: false,
          border: Border.all(color: Colors.grey, width: 1),
        ),
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String week = weeks[group.x.toInt()];
              return BarTooltipItem(
                '$week\n',
                const TextStyle(
                  fontFamily: 'Cairo',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: rod.toY.toStringAsFixed(2),
                    style: const TextStyle(
                      fontFamily: 'Cairo',
                      color: Colors.yellow,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
