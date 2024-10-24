import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../model/crypto_model.dart';

class CryptoController extends GetxController {
  var isLoading = false.obs;
  var isLoadingChart = false.obs;
  var cryptos = <CryptoModel>[].obs;
  var chartData = <FlSpot>[].obs;

  @override
  void onInit() {
    fetchCryptos();
    super.onInit();
  }

  Future<void> fetchCryptos() async {
    try {
      isLoading(true);
      var response = await Dio().get(
        'https://api.coingecko.com/api/v3/coins/markets',
        queryParameters: {
          'vs_currency': 'brl',
          'order': 'market_cap_desc',
          'per_page': 20,
          'page': 1,
          'sparkline': false,
        },
      );
      if (response.statusCode == 200) {
        var jsonData = response.data as List;
        var loadedCryptos = jsonData
            .map((cryptoJson) => CryptoModel.fromJson(cryptoJson))
            .toList();
        cryptos.value = loadedCryptos;
      }
    } catch (e) {
      print('Erro ao buscar criptomoedas: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> getChart(String id) async {
    isLoadingChart(true);
    try {
      var response = await Dio().get(
        'https://api.coingecko.com/api/v3/coins/${id}/market_chart',
        queryParameters: {
          'vs_currency': 'brl',
          'days': 30,
          'sparkline': false,
        },
      );
      if (response.statusCode == 200) {
        final data = response.data;
        final List prices = data['prices'];

        List<FlSpot> tempData = [];
        for (int i = 0; i < 15; i++) {
          double x = i.toDouble();
          double y = prices[i][1];

          if (y.isFinite) {
            tempData.add(FlSpot(x, y));
          }
        }

        chartData.assignAll(tempData);
        isLoadingChart.value = false;
      } else {
        throw Exception('Falha ao carregar os dados');
      }
    } catch (e) {
      print('Erro ao criar gráfico: $e');
    } finally {
      isLoadingChart.value = false;
    }
  }
}
