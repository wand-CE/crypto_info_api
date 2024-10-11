import 'package:crypto_info_api/viewModel/crypto_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/custom_theme.dart';
import 'view/home_page.dart';

void main() {
  final CryptoController cryptoController = Get.put(CryptoController());

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: customTheme,
    home: HomePage(),
  ));
}
