import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transisi/app/bloc/auth/auth_bloc.dart';
import 'package:transisi/app/bloc/employe/create_employe/employe_bloc.dart';
import 'package:transisi/app/bloc/employe/get_employe/employe_bloc.dart';
import 'package:transisi/app/bloc/employe/get_employes/employes_bloc.dart';
import 'package:transisi/app/screens/home/child/success.dart';
import 'package:transisi/app/screens/home/create_page.dart';
import 'package:transisi/app/screens/home/detail_page.dart';
import 'package:transisi/app/screens/home/home_page.dart';
import 'package:transisi/app/screens/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => EmployeBloc(),
        ),
        BlocProvider(
          create: (context) => EmpBloc(),
        ),
      ],
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) => MaterialApp(
          title: 'Transisi',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
          ),
          home: state is AuthSuccess ? const HomePage() : LoginPage(),
          routes: {
            DetailPage.routeName: (context) => DetailPage(),
            CreatePage.routeName: (context) => CreatePage(),
            LoginPage.routeName: (context) => const LoginPage(),
            HomePage.routeName: (context) => const HomePage(),
          },
        ),
      ),
    );
  }
}
