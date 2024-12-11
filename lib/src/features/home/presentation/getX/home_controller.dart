// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:era_pro_application/src/features/exchange_receipt/domain/entities/exchange_entity.dart';
import 'package:era_pro_application/src/features/exchange_receipt/domain/usecases/get_all_exchange_usecase.dart';
import 'package:get/get.dart';

import 'package:era_pro_application/src/features/bills/domain/repositories/bill_repository.dart';
import 'package:era_pro_application/src/features/bills/domain/usecases/get_recent_bills.dart';

class HomeController extends GetxController {
  final recentBillStatus = RxStatus.loading().obs;
  GetRecentBillsUsecase getRecentBillsUsecase;
  GetAllExchangeUsecase getAllExchangeUsecase;

  var allBills = <BillWithDetailsUI>[].obs;
  var allExchange = <ExchangeEntity>[].obs;
  HomeController({
    required this.getRecentBillsUsecase,
    required this.getAllExchangeUsecase,
  });

  Future<void> fetchAll() async {
    recentBillStatus.value = RxStatus.loading();
    await fetchRecentBills();
    await fetchAllExchange();

    allBills.isEmpty && allExchange.isEmpty
        ? recentBillStatus.value = RxStatus.empty()
        : recentBillStatus.value = RxStatus.success();
  }

  Future<void> fetchRecentBills() async {
    final res = await getRecentBillsUsecase.call();

    res.fold((f) {}, (r) {
      allBills.value = r;
    });
  }

  Future<void> fetchAllExchange() async {
    final res = await getAllExchangeUsecase.call();

    res.fold((f) {}, (r) {
      allExchange.value = r;
    });
  }
}
