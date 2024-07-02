import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:aplicaciones_moviles_app/domain/models/form_model.dart';
import 'package:aplicaciones_moviles_app/domain/repositories/form_repository.dart';
import 'package:dio/dio.dart';

class FormRepositoryImpl implements FormRepository {
  @override
  Future<FormModel> loadFormData() async {
    final response = await rootBundle.loadString('assets/form_data.json');
    final data = json.decode(response);
    print(data);
    return FormModel.fromJson(data);
  }

}
