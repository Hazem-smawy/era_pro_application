// import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
// import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
// import 'package:era_pro_application/src/features/home/presentation/getX/home_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:get/get.dart';
// import 'package:era_pro_application/src/features/exchange_receipt/domain/entities/exchange_entity.dart';

// import '../../../bills/domain/repositories/bill_repository.dart';

// class CombinedChartWidget extends StatelessWidget {
//   final List<BillWithDetailsUI> bills;
//   final List<ExchangeEntity> exchanges;

//   const CombinedChartWidget({
//     required this.bills,
//     required this.exchanges,
//     super.key,
//   });

//   // Helper function to get day label
//   String getDayLabel(DateTime date) {
//     return "${date.day}/${date.month}/${date.year}";
//   }

//   // Helper function to calculate week of year
//   String getWeekLabel(DateTime date) {
//     int weekOfYear = ((date.day - date.weekday + 10) / 7).floor();
//     return "أسبوع $weekOfYear - ${date.year}";
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
//       } else if (bill.bill.billType == 9) {
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

//   // Function to calculate weekly totals
//   Map<String, double> _calculateWeeklyTotals() {
//     Map<String, double> weeklyData = {};

//     // Process bills
//     for (var bill in bills) {
//       String week = getWeekLabel(bill.bill.billDate);
//       double amount = bill.bill.billFinalCost;
//       if (bill.bill.billType == 8) {
//         // Input
//         weeklyData[week] = (weeklyData[week] ?? 0) + amount;
//       } else if (bill.bill.billType == 9) {
//         // Output
//         weeklyData[week] = (weeklyData[week] ?? 0) - amount;
//       }
//     }

//     // Process exchanges
//     for (var exchange in exchanges) {
//       String week = getWeekLabel(exchange.sandDate);
//       double amount = exchange.totalAmount;
//       if (exchange.sandType == 1) {
//         // Input
//         weeklyData[week] = (weeklyData[week] ?? 0) + amount;
//       } else if (exchange.sandType == 2) {
//         // Output
//         weeklyData[week] = (weeklyData[week] ?? 0) - amount;
//       }
//     }

//     return weeklyData;
//   }

//   // Helper function to parse date strings in the format DD/MM/YYYY
//   DateTime parseDateString(String dateString) {
//     List<String> parts = dateString.split('/');
//     int day = int.parse(parts[0]);
//     int month = int.parse(parts[1]);
//     int year = int.parse(parts[2]);
//     return DateTime(year, month, day);
//   }

//   // Helper function to sort combined labels
//   List<String> sortCombinedLabels(List<String> labels) {
//     List<String> dateLabels = [];
//     List<String> weekLabels = [];

//     for (var label in labels) {
//       if (label.startsWith("أسبوع")) {
//         weekLabels.add(label);
//       } else {
//         dateLabels.add(label);
//       }
//     }

//     dateLabels.sort((a, b) {
//       DateTime dateA = parseDateString(a);
//       DateTime dateB = parseDateString(b);
//       return dateA.compareTo(dateB);
//     });

//     weekLabels.sort((a, b) {
//       int weekA = int.parse(a.split(' ')[1]);
//       int weekB = int.parse(b.split(' ')[1]);
//       return weekA.compareTo(weekB);
//     });

//     return [...dateLabels, ...weekLabels];
//   }

//   @override
//   Widget build(BuildContext context) {
//     Map<String, double> dailyData = _calculateDailyTotals();
//     Map<String, double> weeklyData = _calculateWeeklyTotals();

//     List<String> combinedLabels = [...dailyData.keys, ...weeklyData.keys];
//     combinedLabels = sortCombinedLabels(combinedLabels);

//     List<FlSpot> spots = combinedLabels.asMap().entries.map((entry) {
//       int index = entry.key;
//       String label = entry.value;
//       double dailyValue = dailyData[label] ?? 0;
//       double weeklyValue = weeklyData[label] ?? 0;
//       double value = dailyValue + weeklyValue;

//       return FlSpot(index.toDouble(), value);
//     }).toList();

