import 'package:conflow/modal/coin.dart';
import 'package:conflow/repo/coin_repo.dart';
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
      try {
        final data = await coinRepository.getCoinList();
        emit(Data(coins: data));
      } catch (error) {
        if (state is! Data) emit(Failed(error: error));
      }
    });
  }
}
