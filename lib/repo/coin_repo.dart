import 'package:crypto_please_conv/modal/coin.dart';

abstract class CoinRepository {
  Future<List<Coin>> getCoinList();
}
