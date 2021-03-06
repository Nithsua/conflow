import 'package:conflow/modal/coin.dart';
import 'package:conflow/repo/coin_repo.dart';
import 'package:conflow/services/api.dart';
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
      final dio = Dio();
      final client = APIClient(dio);
      final data = await client.getTasks(coinIds, 'usd');

      data.toJson().forEach((key, value) {
        coins.add(Coin.fromJSON(
            {'id': key, 'name': coinsList[key], 'price': value['usd']}));
      });
    } catch (_) {
      rethrow;
    }
    return coins;
  }
}
