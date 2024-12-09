// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/utils/image_converter.dart';

class UserEntity extends Equatable {
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
  @Uint8ListConverter()
  final Uint8List? image;

  const UserEntity({
    required this.id,
    required this.userName,
    required this.password,
    required this.userAcctype,
    required this.branchId,
    required this.groupId,
    required this.note,
    required this.image,
  });

  @override
  List<Object?> get props =>
      [id, userName, password, userAcctype, branchId, groupId, note, image];
}
