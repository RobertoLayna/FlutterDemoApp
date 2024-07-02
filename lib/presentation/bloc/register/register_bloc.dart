import 'package:aplicaciones_moviles_app/domain/usecases/register_user.dart';
import 'package:aplicaciones_moviles_app/presentation/bloc/register/register_event.dart';
import 'package:aplicaciones_moviles_app/presentation/bloc/register/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final SubmitRegister submitRegister;

  RegisterBloc(this.submitRegister) : super(RegisterInitial()) {
    on<SubmitRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        await submitRegister(event.register);
        emit(RegisterSuccess());
      } catch (e) {
        emit(RegisterError('Failed to submit Register'));
      }
    });
  }
}
