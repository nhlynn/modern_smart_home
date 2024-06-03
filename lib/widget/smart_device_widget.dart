import 'package:flutter/material.dart';
import '../model/device_vo.dart';

class SmartDeviceWidget extends StatelessWidget {
  const SmartDeviceWidget({
    super.key,
    required this.device,
    required this.onChange,
  });

  final DeviceVo device;
  final Function(bool)? onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: (device.powerOn) ? Colors.white : Colors.grey.shade600,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                device.deviceIconPath,
                height: 64,
                color: (device.powerOn) ? Colors.black : Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Text(
                        device.deviceName,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold,color: (device.powerOn) ? Colors.black : Colors.white,),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: 4.75,
                    child: Switch(
                      value: device.powerOn,
                      onChanged: onChange,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
