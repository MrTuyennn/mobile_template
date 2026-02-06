import 'package:app_logger/logger.dart';
import 'package:auto_route/auto_route.dart';
import 'package:device_info_app/device_info_app.dart';
import 'package:flutter/material.dart';
import 'package:widget/widget.dart';

@RoutePage()
class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Future<void> _getAppInfo() async {
    final deviceInfo = await DeviceInfoApp.getDeviceInfo();
    logger.e(deviceInfo!.toJson());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAppInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account Page')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ActionButton.blue(
            context: context,
            onPressed: () {},
            text: 'Ngọc Tuên',
          ),
          ActionButton.inverseBlue(
            context: context,
            onPressed: () {},
            text: 'Inverse Button',
          ),
          CustomInput(),
        ],
      ),
    );
  }
}
