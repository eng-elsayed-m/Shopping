library home_response;

import 'package:rzq_customer/model/home/widgets.dart';

import 'package:json_annotation/json_annotation.dart';

part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse {
  bool? hasWidgets;
  bool? hasSections;
  List<Widgets>? widgets;
  List<Object>? sections;

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);

  static const fromJsonFactory = _$HomeResponseFromJson;

  HomeResponse();

  @override
  String toString() {
    return 'HomeResponse{has_widgets: $hasWidgets, has_sections: $hasSections, widgets: $widgets, sections: $sections}';
  }
}