//     return LineChart(
//       LineChartData(
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
//                 return index >= 0 && index < combinedLabels.length
//                     ? Text(
//                         combinedLabels[index],
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
//         borderData: FlBorderData(
//           show: true,
//           border: Border.all(color: Colors.grey, width: 1),
//         ),
//         lineBarsData: [
//           LineChartBarData(
//             spots: spots,
//             isCurved: true,
//             color: Colors.blue,
//             barWidth: 2,
//             dotData: const FlDotData(
//               show: true,
//             ),
//           ),
//         ],
//         lineTouchData: LineTouchData(
//           enabled: true,
//           touchTooltipData: LineTouchTooltipData(
//             getTooltipItems: (List<LineBarSpot> touchedSpots) {
//               return touchedSpots.map((spot) {
//                 String label = combinedLabels[spot.x.toInt()];
//                 return LineTooltipItem(
//                   '$label\n',
//                   const TextStyle(
//                     fontFamily: 'Cairo',
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   children: [
//                     TextSpan(
//                       text: spot.y.toStringAsFixed(2),
//                       style: const TextStyle(
//                         fontFamily: 'Cairo',
//                         color: Colors.yellow,
//                       ),
//                     ),
//                   ],
//                 );
//               }).toList();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CDailyWeeklyChart extends StatelessWidget {
//   final HomeController homeController = Get.find();

//   CDailyWeeklyChart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Text(
//             'ملخص مالي مستمر',
//             style: context.titleLarge.copyWith(
//               color: Colors.blueGrey,
//               fontWeight: FontWeight.bold,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 16),
//           Expanded(
//             child: Obx(() {
//               if (homeController.recentBillStatus.value.isLoading) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (homeController.recentBillStatus.value.isSuccess) {
//                 return CombinedChartWidget(
//                   bills: homeController.allBills,
//                   exchanges: homeController.allExchange,
//                 );
//               } else {
//                 return const Center(child: Text('No data available'));
//               }
//             }),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'ملاحظة: القيم الموجبة تشير إلى الدخل، والقيم السالبة تشير إلى المصروفات.',
//             style: context.bodySmall.copyWith(
//               color: Colors.grey,
//             ),
//             textAlign: TextAlign.center,
//           ).ph(20),
//         ],
//       ),
//     );
//   }
// }
import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/features/home/presentation/getX/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:era_pro_application/src/features/exchange_receipt/domain/entities/exchange_entity.dart';

import '../../../bills/domain/repositories/bill_repository.dart';

class CombinedChartWidget extends StatelessWidget {
  final List<BillWithDetailsUI> bills;
  final List<ExchangeEntity> exchanges;

  const CombinedChartWidget({
    required this.bills,
    required this.exchanges,
    super.key,
  });

  // Helper function to get day label
  String getDayLabel(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  // Helper function to calculate week of year
  String getWeekLabel(DateTime date) {
    int weekOfYear = ((date.day - date.weekday + 10) / 7).floor();
    return "أسبوع $weekOfYear - ${date.year}";
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
      } else if (bill.bill.billType == 9) {
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
      } else if (bill.bill.billType == 9) {
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

  // Helper function to parse date strings in the format DD/MM/YYYY
  DateTime parseDateString(String dateString) {
    List<String> parts = dateString.split('/');
    int day = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int year = int.parse(parts[2]);
    return DateTime(year, month, day);
  }

  // Helper function to sort combined labels
  List<String> sortCombinedLabels(List<String> labels) {
    List<String> dateLabels = [];
    List<String> weekLabels = [];

    for (var label in labels) {
      if (label.startsWith("أسبوع")) {
        weekLabels.add(label);
      } else {
        dateLabels.add(label);
      }
    }

    dateLabels.sort((a, b) {
      DateTime dateA = parseDateString(a);
      DateTime dateB = parseDateString(b);
      return dateA.compareTo(dateB);
    });

    weekLabels.sort((a, b) {
      int weekA = int.parse(a.split(' ')[1]);
      int weekB = int.parse(b.split(' ')[1]);
      return weekA.compareTo(weekB);
    });

    return [...dateLabels, ...weekLabels];
  }

  @override
  Widget build(BuildContext context) {
    Map<String, double> dailyData = _calculateDailyTotals();
    Map<String, double> weeklyData = _calculateWeeklyTotals();

    List<String> combinedLabels = [...dailyData.keys, ...weeklyData.keys];
    combinedLabels = sortCombinedLabels(combinedLabels);

    List<FlSpot> spots = combinedLabels.asMap().entries.map((entry) {
      int index = entry.key;
      String label = entry.value;
      double dailyValue = dailyData[label] ?? 0;
      double weeklyValue = weeklyData[label] ?? 0;
      double value = dailyValue + weeklyValue;

      return FlSpot(index.toDouble(), value);
    }).toList();

    return LineChart(
      LineChartData(
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
                if (index >= 0 && index < combinedLabels.length) {
                  String label = combinedLabels[index];
                  return Text(
                    label.startsWith("أسبوع") ? label[0] : label.split('/')[0],
                    style: const TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: Colors.blue,
            barWidth: 2,
            dotData: const FlDotData(
              show: true,
            ),
          ),
        ],
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (List<LineBarSpot> touchedSpots) {
              return touchedSpots.map((spot) {
                String label = combinedLabels[spot.x.toInt()];
                return LineTooltipItem(
                  '$label\n',
                  const TextStyle(
                    fontFamily: 'Cairo',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: spot.y.toStringAsFixed(2),
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                );
              }).toList();
            },
          ),
        ),
      ),
    );
  }
}

class CDailyWeeklyChart extends StatelessWidget {
  final HomeController homeController = Get.find();

  CDailyWeeklyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'ملخص مالي مستمر',
            style: context.titleLarge.copyWith(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Obx(() {
              if (homeController.recentBillStatus.value.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (homeController.recentBillStatus.value.isSuccess) {
                return CombinedChartWidget(
                  bills: homeController.allBills,
                  exchanges: homeController.allExchange,
                );
              } else {
                return const Center(child: Text('No data available'));
              }
            }),
          ),
          const SizedBox(height: 16),
          Text(
            'ملاحظة: القيم الموجبة تشير إلى الدخل، والقيم السالبة تشير إلى المصروفات.',
            style: context.bodySmall.copyWith(
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ).ph(20),
        ],
      ),
    );
  }
}
