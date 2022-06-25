// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      overview: json['overview'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      genreIds:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      originalTitle: json['original_title'] as String?,
      posterPath: json['poster_path'] as String?,
      video: json['video'] as bool?,
      id: json['id'] as int?,
      mediaType: json['media_type'] as String?,
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
      'video': instance.video,
      'id': instance.id,
      'media_type': instance.mediaType,
    };
