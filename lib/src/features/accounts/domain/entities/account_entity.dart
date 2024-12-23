import 'dart:typed_data';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/image_converter.dart';

class AccountEntity extends Equatable with CustomDropdownListFilter {
  int? id;
  final int accNumber;
  int? refNumber;
  final String accName;
  final int accParent;
  final int accType;

  final String note;
  final int accCatagory;
  final int accCatId;
  final String accPhone;
  final String address;
  final String email;
  final int accLimit;
  final int paymentType;
  final int branchId;
  final bool accStoped;
  @Uint8ListConverter()
  final Uint8List? image;
  final bool newData;

  AccountEntity({
    this.id,
    required this.accNumber,
    required this.accName,
    required this.accParent,
    required this.accType,
    required this.note,
    required this.accCatagory,
    required this.accCatId,
    required this.accPhone,
    required this.address,
    required this.email,
    required this.accLimit,
    required this.paymentType,
    required this.branchId,
    required this.accStoped,
    required this.newData,
    this.image,
    this.refNumber,
  });

  @override
  List<Object?> get props => [
        id,
        accNumber,
        accName,
        accParent,
        accType,
        note,
        accCatagory,
        accCatId,
        accPhone,
        address,
        email,
        accLimit,
        paymentType,
        branchId,
        accStoped,
        newData,
        refNumber,
      ];

  @override
  String toString() {
    return accName;
  }

  @override
  bool filter(String query) {
    return accName.toLowerCase().contains(query.toLowerCase());
  }
}
