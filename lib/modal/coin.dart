import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin.g.dart';
part 'coin.freezed.dart';

@freezed
@JsonSerializable()
class Coin extends Equatable with _$Coin {
  const Coin._();

  @override
  List<Object?> get props => [id, name, price];

  const factory Coin(
      {required String id,
      required String name,
      required double price}) = _Coin;

  factory Coin.fromJSON(Map<String, dynamic> json) => _$CoinFromJson(json);

  Map<String, dynamic> toJSON() => _$CoinToJson(this);
}
