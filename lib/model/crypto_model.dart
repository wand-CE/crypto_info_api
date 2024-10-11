class CryptoModel {
  String cryptoName;
  double price;
  String symbol;
  String image;
  int marketCap;
  int volume;
  double circulatingSupply;

  CryptoModel({
    required this.cryptoName,
    required this.price,
    required this.symbol,
    required this.image,
    required this.marketCap,
    required this.volume,
    required this.circulatingSupply,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
      cryptoName: json['name'],
      price: json['current_price'].toDouble(),
      symbol: json['symbol'].toUpperCase(),
      image: json['image'],
      marketCap: json['market_cap'],
      volume: json['total_volume'],
      circulatingSupply: json['circulating_supply'].toDouble(),
    );
  }
}
