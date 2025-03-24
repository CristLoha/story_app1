// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stories_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StoriesResponse _$StoriesResponseFromJson(Map<String, dynamic> json) {
  return _StoriesResponse.fromJson(json);
}

/// @nodoc
mixin _$StoriesResponse {
  bool get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<Story> get listStory => throw _privateConstructorUsedError;

  /// Serializes this StoriesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoriesResponseCopyWith<StoriesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoriesResponseCopyWith<$Res> {
  factory $StoriesResponseCopyWith(
    StoriesResponse value,
    $Res Function(StoriesResponse) then,
  ) = _$StoriesResponseCopyWithImpl<$Res, StoriesResponse>;
  @useResult
  $Res call({bool error, String message, List<Story> listStory});
}

/// @nodoc
class _$StoriesResponseCopyWithImpl<$Res, $Val extends StoriesResponse>
    implements $StoriesResponseCopyWith<$Res> {
  _$StoriesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? listStory = null,
  }) {
    return _then(
      _value.copyWith(
            error:
                null == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as bool,
            message:
                null == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String,
            listStory:
                null == listStory
                    ? _value.listStory
                    : listStory // ignore: cast_nullable_to_non_nullable
                        as List<Story>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StoriesResponseImplCopyWith<$Res>
    implements $StoriesResponseCopyWith<$Res> {
  factory _$$StoriesResponseImplCopyWith(
    _$StoriesResponseImpl value,
    $Res Function(_$StoriesResponseImpl) then,
  ) = __$$StoriesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool error, String message, List<Story> listStory});
}

/// @nodoc
class __$$StoriesResponseImplCopyWithImpl<$Res>
    extends _$StoriesResponseCopyWithImpl<$Res, _$StoriesResponseImpl>
    implements _$$StoriesResponseImplCopyWith<$Res> {
  __$$StoriesResponseImplCopyWithImpl(
    _$StoriesResponseImpl _value,
    $Res Function(_$StoriesResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? listStory = null,
  }) {
    return _then(
      _$StoriesResponseImpl(
        error:
            null == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as bool,
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
        listStory:
            null == listStory
                ? _value._listStory
                : listStory // ignore: cast_nullable_to_non_nullable
                    as List<Story>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StoriesResponseImpl implements _StoriesResponse {
  const _$StoriesResponseImpl({
    required this.error,
    required this.message,
    required final List<Story> listStory,
  }) : _listStory = listStory;

  factory _$StoriesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoriesResponseImplFromJson(json);

  @override
  final bool error;
  @override
  final String message;
  final List<Story> _listStory;
  @override
  List<Story> get listStory {
    if (_listStory is EqualUnmodifiableListView) return _listStory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listStory);
  }

  @override
  String toString() {
    return 'StoriesResponse(error: $error, message: $message, listStory: $listStory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoriesResponseImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(
              other._listStory,
              _listStory,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    error,
    message,
    const DeepCollectionEquality().hash(_listStory),
  );

  /// Create a copy of StoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoriesResponseImplCopyWith<_$StoriesResponseImpl> get copyWith =>
      __$$StoriesResponseImplCopyWithImpl<_$StoriesResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StoriesResponseImplToJson(this);
  }
}

abstract class _StoriesResponse implements StoriesResponse {
  const factory _StoriesResponse({
    required final bool error,
    required final String message,
    required final List<Story> listStory,
  }) = _$StoriesResponseImpl;

  factory _StoriesResponse.fromJson(Map<String, dynamic> json) =
      _$StoriesResponseImpl.fromJson;

  @override
  bool get error;
  @override
  String get message;
  @override
  List<Story> get listStory;

  /// Create a copy of StoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoriesResponseImplCopyWith<_$StoriesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
