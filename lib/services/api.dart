import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';

part 'api.g.dart';

@JsonSerializable(explicitToJson: true)
class SimpleResponse {
  @JsonKey(name: 'bitcoin')
  Value? bitcoin;
  @JsonKey(name: 'ethereum')
  Value? ethereum;
  @JsonKey(name: 'binancecoin')
  Value? binanceCoin;
  @JsonKey(name: 'tether')
  Value? tether;
  @JsonKey(name: 'usd-coin')
  Value? usdCoin;

  SimpleResponse(
      {this.bitcoin,
      this.binanceCoin,
      this.ethereum,
      this.tether,
      this.usdCoin});

  factory SimpleResponse.fromJson(Map<String, dynamic> json) {
    print(json);
    return _$SimpleResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SimpleResponseToJson(this);
}

@JsonSerializable()
class Value {
  @JsonKey(name: 'usd')
  double? usd;

  Value({this.usd});

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);
  Map<String, dynamic> toJson() => _$ValueToJson(this);
}

@RestApi(baseUrl: 'https://api.coingecko.com/api/v3/')
abstract class APIClient {
  factory APIClient(Dio dio, {String? baseUrl}) = _APIClient;

  @GET('/simple/price')
  Future<SimpleResponse> getTasks(
    @Query('ids') String ids,
    @Query('vs_currencies') String vsCurrencies,
  );
}
