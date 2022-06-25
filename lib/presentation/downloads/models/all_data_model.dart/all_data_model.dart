import 'package:json_annotation/json_annotation.dart';
import 'package:netflix/presentation/downloads/models/data_model/data_model.dart';

part 'all_data_model.g.dart';

@JsonSerializable()
class AllDataModel {
  @JsonKey(name: 'results')
  List<DataModel> results;

  AllDataModel({this.results = const []});

  factory AllDataModel.fromJson(Map<String, dynamic> json) {
    return _$AllDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AllDataModelToJson(this);
}
