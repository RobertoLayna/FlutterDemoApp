import 'package:aplicaciones_moviles_app/domain/models/form_model.dart';
import 'package:aplicaciones_moviles_app/domain/repositories/form_repository.dart';

class LoadFormData {
  final FormRepository repository;

  LoadFormData(this.repository);

  Future<FormModel> call() async {
    final formData = await repository.loadFormData();

    // Validaciones
    if (formData.name.isEmpty) {
      throw Exception("Name cannot be empty");
    }
    if (formData.surname.isEmpty) {
      throw Exception("Surname cannot be empty");
    }
    if (formData.email.isEmpty) {
      throw Exception("Email cannot be empty");
    }
    if (formData.phone.isEmpty) {
      throw Exception("Phone cannot be empty");
    }
    if (formData.birthDate == null) {
      throw Exception("Birth date cannot be null");
    }
    if (formData.country.isEmpty) {
      throw Exception("Country cannot be empty");
    }
    if (formData.rfc.isEmpty) {
      throw Exception("RFC cannot be empty");
    }
    if (!formData.termsAccepted) {
      throw Exception("Terms must be accepted");
    }

    return formData;
  }
}


/**
 * Los casos de uso en la arquitectura limpia no solo se limitan a llamar a otras funciones. 
 * Pueden realizar una variedad de tareas que encapsulan la lógica de negocio y las 
 * reglas del dominio de la aplicación.
 * 
 * 1. Validaciones
 * 2. Transformaciones de Datos
 * 3. Coordinación de Múltiples Repositorios
 * 4. Manejo de Excepciones
 */