import 'package:crypto_info_api/view/crypto_detail_page.dart';
import 'package:crypto_info_api/viewModel/crypto_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewModel/number_format.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _cryptoController = Get.find<CryptoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Preços de Criptomoedas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.amber[600],
        actions: [
          IconButton(
            onPressed: _cryptoController.fetchCryptos,
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: Obx(() {
        if (_cryptoController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (_cryptoController.cryptos.isEmpty) {
          return Center(child: Text('Nenhuma criptomoeda encontrada.'));
        } else {
          return ListView.builder(
            itemCount: _cryptoController.cryptos.length,
            itemBuilder: (context, index) {
              var crypto = _cryptoController.cryptos[index];
              final formatador = NumberFormatter();

              String cryptoPrice = formatador.formatNumber(crypto.price);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: 70,
                  child: ListTile(
                    leading: Image.network(
                      crypto.image,
                      width: 40,
                      height: 40,
                    ),
                    title: Text(
                      crypto.cryptoName,
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      crypto.symbol.toUpperCase(),
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: Text(
                      'R\$ ${cryptoPrice}',
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () => Get.to(() => CryptoDetailPage(), arguments: {
                      'cryptoName': crypto.cryptoName,
                      'cryptoImage': crypto.image,
                      'cryptoPrice': cryptoPrice,
                      'cryptoSymbol': crypto.symbol,
                      'cryptoMarketCap': crypto.marketCap,
                      'cryptoVolume': crypto.volume,
                      'cryptoCirculatingSupply': crypto.circulatingSupply,
                    }),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
