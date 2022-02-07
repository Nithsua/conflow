import 'package:crypto_please_conv/modal/coin.dart';
import 'package:crypto_please_conv/repo/coin_repo.dart';
import 'package:dio/dio.dart';

const coinsList = {
  'bitcoin': 'Bitcoin',
  'ethereum': 'Ethereum',
  'tether': 'Tether',
  'binancecoin': 'Binance Coin',
  'usd-coin': 'USD Coin',
};

class CoinService extends CoinRepository {
  static const baseUrl = 'https://api.coingecko.com/api/v3/';

  @override
  Future<List<Coin>> getCoinList() async {
    String coinIds = '';
    coinsList.forEach((key, value) {
      coinIds += '$key,';
    });

    final coins = <Coin>[];

    try {
      final response = await Dio(
        BaseOptions(queryParameters: {
          'ids': coinIds,
          'vs_currencies': 'usd',
        }),
      ).get(baseUrl + 'simple/price');

      final data = response.data as Map<String, dynamic>;

      data.forEach((key, value) {
        coins.add(Coin.fromJSON(
            {'id': key, 'name': coinsList[key], 'price': value['usd']}));
      });
    } catch (_) {
      rethrow;
    }
    return coins;
  }
}
