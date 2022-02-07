import 'package:crypto_please_conv/modal/coin.dart';
import 'package:crypto_please_conv/repo/coin_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part './coin_event.dart';
part './coin_state.dart';
part 'coin_bloc.freezed.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  final CoinRepository coinRepository;

  CoinBloc({required this.coinRepository}) : super(const Loading()) {
    on<CoinFetch>((_, emit) async {
      if (state is Failed) emit(const Loading());
      await coinRepository.getCoinList().then((data) {
        emit(Data(coins: data));
      }, onError: (error, _) {
        emit(Failed(error: error));
      });
    });
  }
}
