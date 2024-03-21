import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cubits/contacts_cubit.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ContactsCubit>(
          create: (BuildContext context) => ContactsCubit(),
        ),
      ],
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}
