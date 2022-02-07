// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CoinTearOff {
  const _$CoinTearOff();

  _Coin call(
      {required String id, required String name, required double price}) {
    return _Coin(
      id: id,
      name: name,
      price: price,
    );
  }
}

/// @nodoc
const $Coin = _$CoinTearOff();

/// @nodoc
mixin _$Coin {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CoinCopyWith<Coin> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinCopyWith<$Res> {
  factory $CoinCopyWith(Coin value, $Res Function(Coin) then) =
      _$CoinCopyWithImpl<$Res>;
  $Res call({String id, String name, double price});
}

/// @nodoc
class _$CoinCopyWithImpl<$Res> implements $CoinCopyWith<$Res> {
  _$CoinCopyWithImpl(this._value, this._then);

  final Coin _value;
  // ignore: unused_field
  final $Res Function(Coin) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$CoinCopyWith<$Res> implements $CoinCopyWith<$Res> {
  factory _$CoinCopyWith(_Coin value, $Res Function(_Coin) then) =
      __$CoinCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, double price});
}

/// @nodoc
class __$CoinCopyWithImpl<$Res> extends _$CoinCopyWithImpl<$Res>
    implements _$CoinCopyWith<$Res> {
  __$CoinCopyWithImpl(_Coin _value, $Res Function(_Coin) _then)
      : super(_value, (v) => _then(v as _Coin));

  @override
  _Coin get _value => super._value as _Coin;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
  }) {
    return _then(_Coin(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_Coin extends _Coin {
  const _$_Coin({required this.id, required this.name, required this.price})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final double price;

  @JsonKey(ignore: true)
  @override
  _$CoinCopyWith<_Coin> get copyWith =>
      __$CoinCopyWithImpl<_Coin>(this, _$identity);
}

abstract class _Coin extends Coin {
  const factory _Coin(
      {required String id,
      required String name,
      required double price}) = _$_Coin;
  const _Coin._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$CoinCopyWith<_Coin> get copyWith => throw _privateConstructorUsedError;
}
