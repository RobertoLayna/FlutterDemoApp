// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormModel _$FormModelFromJson(Map<String, dynamic> json) => FormModel(
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      country: json['country'] as String,
      rfc: json['rfc'] as String,
      termsAccepted: json['termsAccepted'] as bool,
    );

Map<String, dynamic> _$FormModelToJson(FormModel instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'phone': instance.phone,
      'birthDate': instance.birthDate.toIso8601String(),
      'country': instance.country,
      'rfc': instance.rfc,
      'termsAccepted': instance.termsAccepted,
    };
