import 'package:ecommerce_final_task/presentation/auth/bloc/login/login_bloc.dart';
import 'package:ecommerce_final_task/presentation/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const MaterialApp(
        home: LandingPage(),
      ),
    );
  }
}
