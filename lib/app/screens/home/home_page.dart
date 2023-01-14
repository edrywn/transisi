import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:transisi/app/bloc/employe/get_employes/employes_bloc.dart';
import 'package:transisi/app/screens/home/create_page.dart';
import 'package:transisi/app/utilities/theme.dart';

import '../../../data/model/employe_model.dart';
import 'child/list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = 'homePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final employeBloc = BlocProvider.of<EmployeBloc>(context);
    employeBloc.add(GetEmployeEventList(page));
    _onScroll() {
      setState(() {
        page = page + 1;
      });
      employeBloc.add(GetScrollEmployeEventList(page));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Employe"),
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(CreatePage.routeName);
        },
      ),
      body: BlocBuilder<EmployeBloc, EmployeState>(
        builder: (context, state) {
          if (state is EmployeInitial) {
            return Center(
                child: SizedBox(
              child: Lottie.asset("lottie/loading.zip", width: 250),
            ));
          } else if (state is EmployeLoading) {
            return Center(
                child: SizedBox(
              child: Lottie.asset("lottie/loading.zip", width: 250),
            ));
          } else if (state is EmployeLoaded) {
            return ListEmploye(
              state: state,
            );
          } else {
            return const Center(
                child: SizedBox(
              child: Text("Error"),
            ));
          }
        },
      ),
    );
  }
}
