/*
{
    "id": 4,
    "name": "مخزن حازم",
    "accountNumber": 10204010002,
    "branchId": 1,
    "storeManager": "حازم عبد العزيز السماوي",
    "managerPhone": "790570725",
    "note": "لا يوجد"
}
*/
class UserStoreEntity {
  final int id;
  final String name;
  final int accountNumber;
  final int branchId;
  final String storeManager;
  final String managerPhone;
  final String note;

  UserStoreEntity({
    required this.id,
    required this.name,
    required this.accountNumber,
    required this.branchId,
    required this.storeManager,
    required this.managerPhone,
    required this.note,
  });
}
