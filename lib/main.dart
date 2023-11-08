import 'package:ecommerce_final_task/presentation/auth/bloc/login/login_bloc.dart';
import 'package:ecommerce_final_task/presentation/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/auth/bloc/register/register_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
      ],
      child: const MaterialApp(
        home: LandingPage(),
      ),
    );
  }
}
