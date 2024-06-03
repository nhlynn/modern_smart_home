import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/device_vo.dart';

final smartDeviceProvider =
    StateNotifierProvider<SmartDeviceNotifier, List<DeviceVo>>((ref) {
  final deviceList = [
    DeviceVo(1, 'Smart Light', 'images/light.png', false),
    DeviceVo(2, 'Smart AC', 'images/ac.png', false),
    DeviceVo(3, 'Smart TV', 'images/tv.png', false),
    DeviceVo(4, 'Smart Fan', 'images/fan.png', false),
  ];
  return SmartDeviceNotifier(deviceList);
});

class SmartDeviceNotifier extends StateNotifier<List<DeviceVo>> {
  SmartDeviceNotifier(super.initialDevices);

  void powerSwitchChange(bool powerOn, int index) {
    List<DeviceVo> deviceList = state;
    deviceList[index].powerOn = powerOn;
    state = [...deviceList];
  }
}
