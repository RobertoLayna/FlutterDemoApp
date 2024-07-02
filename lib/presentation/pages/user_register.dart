import 'package:aplicaciones_moviles_app/data/repositories/register_repository_impl.dart';
import 'package:aplicaciones_moviles_app/domain/models/register_model.dart';
import 'package:aplicaciones_moviles_app/domain/usecases/register_user.dart';
import 'package:aplicaciones_moviles_app/presentation/bloc/register/register_bloc.dart';
import 'package:aplicaciones_moviles_app/presentation/bloc/register/register_event.dart';
import 'package:aplicaciones_moviles_app/presentation/bloc/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page2 extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController rfcController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController idBankController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userRepository = RegisterRepositoryImpl();
    final submitUser = SubmitRegister(userRepository);
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit User Data'),
      ),
      body: Center(
        child: BlocProvider(
        create: (context) => RegisterBloc(submitUser),
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            if (state is RegisterInitial) {
              return buildForm(context);
            } else if (state is RegisterLoading) {
              return CircularProgressIndicator();
            } else if (state is RegisterSuccess) {
              return Text('Register data submitted successfully');
            } else if (state is RegisterError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message),
                  SizedBox(height: 16),
                  buildForm(context),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: lastnameController,
            decoration: InputDecoration(labelText: 'Lastname'),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: rfcController,
            decoration: InputDecoration(labelText: 'RFC'),
          ),
          TextField(
            controller: phoneController,
            decoration: InputDecoration(labelText: 'Phone'),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          TextField(
            controller: idBankController,
            decoration: InputDecoration(labelText: 'ID Bank'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final user = RegisterModel(
                name: nameController.text,
                lastname: lastnameController.text,
                email: emailController.text,
                rfc: rfcController.text,
                phone: phoneController.text,
                password: passwordController.text,
                idBank: int.parse(idBankController.text),
              );
              BlocProvider.of<RegisterBloc>(context).add(SubmitRegisterEvent(user));
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}