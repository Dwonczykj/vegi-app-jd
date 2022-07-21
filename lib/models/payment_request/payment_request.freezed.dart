// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentRequest _$PaymentRequestFromJson(Map<String, dynamic> json) {
  return _PaymentRequest.fromJson(json);
}

/// @nodoc
mixin _$PaymentRequest {
// @JsonKey(name: 'SendFromAddress') required String sendFromAddress,
// @JsonKey(name: 'SendToAddress') required String sendToAddress,
  @JsonKey(name: 'PaymentId')
  String get paymentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Amount')
  num get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'Items')
  List<Item> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentRequestCopyWith<PaymentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentRequestCopyWith<$Res> {
  factory $PaymentRequestCopyWith(
          PaymentRequest value, $Res Function(PaymentRequest) then) =
      _$PaymentRequestCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'PaymentId') String paymentId,
      @JsonKey(name: 'Amount') num amount,
      @JsonKey(name: 'Items') List<Item> items});
}

/// @nodoc
class _$PaymentRequestCopyWithImpl<$Res>
    implements $PaymentRequestCopyWith<$Res> {
  _$PaymentRequestCopyWithImpl(this._value, this._then);

  final PaymentRequest _value;
  // ignore: unused_field
  final $Res Function(PaymentRequest) _then;

  @override
  $Res call({
    Object? paymentId = freezed,
    Object? amount = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      paymentId: paymentId == freezed
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ));
  }
}

/// @nodoc
abstract class _$$_PaymentRequestCopyWith<$Res>
    implements $PaymentRequestCopyWith<$Res> {
  factory _$$_PaymentRequestCopyWith(
          _$_PaymentRequest value, $Res Function(_$_PaymentRequest) then) =
      __$$_PaymentRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'PaymentId') String paymentId,
      @JsonKey(name: 'Amount') num amount,
      @JsonKey(name: 'Items') List<Item> items});
}

/// @nodoc
class __$$_PaymentRequestCopyWithImpl<$Res>
    extends _$PaymentRequestCopyWithImpl<$Res>
    implements _$$_PaymentRequestCopyWith<$Res> {
  __$$_PaymentRequestCopyWithImpl(
      _$_PaymentRequest _value, $Res Function(_$_PaymentRequest) _then)
      : super(_value, (v) => _then(v as _$_PaymentRequest));

  @override
  _$_PaymentRequest get _value => super._value as _$_PaymentRequest;

  @override
  $Res call({
    Object? paymentId = freezed,
    Object? amount = freezed,
    Object? items = freezed,
  }) {
    return _then(_$_PaymentRequest(
      paymentId: paymentId == freezed
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_PaymentRequest implements _PaymentRequest {
  _$_PaymentRequest(
      {@JsonKey(name: 'PaymentId') required this.paymentId,
      @JsonKey(name: 'Amount') required this.amount,
      @JsonKey(name: 'Items') required this.items});

  factory _$_PaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentRequestFromJson(json);

// @JsonKey(name: 'SendFromAddress') required String sendFromAddress,
// @JsonKey(name: 'SendToAddress') required String sendToAddress,
  @override
  @JsonKey(name: 'PaymentId')
  final String paymentId;
  @override
  @JsonKey(name: 'Amount')
  final num amount;
  @override
  @JsonKey(name: 'Items')
  final List<Item> items;

  @override
  String toString() {
    return 'PaymentRequest(paymentId: $paymentId, amount: $amount, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentRequest &&
            const DeepCollectionEquality().equals(other.paymentId, paymentId) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(paymentId),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(items));

  @JsonKey(ignore: true)
  @override
  _$$_PaymentRequestCopyWith<_$_PaymentRequest> get copyWith =>
      __$$_PaymentRequestCopyWithImpl<_$_PaymentRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentRequestToJson(this);
  }
}

abstract class _PaymentRequest implements PaymentRequest {
  factory _PaymentRequest(
          {@JsonKey(name: 'PaymentId') required final String paymentId,
          @JsonKey(name: 'Amount') required final num amount,
          @JsonKey(name: 'Items') required final List<Item> items}) =
      _$_PaymentRequest;

  factory _PaymentRequest.fromJson(Map<String, dynamic> json) =
      _$_PaymentRequest.fromJson;

  @override // @JsonKey(name: 'SendFromAddress') required String sendFromAddress,
// @JsonKey(name: 'SendToAddress') required String sendToAddress,
  @JsonKey(name: 'PaymentId')
  String get paymentId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Amount')
  num get amount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Items')
  List<Item> get items => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentRequestCopyWith<_$_PaymentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
