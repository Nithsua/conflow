// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleResponse _$SimpleResponseFromJson(Map<String, dynamic> json) =>
    SimpleResponse(
      bitcoin: json['bitcoin'] == null
          ? null
          : Value.fromJson(json['bitcoin'] as Map<String, dynamic>),
      binanceCoin: json['binancecoin'] == null
          ? null
          : Value.fromJson(json['binancecoin'] as Map<String, dynamic>),
      ethereum: json['ethereum'] == null
          ? null
          : Value.fromJson(json['ethereum'] as Map<String, dynamic>),
      tether: json['tether'] == null
          ? null
          : Value.fromJson(json['tether'] as Map<String, dynamic>),
      usdCoin: json['usd-coin'] == null
          ? null
          : Value.fromJson(json['usd-coin'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SimpleResponseToJson(SimpleResponse instance) =>
    <String, dynamic>{
      'bitcoin': instance.bitcoin?.toJson(),
      'ethereum': instance.ethereum?.toJson(),
      'binancecoin': instance.binanceCoin?.toJson(),
      'tether': instance.tether?.toJson(),
      'usd-coin': instance.usdCoin?.toJson(),
    };

Value _$ValueFromJson(Map<String, dynamic> json) => Value(
      usd: (json['usd'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ValueToJson(Value instance) => <String, dynamic>{
      'usd': instance.usd,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _APIClient implements APIClient {
  _APIClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.coingecko.com/api/v3/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SimpleResponse> getTasks(ids, vsCurrencies) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'ids': ids,
      r'vs_currencies': vsCurrencies
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SimpleResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/simple/price',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SimpleResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
