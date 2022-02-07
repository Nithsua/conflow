part of './coin_bloc.dart';

class CoinState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CoinLoading extends CoinState {}

class CoinData extends CoinState {
  final List<Coin> coins;
  CoinData({required this.coins});

  @override
  List<Object?> get props => [coins];

  Coin? getCoinById(String id) {
    for (var coin in coins) {
      if (coin.id == id) return coin;
    }
    return null;
  }
}

class CoinError extends CoinState {
  final Error error;
  CoinError({required this.error});

  @override
  List<Object?> get props => [error];
}
