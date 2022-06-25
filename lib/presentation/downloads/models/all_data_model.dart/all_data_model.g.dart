// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllDataModel _$AllDataModelFromJson(Map<String, dynamic> json) => AllDataModel(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => DataModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AllDataModelToJson(AllDataModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
