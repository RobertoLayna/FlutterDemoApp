import 'package:aplicaciones_moviles_app/domain/models/register_model.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class SubmitRegisterEvent extends RegisterEvent {
  final RegisterModel register;

  const SubmitRegisterEvent(this.register);

  @override
  List<Object> get props => [register];
}
