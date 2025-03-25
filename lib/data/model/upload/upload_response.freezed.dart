// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UploadResponse _$UploadResponseFromJson(Map<String, dynamic> json) {
  return _AssetResponse.fromJson(json);
}

/// @nodoc
mixin _$UploadResponse {
  bool get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this UploadResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadResponseCopyWith<UploadResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadResponseCopyWith<$Res> {
  factory $UploadResponseCopyWith(
    UploadResponse value,
    $Res Function(UploadResponse) then,
  ) = _$UploadResponseCopyWithImpl<$Res, UploadResponse>;
  @useResult
  $Res call({bool error, String message});
}

/// @nodoc
class _$UploadResponseCopyWithImpl<$Res, $Val extends UploadResponse>
    implements $UploadResponseCopyWith<$Res> {
  _$UploadResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null, Object? message = null}) {
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AssetResponseImplCopyWith<$Res>
    implements $UploadResponseCopyWith<$Res> {
  factory _$$AssetResponseImplCopyWith(
    _$AssetResponseImpl value,
    $Res Function(_$AssetResponseImpl) then,
  ) = __$$AssetResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool error, String message});
}

/// @nodoc
class __$$AssetResponseImplCopyWithImpl<$Res>
    extends _$UploadResponseCopyWithImpl<$Res, _$AssetResponseImpl>
    implements _$$AssetResponseImplCopyWith<$Res> {
  __$$AssetResponseImplCopyWithImpl(
    _$AssetResponseImpl _value,
    $Res Function(_$AssetResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null, Object? message = null}) {
    return _then(
      _$AssetResponseImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetResponseImpl implements _AssetResponse {
  const _$AssetResponseImpl({required this.error, required this.message});

  factory _$AssetResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetResponseImplFromJson(json);

  @override
  final bool error;
  @override
  final String message;

  @override
  String toString() {
    return 'UploadResponse(error: $error, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetResponseImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, error, message);

  /// Create a copy of UploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetResponseImplCopyWith<_$AssetResponseImpl> get copyWith =>
      __$$AssetResponseImplCopyWithImpl<_$AssetResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetResponseImplToJson(this);
  }
}

abstract class _AssetResponse implements UploadResponse {
  const factory _AssetResponse({
    required final bool error,
    required final String message,
  }) = _$AssetResponseImpl;

  factory _AssetResponse.fromJson(Map<String, dynamic> json) =
      _$AssetResponseImpl.fromJson;

  @override
  bool get error;
  @override
  String get message;

  /// Create a copy of UploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetResponseImplCopyWith<_$AssetResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
