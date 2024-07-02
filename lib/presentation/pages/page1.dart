import 'package:aplicaciones_moviles_app/data/repositories/form_repository_impl.dart';
import 'package:aplicaciones_moviles_app/domain/models/form_model.dart';
import 'package:aplicaciones_moviles_app/domain/usecases/load_form_data.dart';
import 'package:aplicaciones_moviles_app/domain/usecases/register_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/form_bloc.dart';
import '../bloc/form_event.dart';
import '../bloc/form_state.dart' as bstate;

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //1 Provider de datos libreria bloc
      create: (context) => FormBloc(
          // Clase bloc la vista ejemplo "UserBloc"
          LoadFormData(
              FormRepositoryImpl()) // Repo de Impl  ejemplo "UserReposImpl"
          )
        ..add(LoadFormDataEvent()), // Event del bloc "LoadUserDataEvent"
      child: Scaffold(
        appBar: AppBar(
          title: Text('Formulario'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<FormBloc, bstate.FormState>(
            //2 Hacer uso de Bloc y State en builder de la libreria
            builder: (context, state) {
              TextEditingController nameController =
                  TextEditingController(text: state.name);
              TextEditingController surnameController =
                  TextEditingController(text: state.surname);
              TextEditingController emailController =
                  TextEditingController(text: state.email);
              TextEditingController phoneController =
                  TextEditingController(text: state.phone);
              TextEditingController countryController =
                  TextEditingController(text: state.country);
              TextEditingController rfcController =
                  TextEditingController(text: state.rfc);
              return Form(
                child: ListView(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'Nombre'),
                      onChanged: (value) {
                        context.read<FormBloc>().add(NameChanged(value));
                      },
                    ),
                    Text(state.email),
                    Checkbox(
                        value: state.isValid,
                        onChanged: (value) {
                          context
                              .read<FormBloc>()
                              .add(TermsAcceptedChanged(value!));
                        }),
                    TextFormField(
                      controller: surnameController,
                      decoration: InputDecoration(labelText: 'Apellidos'),
                      onChanged: (value) {
                        context.read<FormBloc>().add(SurnameChanged(value));
                      },
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        context.read<FormBloc>().add(EmailChanged(value));
                      },
                    ),
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(labelText: 'Teléfono'),
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        context.read<FormBloc>().add(PhoneChanged(value));
                      },
                    ),
                    ListTile(
                      title: Text(state.birthDate == null
                          ? 'Seleccione su fecha de nacimiento'
                          : 'Fecha de nacimiento: ${state.birthDate!.toLocal()}'
                              .split(' ')[0]),
                      trailing: Icon(Icons.calendar_today),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          context
                              .read<FormBloc>()
                              .add(BirthDateChanged(pickedDate));
                        }
                      },
                    ),
                    TextFormField(
                      controller: countryController,
                      decoration: InputDecoration(labelText: 'País'),
                      onChanged: (value) {
                        context.read<FormBloc>().add(CountryChanged(value));
                      },
                    ),
                    TextFormField(
                      controller: rfcController,
                      decoration: InputDecoration(labelText: 'RFC'),
                      onChanged: (value) {
                        context.read<FormBloc>().add(RfcChanged(value));
                      },
                    ),
                    CheckboxListTile(
                      title: Text('Aceptar términos y condiciones'),
                      value: state.termsAccepted,
                      onChanged: (value) {
                        context
                            .read<FormBloc>()
                            .add(TermsAcceptedChanged(value!));
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //8
                      },
                      child: Text('Enviar'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
