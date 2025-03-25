// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RegisterResultState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) loaded,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? loaded,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterInitialState value) initial,
    required TResult Function(RegisterLoadingState value) loading,
    required TResult Function(RegisterLoadedState value) loaded,
    required TResult Function(RegisterErrorState value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterInitialState value)? initial,
    TResult? Function(RegisterLoadingState value)? loading,
    TResult? Function(RegisterLoadedState value)? loaded,
    TResult? Function(RegisterErrorState value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterInitialState value)? initial,
    TResult Function(RegisterLoadingState value)? loading,
    TResult Function(RegisterLoadedState value)? loaded,
    TResult Function(RegisterErrorState value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterResultStateCopyWith<$Res> {
  factory $RegisterResultStateCopyWith(
    RegisterResultState value,
    $Res Function(RegisterResultState) then,
  ) = _$RegisterResultStateCopyWithImpl<$Res, RegisterResultState>;
}

/// @nodoc
class _$RegisterResultStateCopyWithImpl<$Res, $Val extends RegisterResultState>
    implements $RegisterResultStateCopyWith<$Res> {
  _$RegisterResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterResultState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RegisterInitialStateImplCopyWith<$Res> {
  factory _$$RegisterInitialStateImplCopyWith(
    _$RegisterInitialStateImpl value,
    $Res Function(_$RegisterInitialStateImpl) then,
  ) = __$$RegisterInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterInitialStateImplCopyWithImpl<$Res>
    extends _$RegisterResultStateCopyWithImpl<$Res, _$RegisterInitialStateImpl>
    implements _$$RegisterInitialStateImplCopyWith<$Res> {
  __$$RegisterInitialStateImplCopyWithImpl(
    _$RegisterInitialStateImpl _value,
    $Res Function(_$RegisterInitialStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterResultState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RegisterInitialStateImpl implements RegisterInitialState {
  const _$RegisterInitialStateImpl();

  @override
  String toString() {
    return 'RegisterResultState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterInitialState value) initial,
    required TResult Function(RegisterLoadingState value) loading,
    required TResult Function(RegisterLoadedState value) loaded,
    required TResult Function(RegisterErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterInitialState value)? initial,
    TResult? Function(RegisterLoadingState value)? loading,
    TResult? Function(RegisterLoadedState value)? loaded,
    TResult? Function(RegisterErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterInitialState value)? initial,
    TResult Function(RegisterLoadingState value)? loading,
    TResult Function(RegisterLoadedState value)? loaded,
    TResult Function(RegisterErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RegisterInitialState implements RegisterResultState {
  const factory RegisterInitialState() = _$RegisterInitialStateImpl;
}

/// @nodoc
abstract class _$$RegisterLoadingStateImplCopyWith<$Res> {
  factory _$$RegisterLoadingStateImplCopyWith(
    _$RegisterLoadingStateImpl value,
    $Res Function(_$RegisterLoadingStateImpl) then,
  ) = __$$RegisterLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterLoadingStateImplCopyWithImpl<$Res>
    extends _$RegisterResultStateCopyWithImpl<$Res, _$RegisterLoadingStateImpl>
    implements _$$RegisterLoadingStateImplCopyWith<$Res> {
  __$$RegisterLoadingStateImplCopyWithImpl(
    _$RegisterLoadingStateImpl _value,
    $Res Function(_$RegisterLoadingStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterResultState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RegisterLoadingStateImpl implements RegisterLoadingState {
  const _$RegisterLoadingStateImpl();

  @override
  String toString() {
    return 'RegisterResultState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterInitialState value) initial,
    required TResult Function(RegisterLoadingState value) loading,
    required TResult Function(RegisterLoadedState value) loaded,
    required TResult Function(RegisterErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterInitialState value)? initial,
    TResult? Function(RegisterLoadingState value)? loading,
    TResult? Function(RegisterLoadedState value)? loaded,
    TResult? Function(RegisterErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterInitialState value)? initial,
    TResult Function(RegisterLoadingState value)? loading,
    TResult Function(RegisterLoadedState value)? loaded,
    TResult Function(RegisterErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RegisterLoadingState implements RegisterResultState {
  const factory RegisterLoadingState() = _$RegisterLoadingStateImpl;
}

/// @nodoc
abstract class _$$RegisterLoadedStateImplCopyWith<$Res> {
  factory _$$RegisterLoadedStateImplCopyWith(
    _$RegisterLoadedStateImpl value,
    $Res Function(_$RegisterLoadedStateImpl) then,
  ) = __$$RegisterLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RegisterLoadedStateImplCopyWithImpl<$Res>
    extends _$RegisterResultStateCopyWithImpl<$Res, _$RegisterLoadedStateImpl>
    implements _$$RegisterLoadedStateImplCopyWith<$Res> {
  __$$RegisterLoadedStateImplCopyWithImpl(
    _$RegisterLoadedStateImpl _value,
    $Res Function(_$RegisterLoadedStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$RegisterLoadedStateImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$RegisterLoadedStateImpl implements RegisterLoadedState {
  const _$RegisterLoadedStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RegisterResultState.loaded(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterLoadedStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of RegisterResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterLoadedStateImplCopyWith<_$RegisterLoadedStateImpl> get copyWith =>
      __$$RegisterLoadedStateImplCopyWithImpl<_$RegisterLoadedStateImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterInitialState value) initial,
    required TResult Function(RegisterLoadingState value) loading,
    required TResult Function(RegisterLoadedState value) loaded,
    required TResult Function(RegisterErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterInitialState value)? initial,
    TResult? Function(RegisterLoadingState value)? loading,
    TResult? Function(RegisterLoadedState value)? loaded,
    TResult? Function(RegisterErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterInitialState value)? initial,
    TResult Function(RegisterLoadingState value)? loading,
    TResult Function(RegisterLoadedState value)? loaded,
    TResult Function(RegisterErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class RegisterLoadedState implements RegisterResultState {
  const factory RegisterLoadedState(final String message) =
      _$RegisterLoadedStateImpl;

  String get message;

  /// Create a copy of RegisterResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterLoadedStateImplCopyWith<_$RegisterLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterErrorStateImplCopyWith<$Res> {
  factory _$$RegisterErrorStateImplCopyWith(
    _$RegisterErrorStateImpl value,
    $Res Function(_$RegisterErrorStateImpl) then,
  ) = __$$RegisterErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RegisterErrorStateImplCopyWithImpl<$Res>
    extends _$RegisterResultStateCopyWithImpl<$Res, _$RegisterErrorStateImpl>
    implements _$$RegisterErrorStateImplCopyWith<$Res> {
  __$$RegisterErrorStateImplCopyWithImpl(
    _$RegisterErrorStateImpl _value,
    $Res Function(_$RegisterErrorStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$RegisterErrorStateImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$RegisterErrorStateImpl implements RegisterErrorState {
  const _$RegisterErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RegisterResultState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of RegisterResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterErrorStateImplCopyWith<_$RegisterErrorStateImpl> get copyWith =>
      __$$RegisterErrorStateImplCopyWithImpl<_$RegisterErrorStateImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterInitialState value) initial,
    required TResult Function(RegisterLoadingState value) loading,
    required TResult Function(RegisterLoadedState value) loaded,
    required TResult Function(RegisterErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterInitialState value)? initial,
    TResult? Function(RegisterLoadingState value)? loading,
    TResult? Function(RegisterLoadedState value)? loaded,
    TResult? Function(RegisterErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterInitialState value)? initial,
    TResult Function(RegisterLoadingState value)? loading,
    TResult Function(RegisterLoadedState value)? loaded,
    TResult Function(RegisterErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RegisterErrorState implements RegisterResultState {
  const factory RegisterErrorState(final String message) =
      _$RegisterErrorStateImpl;

  String get message;

  /// Create a copy of RegisterResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterErrorStateImplCopyWith<_$RegisterErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
