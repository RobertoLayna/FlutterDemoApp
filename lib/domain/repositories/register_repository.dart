import 'package:aplicaciones_moviles_app/domain/models/register_model.dart';

abstract class RegisterRepository {
  Future<void> submitUser(RegisterModel user);
}
