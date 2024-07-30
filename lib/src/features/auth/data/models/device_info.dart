import 'package:era_pro_applicationlication/src/features/auth/domain/entities/device_info.dart';

class DeviceInfoModel extends DeviceInfo {
  const DeviceInfoModel(
      {super.deviceid,
      super.devicemodel,
      super.devicetype,
      super.devicename,
      super.userid});

  factory DeviceInfoModel.fromJson(Map<String, dynamic> json) {
    return DeviceInfoModel(
        deviceid: json['deviceid'],
        devicename: json['devicename'],
        devicemodel: json['devicemodel'],
        devicetype: json['devicetype'],
        userid: json['userid']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deviceid'] = deviceid;
    data['devicename'] = devicename;
    data['devicemodel'] = devicemodel;
    data['devicetype'] = devicetype;
    data['userid'] = userid;
    return data;
  }
}
