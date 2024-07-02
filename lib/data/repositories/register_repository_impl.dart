import 'package:aplicaciones_moviles_app/domain/models/register_model.dart';
import 'package:aplicaciones_moviles_app/domain/repositories/register_repository.dart';
import 'package:dio/dio.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final Dio _dio = Dio();

  @override
  Future<void> submitUser(RegisterModel register) async {
    try {
      await _dio.post('TODO: url', data: register.toJson());
    } catch (e) {
      print(e);
      throw Exception('Failed to submit Register');
    }
  }
}
