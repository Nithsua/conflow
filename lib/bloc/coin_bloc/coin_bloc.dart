import 'package:crypto_please_conv/modal/coin.dart';
import 'package:crypto_please_conv/repo/coin_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part './coin_event.dart';
part './coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  final CoinRepository coinRepository;

  CoinBloc({required this.coinRepository}) : super(CoinLoading()) {
    on<CoinFetch>((_, emit) async {
      if (state is CoinError) emit(CoinLoading());
      await coinRepository.getCoinList().then((data) {
        emit(CoinData(coins: data));
      }, onError: (error, _) {
        emit(CoinError(error: error));
      });
    });
  }
}
