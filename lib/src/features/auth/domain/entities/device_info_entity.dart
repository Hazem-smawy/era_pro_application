import 'package:equatable/equatable.dart';

class DeviceInfoEntity extends Equatable {
  final String? deviceid;
  final String? devicemodel;
  final String? devicetype;
  final String? devicename;
  final int? userid;

  const DeviceInfoEntity(
      {this.deviceid,
      this.devicemodel,
      this.devicetype,
      this.devicename,
      this.userid});

  @override
  List<Object?> get props =>
      [deviceid, devicename, devicemodel, devicetype, userid];
}
