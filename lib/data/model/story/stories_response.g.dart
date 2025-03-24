// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoriesResponseImpl _$$StoriesResponseImplFromJson(
  Map<String, dynamic> json,
) => _$StoriesResponseImpl(
  error: json['error'] as bool,
  message: json['message'] as String,
  listStory:
      (json['listStory'] as List<dynamic>)
          .map((e) => Story.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$StoriesResponseImplToJson(
  _$StoriesResponseImpl instance,
) => <String, dynamic>{
  'error': instance.error,
  'message': instance.message,
  'listStory': instance.listStory,
};
