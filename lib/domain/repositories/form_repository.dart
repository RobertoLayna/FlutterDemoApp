import 'package:aplicaciones_moviles_app/domain/models/form_model.dart';

abstract class FormRepository {
  Future<FormModel> loadFormData();
}
