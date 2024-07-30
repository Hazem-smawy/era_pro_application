// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

class UserEntity {
  //   "id": 5,
  // "user_name": "hazem",
  // "password": "123",
  // "user_acc_type": 1,
  // "branch_id": 1,
  // "group_id": 1,
  // "image":

  final int id;
  @JsonKey(name: "user_name")
  final String userName;
  final String password;
  @JsonKey(name: "user_acc_type")
  final int userAcctype;
  @JsonKey(name: "branch_id")
  final int branchId;
  @JsonKey(name: "group_id")
  final int groupId;
  final String note;
  UserEntity({
    required this.id,
    required this.userName,
    required this.password,
    required this.userAcctype,
    required this.branchId,
    required this.groupId,
    required this.note,
  });
}
