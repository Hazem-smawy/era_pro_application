/*
  "cust_parent": 1020103,
    "generate_code": "10201032",
    "cust_group": 302
 */

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore: must_be_immutable
class UserSettingEntity extends Equatable {
  int id;
  @JsonKey(name: 'cust_parent')
  final int custParent;

  @JsonKey(name: 'generate_code')
  final String generateCode;

  @JsonKey(name: 'cust_group')
  final int custGroup;

  UserSettingEntity({
    this.id = 1,
    required this.custParent,
    required this.generateCode,
    required this.custGroup,
  });

  @override
  List<Object?> get props => [custGroup, generateCode, custParent];
}
