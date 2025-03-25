// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stories_result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$StoriesResultState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Story> data) loaded,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Story> data)? loaded,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Story> data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoriesResultStateInitial value) initial,
    required TResult Function(StoriesResultStateLoading value) loading,
    required TResult Function(StoriesResultStateLoaded value) loaded,
    required TResult Function(StoriesResultStateError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoriesResultStateInitial value)? initial,
    TResult? Function(StoriesResultStateLoading value)? loading,
    TResult? Function(StoriesResultStateLoaded value)? loaded,
    TResult? Function(StoriesResultStateError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoriesResultStateInitial value)? initial,
    TResult Function(StoriesResultStateLoading value)? loading,
    TResult Function(StoriesResultStateLoaded value)? loaded,
    TResult Function(StoriesResultStateError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoriesResultStateCopyWith<$Res> {
  factory $StoriesResultStateCopyWith(
    StoriesResultState value,
    $Res Function(StoriesResultState) then,
  ) = _$StoriesResultStateCopyWithImpl<$Res, StoriesResultState>;
}

/// @nodoc
class _$StoriesResultStateCopyWithImpl<$Res, $Val extends StoriesResultState>
    implements $StoriesResultStateCopyWith<$Res> {
  _$StoriesResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoriesResultState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StoriesResultStateInitialImplCopyWith<$Res> {
  factory _$$StoriesResultStateInitialImplCopyWith(
    _$StoriesResultStateInitialImpl value,
    $Res Function(_$StoriesResultStateInitialImpl) then,
  ) = __$$StoriesResultStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StoriesResultStateInitialImplCopyWithImpl<$Res>
    extends
        _$StoriesResultStateCopyWithImpl<$Res, _$StoriesResultStateInitialImpl>
    implements _$$StoriesResultStateInitialImplCopyWith<$Res> {
  __$$StoriesResultStateInitialImplCopyWithImpl(
    _$StoriesResultStateInitialImpl _value,
    $Res Function(_$StoriesResultStateInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StoriesResultState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StoriesResultStateInitialImpl
    with DiagnosticableTreeMixin
    implements StoriesResultStateInitial {
  const _$StoriesResultStateInitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoriesResultState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'StoriesResultState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoriesResultStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Story> data) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Story> data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Story> data)? loaded,
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
    required TResult Function(StoriesResultStateInitial value) initial,
    required TResult Function(StoriesResultStateLoading value) loading,
    required TResult Function(StoriesResultStateLoaded value) loaded,
    required TResult Function(StoriesResultStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoriesResultStateInitial value)? initial,
    TResult? Function(StoriesResultStateLoading value)? loading,
    TResult? Function(StoriesResultStateLoaded value)? loaded,
    TResult? Function(StoriesResultStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoriesResultStateInitial value)? initial,
    TResult Function(StoriesResultStateLoading value)? loading,
    TResult Function(StoriesResultStateLoaded value)? loaded,
    TResult Function(StoriesResultStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class StoriesResultStateInitial implements StoriesResultState {
  const factory StoriesResultStateInitial() = _$StoriesResultStateInitialImpl;
}

/// @nodoc
abstract class _$$StoriesResultStateLoadingImplCopyWith<$Res> {
  factory _$$StoriesResultStateLoadingImplCopyWith(
    _$StoriesResultStateLoadingImpl value,
    $Res Function(_$StoriesResultStateLoadingImpl) then,
  ) = __$$StoriesResultStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StoriesResultStateLoadingImplCopyWithImpl<$Res>
    extends
        _$StoriesResultStateCopyWithImpl<$Res, _$StoriesResultStateLoadingImpl>
    implements _$$StoriesResultStateLoadingImplCopyWith<$Res> {
  __$$StoriesResultStateLoadingImplCopyWithImpl(
    _$StoriesResultStateLoadingImpl _value,
    $Res Function(_$StoriesResultStateLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StoriesResultState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StoriesResultStateLoadingImpl
    with DiagnosticableTreeMixin
    implements StoriesResultStateLoading {
  const _$StoriesResultStateLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoriesResultState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'StoriesResultState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoriesResultStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Story> data) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Story> data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Story> data)? loaded,
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
    required TResult Function(StoriesResultStateInitial value) initial,
    required TResult Function(StoriesResultStateLoading value) loading,
    required TResult Function(StoriesResultStateLoaded value) loaded,
    required TResult Function(StoriesResultStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoriesResultStateInitial value)? initial,
    TResult? Function(StoriesResultStateLoading value)? loading,
    TResult? Function(StoriesResultStateLoaded value)? loaded,
    TResult? Function(StoriesResultStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoriesResultStateInitial value)? initial,
    TResult Function(StoriesResultStateLoading value)? loading,
    TResult Function(StoriesResultStateLoaded value)? loaded,
    TResult Function(StoriesResultStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class StoriesResultStateLoading implements StoriesResultState {
  const factory StoriesResultStateLoading() = _$StoriesResultStateLoadingImpl;
}

/// @nodoc
abstract class _$$StoriesResultStateLoadedImplCopyWith<$Res> {
  factory _$$StoriesResultStateLoadedImplCopyWith(
    _$StoriesResultStateLoadedImpl value,
    $Res Function(_$StoriesResultStateLoadedImpl) then,
  ) = __$$StoriesResultStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Story> data});
}

/// @nodoc
class __$$StoriesResultStateLoadedImplCopyWithImpl<$Res>
    extends
        _$StoriesResultStateCopyWithImpl<$Res, _$StoriesResultStateLoadedImpl>
    implements _$$StoriesResultStateLoadedImplCopyWith<$Res> {
  __$$StoriesResultStateLoadedImplCopyWithImpl(
    _$StoriesResultStateLoadedImpl _value,
    $Res Function(_$StoriesResultStateLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StoriesResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _$StoriesResultStateLoadedImpl(
        null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                as List<Story>,
      ),
    );
  }
}

/// @nodoc

class _$StoriesResultStateLoadedImpl
    with DiagnosticableTreeMixin
    implements StoriesResultStateLoaded {
  const _$StoriesResultStateLoadedImpl(final List<Story> data) : _data = data;

  final List<Story> _data;
  @override
  List<Story> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoriesResultState.loaded(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StoriesResultState.loaded'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoriesResultStateLoadedImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of StoriesResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoriesResultStateLoadedImplCopyWith<_$StoriesResultStateLoadedImpl>
  get copyWith => __$$StoriesResultStateLoadedImplCopyWithImpl<
    _$StoriesResultStateLoadedImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Story> data) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Story> data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Story> data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoriesResultStateInitial value) initial,
    required TResult Function(StoriesResultStateLoading value) loading,
    required TResult Function(StoriesResultStateLoaded value) loaded,
    required TResult Function(StoriesResultStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoriesResultStateInitial value)? initial,
    TResult? Function(StoriesResultStateLoading value)? loading,
    TResult? Function(StoriesResultStateLoaded value)? loaded,
    TResult? Function(StoriesResultStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoriesResultStateInitial value)? initial,
    TResult Function(StoriesResultStateLoading value)? loading,
    TResult Function(StoriesResultStateLoaded value)? loaded,
    TResult Function(StoriesResultStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class StoriesResultStateLoaded implements StoriesResultState {
  const factory StoriesResultStateLoaded(final List<Story> data) =
      _$StoriesResultStateLoadedImpl;

  List<Story> get data;

  /// Create a copy of StoriesResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoriesResultStateLoadedImplCopyWith<_$StoriesResultStateLoadedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoriesResultStateErrorImplCopyWith<$Res> {
  factory _$$StoriesResultStateErrorImplCopyWith(
    _$StoriesResultStateErrorImpl value,
    $Res Function(_$StoriesResultStateErrorImpl) then,
  ) = __$$StoriesResultStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$StoriesResultStateErrorImplCopyWithImpl<$Res>
    extends
        _$StoriesResultStateCopyWithImpl<$Res, _$StoriesResultStateErrorImpl>
    implements _$$StoriesResultStateErrorImplCopyWith<$Res> {
  __$$StoriesResultStateErrorImplCopyWithImpl(
    _$StoriesResultStateErrorImpl _value,
    $Res Function(_$StoriesResultStateErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StoriesResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$StoriesResultStateErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$StoriesResultStateErrorImpl
    with DiagnosticableTreeMixin
    implements StoriesResultStateError {
  const _$StoriesResultStateErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoriesResultState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StoriesResultState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoriesResultStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of StoriesResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoriesResultStateErrorImplCopyWith<_$StoriesResultStateErrorImpl>
  get copyWith => __$$StoriesResultStateErrorImplCopyWithImpl<
    _$StoriesResultStateErrorImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Story> data) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Story> data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Story> data)? loaded,
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
    required TResult Function(StoriesResultStateInitial value) initial,
    required TResult Function(StoriesResultStateLoading value) loading,
    required TResult Function(StoriesResultStateLoaded value) loaded,
    required TResult Function(StoriesResultStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoriesResultStateInitial value)? initial,
    TResult? Function(StoriesResultStateLoading value)? loading,
    TResult? Function(StoriesResultStateLoaded value)? loaded,
    TResult? Function(StoriesResultStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoriesResultStateInitial value)? initial,
    TResult Function(StoriesResultStateLoading value)? loading,
    TResult Function(StoriesResultStateLoaded value)? loaded,
    TResult Function(StoriesResultStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class StoriesResultStateError implements StoriesResultState {
  const factory StoriesResultStateError(final String message) =
      _$StoriesResultStateErrorImpl;

  String get message;

  /// Create a copy of StoriesResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoriesResultStateErrorImplCopyWith<_$StoriesResultStateErrorImpl>
  get copyWith => throw _privateConstructorUsedError;
}
