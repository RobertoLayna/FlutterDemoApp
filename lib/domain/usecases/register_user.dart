import 'package:aplicaciones_moviles_app/domain/models/register_model.dart';
import 'package:aplicaciones_moviles_app/domain/repositories/register_repository.dart';


class SubmitRegister {
  final RegisterRepository repository;

  SubmitRegister(this.repository);

  Future<void> call(RegisterModel register) async {
    await repository.submitUser(register);
  }
}
