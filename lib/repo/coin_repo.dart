import 'package:conflow/modal/coin.dart';

abstract class CoinRepository {
  Future<List<Coin>> getCoinList();
}
