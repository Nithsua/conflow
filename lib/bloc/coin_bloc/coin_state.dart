part of './coin_bloc.dart';

@freezed
class CoinState with _$CoinState {
  const factory CoinState.loading() = Loading;
  const factory CoinState.error({required Object error}) = Failed;
  const factory CoinState.data({required List<Coin> coins}) = Data;
}
