import 'package:json_annotation/json_annotation.dart';

part 'data_model.g.dart';

@JsonSerializable()
class DataModel {
  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'release_date')
  String? releaseDate;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'video')
  bool? video;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'media_type')
  String? mediaType;

  DataModel({
    this.overview,
    this.releaseDate,
    this.title,
    this.backdropPath,
    this.genreIds,
    this.originalTitle,
    this.posterPath,
    this.video,
    this.id,
    this.mediaType,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return _$DataModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
