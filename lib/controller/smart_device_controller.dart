import 'package:get/get.dart';

import '../model/device_vo.dart';

class SmartDeviceController extends GetxController {
  RxList<DeviceVo> mySmartDevices = [
    DeviceVo('Smart Light', 'images/light.png', false),
    DeviceVo('Smart AC', 'images/ac.png', false),
    DeviceVo('Smart TV', 'images/tv.png', false),
    DeviceVo('Smart Fan', 'images/fan.png', false),
  ].obs;

  void powerSwitchChange(bool powerOn, int index) {
    var device = mySmartDevices[index];
    device.powerOn = powerOn;
    mySmartDevices[index] = device; // Update the list to trigger UI update
  }
}
