import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aplicaciones_moviles_app/data/repositories/form_repository_impl.dart';
import 'package:aplicaciones_moviles_app/domain/usecases/load_form_data.dart';
import 'package:aplicaciones_moviles_app/presentation/bloc/form_bloc.dart';
import 'package:aplicaciones_moviles_app/presentation/bloc/form_event.dart';
import 'presentation/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Aplicaciones Moviles 2',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      );
  }
}
