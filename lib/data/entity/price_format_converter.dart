import 'package:json_annotation/json_annotation.dart';

class PriceFormatConverter implements JsonConverter<double, dynamic> {
  const PriceFormatConverter();

  @override
  double fromJson(dynamic object) {
    if (object == null) {
      return 0.0;
    }
    if (object is String) {
      return double.parse(object);
    }
    if (object is int) {
      return object.toDouble();
    }
    return object as double;
  }

  @override
  dynamic toJson(double object) {
    return object;
  }
}
