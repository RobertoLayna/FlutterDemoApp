import 'package:json_annotation/json_annotation.dart';

part 'form_model.g.dart';

@JsonSerializable()
class FormModel {
  String name;
  String surname;
  String email;
  String phone;
  DateTime birthDate;
  String country;
  String rfc;
  bool termsAccepted;

  FormModel({
    required this.name,
    required this.surname,
    required this.email,
    required this.phone,
    required this.birthDate,
    required this.country,
    required this.rfc,
    required this.termsAccepted,
  });

  factory FormModel.fromJson(Map<String, dynamic> json) => _$FormModelFromJson(json);

  Map<String, dynamic> toJson() => _$FormModelToJson(this);
}
