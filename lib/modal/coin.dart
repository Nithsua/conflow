import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin.g.dart';
part 'coin.freezed.dart';

@freezed
@JsonSerializable()
class Coin with _$Coin {
  const Coin._();

  const factory Coin(
      {required String id,
      required String name,
      required double price}) = _Coin;

  factory Coin.fromJSON(Map<String, dynamic> json) => _$CoinFromJson(json);

  Map<String, dynamic> toJSON() => _$CoinToJson(this);
}
