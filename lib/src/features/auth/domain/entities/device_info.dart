import 'package:equatable/equatable.dart';

class DeviceInfo extends Equatable {
  final String? deviceid;
  final String? devicemodel;
  final String? devicetype;
  final String? devicename;
  final int? userid;

  const DeviceInfo(
      {this.deviceid,
      this.devicemodel,
      this.devicetype,
      this.devicename,
      this.userid});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [deviceid, devicename, devicemodel, devicetype, userid];
}
