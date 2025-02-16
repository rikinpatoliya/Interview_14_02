// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardState {
  UiState<List<ProductListResponse>> get uiProductListState =>
      throw _privateConstructorUsedError;
  UiState<String> get uiLogoutState => throw _privateConstructorUsedError;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardStateCopyWith<DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res, DashboardState>;
  @useResult
  $Res call(
      {UiState<List<ProductListResponse>> uiProductListState,
      UiState<String> uiLogoutState});

  $UiStateCopyWith<List<ProductListResponse>, $Res> get uiProductListState;
  $UiStateCopyWith<String, $Res> get uiLogoutState;
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res, $Val extends DashboardState>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uiProductListState = null,
    Object? uiLogoutState = null,
  }) {
    return _then(_value.copyWith(
      uiProductListState: null == uiProductListState
          ? _value.uiProductListState
          : uiProductListState // ignore: cast_nullable_to_non_nullable
              as UiState<List<ProductListResponse>>,
      uiLogoutState: null == uiLogoutState
          ? _value.uiLogoutState
          : uiLogoutState // ignore: cast_nullable_to_non_nullable
              as UiState<String>,
    ) as $Val);
  }

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UiStateCopyWith<List<ProductListResponse>, $Res> get uiProductListState {
    return $UiStateCopyWith<List<ProductListResponse>, $Res>(
        _value.uiProductListState, (value) {
      return _then(_value.copyWith(uiProductListState: value) as $Val);
    });
  }

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UiStateCopyWith<String, $Res> get uiLogoutState {
    return $UiStateCopyWith<String, $Res>(_value.uiLogoutState, (value) {
      return _then(_value.copyWith(uiLogoutState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardStateImplCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$$DashboardStateImplCopyWith(_$DashboardStateImpl value,
          $Res Function(_$DashboardStateImpl) then) =
      __$$DashboardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UiState<List<ProductListResponse>> uiProductListState,
      UiState<String> uiLogoutState});

  @override
  $UiStateCopyWith<List<ProductListResponse>, $Res> get uiProductListState;
  @override
  $UiStateCopyWith<String, $Res> get uiLogoutState;
}

/// @nodoc
class __$$DashboardStateImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$DashboardStateImpl>
    implements _$$DashboardStateImplCopyWith<$Res> {
  __$$DashboardStateImplCopyWithImpl(
      _$DashboardStateImpl _value, $Res Function(_$DashboardStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uiProductListState = null,
    Object? uiLogoutState = null,
  }) {
    return _then(_$DashboardStateImpl(
      uiProductListState: null == uiProductListState
          ? _value.uiProductListState
          : uiProductListState // ignore: cast_nullable_to_non_nullable
              as UiState<List<ProductListResponse>>,
      uiLogoutState: null == uiLogoutState
          ? _value.uiLogoutState
          : uiLogoutState // ignore: cast_nullable_to_non_nullable
              as UiState<String>,
    ));
  }
}

/// @nodoc

class _$DashboardStateImpl implements _DashboardState {
  _$DashboardStateImpl(
      {this.uiProductListState = const UiState.idle(),
      this.uiLogoutState = const UiState.idle()});

  @override
  @JsonKey()
  final UiState<List<ProductListResponse>> uiProductListState;
  @override
  @JsonKey()
  final UiState<String> uiLogoutState;

  @override
  String toString() {
    return 'DashboardState(uiProductListState: $uiProductListState, uiLogoutState: $uiLogoutState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStateImpl &&
            (identical(other.uiProductListState, uiProductListState) ||
                other.uiProductListState == uiProductListState) &&
            (identical(other.uiLogoutState, uiLogoutState) ||
                other.uiLogoutState == uiLogoutState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, uiProductListState, uiLogoutState);

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStateImplCopyWith<_$DashboardStateImpl> get copyWith =>
      __$$DashboardStateImplCopyWithImpl<_$DashboardStateImpl>(
          this, _$identity);
}

abstract class _DashboardState implements DashboardState {
  factory _DashboardState(
      {final UiState<List<ProductListResponse>> uiProductListState,
      final UiState<String> uiLogoutState}) = _$DashboardStateImpl;

  @override
  UiState<List<ProductListResponse>> get uiProductListState;
  @override
  UiState<String> get uiLogoutState;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardStateImplCopyWith<_$DashboardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
