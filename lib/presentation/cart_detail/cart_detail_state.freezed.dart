// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartDetailState {
  UiState<List<AddToCartArgs>> get cartItemListState =>
      throw _privateConstructorUsedError;

  /// Create a copy of CartDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartDetailStateCopyWith<CartDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartDetailStateCopyWith<$Res> {
  factory $CartDetailStateCopyWith(
          CartDetailState value, $Res Function(CartDetailState) then) =
      _$CartDetailStateCopyWithImpl<$Res, CartDetailState>;
  @useResult
  $Res call({UiState<List<AddToCartArgs>> cartItemListState});

  $UiStateCopyWith<List<AddToCartArgs>, $Res> get cartItemListState;
}

/// @nodoc
class _$CartDetailStateCopyWithImpl<$Res, $Val extends CartDetailState>
    implements $CartDetailStateCopyWith<$Res> {
  _$CartDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItemListState = null,
  }) {
    return _then(_value.copyWith(
      cartItemListState: null == cartItemListState
          ? _value.cartItemListState
          : cartItemListState // ignore: cast_nullable_to_non_nullable
              as UiState<List<AddToCartArgs>>,
    ) as $Val);
  }

  /// Create a copy of CartDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UiStateCopyWith<List<AddToCartArgs>, $Res> get cartItemListState {
    return $UiStateCopyWith<List<AddToCartArgs>, $Res>(_value.cartItemListState,
        (value) {
      return _then(_value.copyWith(cartItemListState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartDetailStateImplCopyWith<$Res>
    implements $CartDetailStateCopyWith<$Res> {
  factory _$$CartDetailStateImplCopyWith(_$CartDetailStateImpl value,
          $Res Function(_$CartDetailStateImpl) then) =
      __$$CartDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UiState<List<AddToCartArgs>> cartItemListState});

  @override
  $UiStateCopyWith<List<AddToCartArgs>, $Res> get cartItemListState;
}

/// @nodoc
class __$$CartDetailStateImplCopyWithImpl<$Res>
    extends _$CartDetailStateCopyWithImpl<$Res, _$CartDetailStateImpl>
    implements _$$CartDetailStateImplCopyWith<$Res> {
  __$$CartDetailStateImplCopyWithImpl(
      _$CartDetailStateImpl _value, $Res Function(_$CartDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItemListState = null,
  }) {
    return _then(_$CartDetailStateImpl(
      cartItemListState: null == cartItemListState
          ? _value.cartItemListState
          : cartItemListState // ignore: cast_nullable_to_non_nullable
              as UiState<List<AddToCartArgs>>,
    ));
  }
}

/// @nodoc

class _$CartDetailStateImpl implements _CartDetailState {
  _$CartDetailStateImpl({this.cartItemListState = const UiState.idle()});

  @override
  @JsonKey()
  final UiState<List<AddToCartArgs>> cartItemListState;

  @override
  String toString() {
    return 'CartDetailState(cartItemListState: $cartItemListState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartDetailStateImpl &&
            (identical(other.cartItemListState, cartItemListState) ||
                other.cartItemListState == cartItemListState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartItemListState);

  /// Create a copy of CartDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartDetailStateImplCopyWith<_$CartDetailStateImpl> get copyWith =>
      __$$CartDetailStateImplCopyWithImpl<_$CartDetailStateImpl>(
          this, _$identity);
}

abstract class _CartDetailState implements CartDetailState {
  factory _CartDetailState(
          {final UiState<List<AddToCartArgs>> cartItemListState}) =
      _$CartDetailStateImpl;

  @override
  UiState<List<AddToCartArgs>> get cartItemListState;

  /// Create a copy of CartDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartDetailStateImplCopyWith<_$CartDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
