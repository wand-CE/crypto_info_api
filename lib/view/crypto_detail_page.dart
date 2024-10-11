import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewModel/number_format.dart';

class CryptoDetailPage extends StatelessWidget {
  const CryptoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormatter();

    final cryptoName = Get.arguments['cryptoName'];
    final cryptoImage = Get.arguments['cryptoImage'];
    final cryptoPrice = Get.arguments['cryptoPrice'];
    final cryptoSymbol = Get.arguments['cryptoSymbol'];
    final cryptoMarketCap =
        formatter.formatNumber(Get.arguments['cryptoMarketCap']);
    final cryptoVolume = formatter.formatNumber(Get.arguments['cryptoVolume']);
    final cryptoCirculatingSupply =
        formatter.formatNumber(Get.arguments['cryptoCirculatingSupply']);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          cryptoName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  cryptoImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Criptomoeda:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 8),
            Text(
              cryptoSymbol,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Valor: R\$$cryptoPrice',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 14),
            Text(
              'Cap. de mercado: R\$$cryptoMarketCap',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 14),
            Text(
              'Volume: R\$$cryptoVolume',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 14),
            Text(
              'Circulação: R\$$cryptoCirculatingSupply',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
