import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:transisi/app/bloc/employe/create_employe/employe_bloc.dart';
import 'package:transisi/app/screens/home/child/success.dart';
import 'package:transisi/app/screens/login/child/snackbar.dart';
import 'package:transisi/app/utilities/theme.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});
  static const routeName = 'create';

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final formKey = GlobalKey<FormState>();
  String? name;
  String? job;
  final createEmploye = CreteEmployeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => createEmploye,
      child: BlocBuilder<CreteEmployeBloc, CreateEmployeState>(
        builder: (context, state) {
          if (state is CreateEmployeInitial) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Create Employe'),
                backgroundColor: primaryColor,
                elevation: 0,
                actions: [
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        createEmploye
                            .add(GetCreteEmploye(name: name, job: job));
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: const Center(
                        child: Text(
                          "SAVE",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Padding(
                  padding: defaultPadding,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: primaryColor,
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 30,
                                  color: whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.person,
                              color: primaryColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Kolom ini harus diisi";
                                  }
                                },
                                onSaved: (String? value) {
                                  name = value;
                                },
                                decoration: const InputDecoration(
                                    border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: blackColor)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: primaryColor)),
                                    labelText: 'Name',
                                    labelStyle: TextStyle(
                                      color: blackColor,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.work,
                              color: primaryColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Kolom ini harus diisi";
                                  }
                                },
                                onSaved: (String? value) {
                                  job = value;
                                },
                                decoration: const InputDecoration(
                                    border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: blackColor)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: primaryColor)),
                                    labelText: 'Job',
                                    labelStyle: TextStyle(
                                      color: blackColor,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (state is CreateEmployeLoading) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: whiteColor,
              child: Center(
                  child: SizedBox(
                child: Lottie.asset("lottie/loading.zip", width: 250),
              )),
            );
          } else if (state is CreateEmployeSuccess) {
            return const successWidget();
          } else if (state is CreateEmployeError) {
            return snackBar(context, state.err.toString());
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
