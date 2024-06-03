import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/smart_device_controller.dart';
import '../widget/smart_device_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appController = Get.put(SmartDeviceController());

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'images/menu.png',
                    width: 45,
                    color: Colors.grey.shade800,
                  ),
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey.shade800,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome, Smart Home',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    'HEAVEN',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 52,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Smart Devices",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            Obx(
              () => Expanded(
                child: GridView.builder(
                  itemCount: appController.mySmartDevices.length,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: (context, index) {
                    var sDevice = appController.mySmartDevices[index];
                    return SmartDeviceWidget(
                      device: sDevice,
                      onChange: (value) =>
                          appController.powerSwitchChange(value, index),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
